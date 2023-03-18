import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Entity/Teacher/edit_question_model.dart';
import '../Entity/Teacher/response_entity.dart';
import '../Entity/get_question_model.dart';
import '../Entity/question_paper_model.dart';
import '../EntityModel/CreateAssessmentModel.dart';
import '../EntityModel/create_question_model.dart';
import '../EntityModel/getResultModel.dart';
import '../EntityModel/get_assessment_model.dart';
import '../EntityModel/login_entity.dart';
import '../EntityModel/post_assessment_model.dart';
import '../EntityModel/static_response.dart';
import '../EntityModel/student_registration_model.dart';
import '../EntityModel/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Entity/Teacher/question_entity.dart';
class QnaRepo {
  static logInUser(String email, String password,String? role) async {
    LoginModel loginModel = LoginModel(code: 0, message: 'message');
    SharedPreferences loginData=await SharedPreferences.getInstance();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://dev.qnatest.com/api/v1/users/login'));
    request.body = json.encode({"email": email, "password": password, "role": role});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String temp = await response.stream.bytesToString();
      print(temp);
      loginModel = loginModelFromJson(temp);
      //print(temp);
      loginData.setString('token', loginModel.data.accessToken);
    } else {
      print(response.reasonPhrase);
    }
    return loginModel;
  }

  static registerUserDetails(StudentRegistrationModel student) async {
    LoginModel loginModel = LoginModel(code: 0, message: 'message');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('https://dev.qnatest.com/api/v1/users'));
    request.body = studentRegistrationModelToJson(student);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      loginModel = loginModelFromJson(temp);
    } else {
      String temp = await response.stream.bytesToString();
      loginModel = loginModelFromJson(temp);
      return loginModel;
    }
    return loginModel;
  }

  static Future<UserDataModel> getUserData(int? userId) async {
    SharedPreferences loginData=await SharedPreferences.getInstance();
    UserDataModel userData = UserDataModel();
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}'
    };
    var request = http.Request(
        'GET', Uri.parse('https://dev.qnatest.com/api/v1/users/$userId'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      userData = userDataModelFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      getUserData(userId);
    }
    return userData;
  }

  static Future<StaticResponse> sendOtp(String email) async {
    StaticResponse responses =
        StaticResponse(code: 0, message: 'Incorrect Email');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://dev.qnatest.com/api/v1/users/forgot-password'));
    request.body = json.encode({"email": email});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      responses = staticResponseFromJson(temp);
    } else {
      print(response.reasonPhrase);
    }
    return responses;
  }

  static Future<StaticResponse> verifyOtp(String email, String otp) async {
    StaticResponse responses =
        StaticResponse();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://dev.qnatest.com/api/v1/users/otp'));
    request.body = json.encode({"email": email, "otp": otp});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("rES cODE");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Inside 2000");
      String temp = await response.stream.bytesToString();
      responses = staticResponseFromJson(temp);
    } else {
      print(response.reasonPhrase);
    }
    return responses;
  }

  static Future<StaticResponse> updatePasswordOtp(
      String email, String otp, String password) async {
    StaticResponse responses = StaticResponse();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('https://dev.qnatest.com/api/v1/users/forgot-password'));
    request.body =
        json.encode({"email": email, "otp": otp, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("Ab toh Hosh Na kabbar hai");
    print(response.statusCode);
    if (response.statusCode != null) {
      String temp = await response.stream.bytesToString();
      responses = staticResponseFromJson(temp);
    }
    else {
      print("Inside Else");
      print(response.reasonPhrase);
    }
    return responses;
  }

  static Future<ResponseEntity> updatePassword(
      String oldPassword, String newPassword, int userId) async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    ResponseEntity responses =
    ResponseEntity(code: 0, message: 'Incorrect OTP');
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('https://dev.qnatest.com/api/v1/users/password/$userId'));
    request.body = json.encode({
      "old_password": oldPassword,
      "new_password": newPassword
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      responses = responseEntityFromJson(temp);
    } else {
      print(response.reasonPhrase);
    }

    return responses;
  }

  static postAssessmentRepo(PostAssessmentModel? assessment,QuestionPaperModel? questionPaper) async {
    String? token;
    SharedPreferences loginData=await SharedPreferences.getInstance();

   if(questionPaper!.data!.accessTokenDetails!.accessToken==null){
     token=loginData.getString('token');
   }else{
     assessment!.userId=questionPaper.data!.accessTokenDetails!.userId!;
     token=questionPaper!.data!.accessTokenDetails!.accessToken!;
   }

    LoginModel loginModel = LoginModel(code: 0, message: 'message');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://dev.qnatest.com/api/v1/assessment/result'));
    request.body = postAssessmentModelToJson(assessment!);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      print(temp);
      loginModel = loginModelFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      postAssessmentRepo(assessment,questionPaper);
    }
    else {
      String temp = await response.stream.bytesToString();
      loginModel = loginModelFromJson(temp);
      return loginModel;
    }
    return loginModel;
  }

  static Future<ResponseEntity> createQuestionTeacher(CreateQuestionModel question) async {
    print(question.questions![0].subject);
    SharedPreferences loginData = await SharedPreferences.getInstance();
    ResponseEntity loginModel = ResponseEntity(code: 0, message: 'message');
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://dev.qnatest.com/api/v1/assessment/questions'));
    request.body = createQuestionModelToJson(question);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      loginModel = responseEntityFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      createQuestionTeacher(question);
    }
    else {
      print(response.reasonPhrase);
    }
    return loginModel;
  }


  static Future<ResponseEntity> createAssessmentTeacher(CreateAssessmentModel question) async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    ResponseEntity loginModel = ResponseEntity(code: 0, message: 'message');
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://dev.qnatest.com/api/v1/assessment'));
    request.body = createAssessmentModelToJson(question);
    print("=========================================");
    print(question.toString());
    print(request.body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      loginModel = responseEntityFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      createAssessmentTeacher(question);
    }
    else {
      print(response.reasonPhrase);
    }
    return loginModel;
  }

  // static Future<int> createAssessment() async {
  //   int statusCode = 500;
  //   SharedPreferences loginData=await SharedPreferences.getInstance();
  //   var headers = {
  //     'Authorization': 'Bearer ${loginData.getString('token')}',
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST',Uri.parse('https://dev.qnatest.com/api/v1/assessment'));
  //   request.body = json.encode({
  //     "user_id": 14,
  //     "assessment_type": "test",
  //     "assessment_status": "publish",
  //     "total_score": 0,
  //     "total_questions": 0,
  //     "assessment_startdate": 1648229877,
  //     "assessment_enddate": 1648233477,
  //     "assessment_duration": 1800,
  //     "subject": "Math",
  //     "topic": "sum",
  //     "sub_topic": "Solving equations",
  //     "class": "10th",
  //     "assessment_settings":
  //     {
  //       "allowed_number_of_test_retries": 0,
  //       "avalability_for_practice": true,
  //       "allow_guest_student": false,
  //       "show_solved_answer_sheet_in_advisor": false,
  //       "show_advisor_name": true,
  //       "show_advisor_email": true,
  //       "not_available": false
  //     },
  //     "questions": [
  //       {
  //         "question_id": 6,
  //         "question_marks": 5
  //       }
  //     ]
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     return response.statusCode;
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  //   return statusCode;
  // }

  static Future<QuestionPaperModel> getQuestionPaperGuest(String assessmentId,String name) async {
    QuestionPaperModel questionPaperModel;
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://dev.qnatest.com/api/v1/assessment/guest?code=$assessmentId'));
    request.body = json.encode({
      "first_name": name
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String value = await response.stream.bytesToString();
    print(value);
    questionPaperModel = questionPaperModelFromJson(value);
    return questionPaperModel;
  }

  static Future<ResponseEntity> getAllAssessment(int pageLimit,int pageNumber) async {
    ResponseEntity allAssessment=ResponseEntity();
    SharedPreferences loginData=await SharedPreferences.getInstance();
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}'
    };
    var request = http.Request('GET', Uri.parse('https://dev.qnatest.com/api/v1/assessment/all/${loginData.getInt('userId')}/?page_limit=$pageLimit&page_number=$pageNumber'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      allAssessment = responseEntityFromJson(value);
    }
    else {
      print(response.reasonPhrase);
    }
    return allAssessment;
  }

  static Future<ResponseEntity> getAllQuestion(int pageLimit,int pageNumber) async {
    ResponseEntity responseEntity=ResponseEntity();
    SharedPreferences loginData=await SharedPreferences.getInstance();
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}'
    };
    var request = http.Request('GET', Uri.parse('https://dev.qnatest.com/api/v1/assessment/questions/all/${loginData.getInt('userId')}?page_limit=$pageLimit&page_number=$pageNumber'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      print("-----------------");
      responseEntity = responseEntityFromJson(value);
    }
    else {
      print(response.reasonPhrase);
    }
    return responseEntity;
  }

  static Future<LoginModel> deleteQuestion(int questionId) async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    LoginModel loginModel = LoginModel(code: 0, message: 'message');
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('DELETE', Uri.parse('https://dev.qnatest.com/api/v1/assessment/questions/$questionId'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      loginModel = loginModelFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      deleteQuestion(questionId);
    }
    else {
      print(response.reasonPhrase);
    }
    return loginModel;
  }

  static Future<ResponseEntity> editQuestionTeacher(EditQuestionModel question,int questionId) async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    ResponseEntity loginModel = ResponseEntity(code: 0, message: 'message');
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('https://dev.qnatest.com/api/v1/assessment/questions/$questionId'));
    request.body = editQuestionModelToJson(question);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      loginModel = responseEntityFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      editQuestionTeacher(question,questionId);
    }
    else {
      print(response.reasonPhrase);
    }
    return loginModel;
  }

  static Future<ResponseEntity> editAssessmentTeacher(CreateAssessmentModel assessment,int assessmentId) async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    ResponseEntity loginModel = ResponseEntity(code: 0, message: 'message');
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('https://dev.qnatest.com/api/v1/assessment/$assessmentId'));
    request.body = createAssessmentModelToJson(assessment);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String temp = await response.stream.bytesToString();
      loginModel = responseEntityFromJson(temp);
    }
    else if(response.statusCode == 401){
      String? email=loginData.getString('email');
      String? pass=loginData.getString('password');
      LoginModel loginModel=await logInUser(email!, pass!,loginData.getString('role'));
      editAssessmentTeacher(assessment,assessmentId);
    }
    else {
      print(response.reasonPhrase);
    }
    return loginModel;
  }

  static Future<GetResultModel> getResultTeacherRepo(int pageLimit,int pageNumber) async {
    GetResultModel getResult =GetResultModel(status: 500, message: 'null');
    SharedPreferences loginData=await SharedPreferences.getInstance();
    var request = http.Request('GET', Uri.parse('https://dev.qnatest.com/api/v1/assessment/results/${loginData.getInt('userId')}?page_limit=$pageLimit&page_number=$pageNumber'));
    http.StreamedResponse response = await request.send();
    print("SDvsdscdsv");
    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      getResult = getResultModelFromJson(value);
      print("SDvsfv");
    }
    else {
      print(response.reasonPhrase);
    }
    return getResult;
  }
  // static Future<ResponseEntity> getAllResults(assessmentId) async {
  //   ResponseEntity responseEntity=ResponseEntity();
  //   SharedPreferences loginData=await SharedPreferences.getInstance();
  //   var headers = {
  //     'Authorization': 'Bearer ${loginData.getString('token')}'
  //   };
  //   var request = http.Request('GET', Uri.parse('https://dev.qnatest.com/api/v1/assessment?code=$assessmentId');
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     String value = await response.stream.bytesToString();
  //     print("-----------------");
  //     responseEntity = responseEntityFromJson(value);
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //   return responseEntity;
  // }

  static Future<ResponseEntity> getSearchAssessment(int pageLimit,int pageNumber,String searchVal) async {
    ResponseEntity allAssessment=ResponseEntity();
    SharedPreferences loginData=await SharedPreferences.getInstance();
    var headers = {
      'Authorization': 'Bearer ${loginData.getString('token')}'
    };
    var request = http.Request('GET', Uri.parse('https://dev.qnatest.com/api/v1/assessment/assessments-looq?page_limit=$pageLimit&page_number=$pageNumber&search=$searchVal'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      print(value);
      allAssessment = responseEntityFromJson(value);
    }
    else {
      print(response.reasonPhrase);
    }
    return allAssessment;
  }

}
