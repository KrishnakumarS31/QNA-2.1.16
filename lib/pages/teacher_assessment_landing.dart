import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:qna_test/Pages/teacher_prepare_preview_qnBank.dart';
import 'package:qna_test/Pages/teacher_assessment_searched.dart';
import 'package:qna_test/Pages/teacher_looq_search_question.dart';
import 'package:qna_test/pages/teacher_recent_assessment.dart';

import '../Entity/demo_question_model.dart';
import '../Providers/question_prepare_provider.dart';
import 'teacher_prepare_qnBank.dart';


class TeacherAssessmentLanding extends StatefulWidget {
  const TeacherAssessmentLanding({
    Key? key,

  }) : super(key: key);


  @override
  TeacherAssessmentLandingState createState() => TeacherAssessmentLandingState();
}

class TeacherAssessmentLandingState extends State<TeacherAssessmentLanding> {
  bool agree = false;



  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((_) {
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
          ),
          context: context,
          builder: (builder) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              height: MediaQuery.of(context).copyWith().size.height * 0.245,
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).copyWith().size.width * 0.10 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).copyWith().size.height * 0.026,),
                    Padding(
                      padding:  EdgeInsets.only(right: MediaQuery.of(context).copyWith().size.width * 0.055),
                      child: Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.close,color: Color.fromRGBO(82, 165, 160, 1),size: MediaQuery.of(context).copyWith().size.width * 0.07,), onPressed: () { Navigator.of(context).pop(); },),),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Legend",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1
                            ?.merge( TextStyle(
                            color: Color.fromRGBO(82, 165, 160, 1),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).copyWith().size.height * 0.02)),),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).copyWith().size.width * 0.052,
                    ),
                    SizedBox(height: MediaQuery.of(context).copyWith().size.height * 0.019,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.circle,color: Color.fromRGBO(60, 176, 0, 1),size: MediaQuery.of(context).copyWith().size.height * 0.02,),
                        Text("  Active",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.merge( TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).copyWith().size.height * 0.016)),),
                        SizedBox(
                          width: MediaQuery.of(context).copyWith().size.width * 0.18,
                        ),
                        Icon(Icons.circle,color: Color.fromRGBO(255, 166, 0, 1),size: MediaQuery.of(context).copyWith().size.height * 0.02,),
                        Text("  In progress",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.merge( TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).copyWith().size.height * 0.016)),),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).copyWith().size.height * 0.019,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.circle,color: Color.fromRGBO(136, 136, 136, 1),size: MediaQuery.of(context).copyWith().size.height * 0.02,),
                        Text("  Inactive",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.merge( TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).copyWith().size.height * 0.016)),),
                        SizedBox(
                          width: MediaQuery.of(context).copyWith().size.width * 0.16,
                        ),
                        Icon(Icons.circle,color: Color.fromRGBO(42, 36, 186, 1),size: MediaQuery.of(context).copyWith().size.height * 0.02,),
                        Text("  Practice",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.merge( TextStyle(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).copyWith().size.height * 0.016)),),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController teacherQuestionBankSearchController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon:const Icon(
                Icons.menu,
                size: 40.0,
                color: Colors.white,
              ), onPressed: () {
              Navigator.of(context).pop();
            },
            ),
          ),
        ],
        leading: IconButton(
          icon:const Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.white,
          ), onPressed: () {
          Navigator.of(context).pop();
        },
        ),
        toolbarHeight: height * 0.100,
        centerTitle: true,
        title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "MY ASSESSMENTS",
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: height * 0.0225,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    Color.fromRGBO(0, 106, 100, 1),
                    Color.fromRGBO(82, 165, 160, 1),
                  ])),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: EdgeInsets.only(top: height * 0.023,left: height * 0.023,right: height * 0.023),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Search Library  (LOOQ)",
                  style: TextStyle(
                    color: const Color.fromRGBO(82, 165, 160, 1),
                    fontSize: height * 0.02,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),),
                //SizedBox(height: height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Library Of Online Questions",
                      style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontSize: height * 0.015,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          activeColor: const Color.fromRGBO(82, 165, 160, 1),
                          fillColor: MaterialStateProperty
                              .resolveWith<Color>((states) {
                            if (states.contains(
                                MaterialState.selected)) {
                              return const Color.fromRGBO(82, 165, 160, 1); // Disabled color
                            }
                            return const Color.fromRGBO(82, 165, 160, 1); // Regular color
                          }),
                          value: agree,
                          onChanged: (val) {
                            setState(() {
                              agree = val!;
                              if (agree) {
                              }
                            });
                          },
                        ),
                        SizedBox(width: width*0.01,),
                        Text('Only My Questions', textAlign: TextAlign.left,style: TextStyle(
                            fontSize: height *0.015
                        ),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: height * 0.02),
                TextField(
                  controller: teacherQuestionBankSearchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle:  TextStyle(color: const Color.fromRGBO(102, 102, 102, 0.3),fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: height * 0.016),
                    hintText: "Maths, 10th, 2022, CBSE, Science",
                    suffixIcon:
                    Column(
                        children: [
                          Container(
                              height: height * 0.073,
                              width: width*0.13,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromRGBO(82, 165, 160, 1),
                              ),
                              child: IconButton(
                                iconSize: height * 0.04,
                                color: const Color.fromRGBO(255, 255, 255, 1), onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child:  TeacherAssessmentSearched(),
                                  ),
                                );
                              }, icon: const Icon(Icons.search),
                              )),
                        ]),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(82, 165, 160, 1)),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  enabled: true,
                  onChanged: (value) {
                  },
                ),
                SizedBox(height: height * 0.04),
                Container(
                  margin: EdgeInsets.only(left: height * 0.040),
                  child:
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "DISCLAIMER:",
                          style: TextStyle(
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(82, 165, 160, 1),
                              fontFamily: "Inter"),
                        ),
                        TextSpan(
                          text: "\t ITNEducation is not responsible for\nthe content and accuracy of the Questions & Answer available in the Library.",
                          style: TextStyle(
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(153, 153, 153, 1),
                              fontFamily: "Inter"),),
                      ])),
                ),
                SizedBox(height: height * 0.02),
                Text("My Assessments",
                  style: TextStyle(
                    color: const Color.fromRGBO(82, 165, 160, 1),
                    fontSize: height * 0.02,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),),
                SizedBox(height: height*0.02,),
                Text(
                  "Tap to Review/Edit/Delete",
                  style: TextStyle(
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    fontSize: height * 0.015,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                     Expanded(child: Padding(
                      padding: EdgeInsets.only(right: width * 0.05),
                      child: Divider(),
                    )),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: const Color.fromRGBO(28, 78, 80, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.chevron_right)

                  ],
                ),
                SizedBox(height: height*0.02,),
                Center(
                  child: Container(
                    width: width * 0.888,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(82, 165, 160, 1),
                        minimumSize: const Size(280, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(39),
                        ),
                      ),
                      //shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: TeacherRecentAssessment(),
                          ),
                        );

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create New Assessment',
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontFamily: "Inter",
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
              ],

            )
        ),
      ),
    );
  }

}

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height * 0.1087,
        width: width * 0.888,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: const Color.fromRGBO(82, 165, 160, 0.15),
          ),
          color: const Color.fromRGBO(82, 165, 160, 0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width * 0.02,right: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Maths",
                    style: TextStyle(
                      color: const Color.fromRGBO(28, 78, 80, 1),
                      fontSize: height * 0.0175,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "In progress",
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 166, 0, 1),
                      fontSize: height * 0.015,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.02),
              child: Text(
                "Calculus - Chapter 12.2",
                style: TextStyle(
                  color: const Color.fromRGBO(102, 102, 102, 1),
                  fontSize: height * 0.015,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.02,right: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Class IX",
                    style: TextStyle(
                      color: const Color.fromRGBO(28, 78, 80, 1),
                      fontSize: height * 0.015,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "10/1/2023",
                    style: TextStyle(
                      color: const Color.fromRGBO(28, 78, 80, 1),
                      fontSize: height * 0.015,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionPreview extends StatelessWidget {
  const QuestionPreview({
    Key? key,
    required this.height,
    required this.width,
    required this.question,
  }) : super(key: key);

  final double height;
  final double width;
  final DemoQuestionModel question;

  @override
  Widget build(BuildContext context) {
    String answer='';
    for(int i=1;i<=question.correctChoice!.length;i++){
      int j=1;
      j=question.correctChoice![i-1]!;
      answer='$answer ${question.choices![j-1]}';
      //question.choices[question.correctChoice[i]];
    }
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            height: height * 0.04,
            width: width * 0.95,
            color: Color.fromRGBO(82, 165, 160, 0.1),
            child: Padding(
              padding:  EdgeInsets.only(right: width * 0.02,left: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        question.subject,
                        style: TextStyle(
                            fontSize: height * 0.017,
                            fontFamily: "Inter",
                            color: Color.fromRGBO(28, 78, 80, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "  |  ${question.topic} - ${question.subTopic}",
                        style: TextStyle(
                            fontSize: height * 0.015,
                            fontFamily: "Inter",
                            color: Color.fromRGBO(102, 102, 102, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                  Text(
                    question.studentClass,
                    style: TextStyle(
                        fontSize: height * 0.015,
                        fontFamily: "Inter",
                        color: Color.fromRGBO(28, 78, 80, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.01,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              question.question,
              style: TextStyle(
                  fontSize: height * 0.0175,
                  fontFamily: "Inter",
                  color: Color.fromRGBO(51, 51, 51, 1),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: height * 0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                answer,
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontFamily: "Inter",
                    color: Color.fromRGBO(82, 165, 160, 1),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                question.questionType,
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontFamily: "Inter",
                    color: Color.fromRGBO(82, 165, 160, 1),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: height * 0.01,),
          Divider()

        ],
      ),
    );
  }
}