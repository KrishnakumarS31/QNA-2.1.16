import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qna_test/Entity/Teacher/choice_entity.dart';
import 'package:qna_test/Entity/Teacher/edit_question_model.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:qna_test/pages/teacher_question_preview.dart';
import '../Components/custom_incorrect_popup.dart';
import '../Components/custom_radio_option.dart';
import '../Components/end_drawer_menu_teacher.dart';
import '../Entity/Teacher/question_entity.dart';
import '../EntityModel/login_entity.dart';
import '../Services/qna_service.dart';

class QuestionEdit extends StatefulWidget {
  const QuestionEdit({
    Key? key,
    required this.question,

  }) : super(key: key);

  final Question question;


  @override
  QuestionEditState createState() => QuestionEditState();
}

class QuestionEditState extends State<QuestionEdit> {
  String? _groupValue;
  List<Choice>? selected = [];
  TextEditingController subjectController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController adviceController = TextEditingController();
  TextEditingController subtopicController = TextEditingController();
  TextEditingController classRoomController = TextEditingController();
  TextEditingController questionController = TextEditingController();
  IconData showIcon = Icons.expand_circle_down_outlined;
  Color textColor = const Color.fromRGBO(48, 145, 139, 1);

  ValueChanged<String?> _valueChangedHandler(BuildContext context,double height) {
    return (value) {
      if(value=='Descripitive'){
        showAlertDialogDes(context,height,value);
      }
      else{
        setState(() => _groupValue = value!);
      }
    };
  }

  showAlertDialogDes(BuildContext context, double height,String? value) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(48, 145, 139, 1),
            fontWeight: FontWeight.w500),
      ),
      child: Text(
        'No',
        style: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(48, 145, 139, 1),
            fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(82, 165, 160, 1),
        textStyle: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(48, 145, 139, 1),
            fontWeight: FontWeight.w500),
      ),
      child: Text(
        'Yes',
        style: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(250, 250, 250, 1),
            fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        setState(() {
          chooses.clear();
          radioList.clear();
          tempChoiceId.clear();
          questionController.text='';
          _groupValue = value!;

          selected?.clear();
        });
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.info,
            color: Color.fromRGBO(238, 71, 0, 1),
          ),
          Text(
            'Alert',
            style: TextStyle(
                fontSize: height * 0.02,
                fontFamily: "Inter",
                color: const Color.fromRGBO(0, 106, 100, 1),
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
      content: Text(
        'Are you sure you want to clear this Question and Choices?',
        style: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(51, 51, 51, 1),
            fontWeight: FontWeight.w400),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<int> tempChoiceId = [];
  EditQuestionModel editQuestion =
  EditQuestionModel(editChoices: [], addChoices: [], removeChoices: []);

  final List<TextEditingController> chooses = [];
  final List<bool> radioList = [];
  final _formKey = GlobalKey<FormState>();

  List<int> editChoiceId = [];
  List<int> addChoiceId = [];
  AddChoice addChoice = AddChoice();
  int tempAddChoiceId = -100;

  _onRadioChange(int key) {
    setState(() {
      radioList[key] = !radioList[key];
      widget.question.choices?[key].rightChoice = radioList[key];
    });
  }

  addField() {
    setState(() {
      widget.question.choices?.add(Choice(choiceText: '', rightChoice: false));
      chooses.add(TextEditingController());
      radioList.add(false);
      editQuestion.addChoices?.add(AddChoice(
          questionId: tempAddChoiceId, choiceText: '', rightChoice: false));
      tempChoiceId.add(tempAddChoiceId);
      addChoiceId.add(tempAddChoiceId);
      tempAddChoiceId++;
    });
  }

  removeItem(i) {
    setState(() {
      if (addChoiceId.contains(tempChoiceId[i])) {
        int index = addChoiceId.indexOf(tempChoiceId[i]);
        addChoiceId.removeAt(index);
        editQuestion.addChoices?.removeAt(index);
      } else {
        if (editChoiceId.contains(tempChoiceId[i])) {
          int index = editChoiceId.indexOf(tempChoiceId[i]);
          editChoiceId.removeAt(index);
          editQuestion.editChoices?.removeAt(index);
        }
      }
      chooses.removeAt(i);
      radioList.removeAt(i);
      editQuestion.removeChoices!.add(tempChoiceId[i]);
      widget.question.choices?.removeAt(i);
      tempChoiceId.removeAt(i);
    });
  }

  @override
  void initState() {
    super.initState();
    _groupValue = widget.question.questionType;
    subjectController.text = widget.question.subject!;
    topicController.text = widget.question.topic!;
    subtopicController.text = widget.question.subTopic!;
    classRoomController.text = widget.question.datumClass!;
    questionController.text = widget.question.question!;
    urlController.text = widget.question.advisorUrl!;
    adviceController.text = widget.question.advisorText!;
    for (int i = 0; i < widget.question.choices!.length; i++) {
      selected = widget.question.choices;
      tempChoiceId.add(widget.question.choices![i].questionChoiceId!);
    }
    for (int i = 0; i < widget.question.choices!.length; i++) {
      chooses.add(TextEditingController());
      radioList.add(false);
      chooses[i].text = widget.question.choices![i].choiceText!;
      if (widget.question.choices![i].rightChoice!) {
        radioList[i] = true;
      }
    }
  }

  showQuestionPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        editQuestion.question = widget.question.question;
        editQuestion.subject = widget.question.subject;
        editQuestion.topic = widget.question.topic;
        editQuestion.subTopic = widget.question.subTopic;
        editQuestion.editQuestionModelClass = widget.question.datumClass;
        editQuestion.advisorUrl = widget.question.advisorUrl;
        editQuestion.advisorText = widget.question.advisorText;
        editQuestion.questionType=widget.question.questionType;
        if(widget.question.questionType=="Descripitive"){
          editQuestion.addChoices=[];
          editQuestion.editChoices=[];
        }
        return TeacherQuestionPreview(
          question: widget.question,
          editQuestionModel: editQuestion,
        );
      },
    );
  }

  showAlertDialog(BuildContext context, double height) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(48, 145, 139, 1),
            fontWeight: FontWeight.w500),
      ),
      child: Text(
        'No',
        style: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(48, 145, 139, 1),
            fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(82, 165, 160, 1),
        textStyle: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(48, 145, 139, 1),
            fontWeight: FontWeight.w500),
      ),
      child: Text(
        'Yes',
        style: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(250, 250, 250, 1),
            fontWeight: FontWeight.w500),
      ),
      onPressed: () async {
        LoginModel statusCode =
        await QnaService.deleteQuestion(widget.question.questionId!);
        if (statusCode.code == 200) {
          Navigator.of(context).pushNamedAndRemoveUntil('/teacherQuestionBank', ModalRoute.withName('/teacherSelectionPage'));
        }
        else{
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: CustomDialog(
                title: "OOPS!",
                content:
                statusCode.message!,
                //'please enter the correct password',
                button: "Ok",
                numberOfScreenBack: 2,
              ),
            ),
          );
          //Navigator.of(context).pop();
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.info,
            color: Color.fromRGBO(238, 71, 0, 1),
          ),
          Text(
            'Confirm',
            style: TextStyle(
                fontSize: height * 0.02,
                fontFamily: "Inter",
                color: const Color.fromRGBO(0, 106, 100, 1),
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
      content: Text(
        'Are you sure you want to delete this Question?',
        style: TextStyle(
            fontSize: height * 0.02,
            fontFamily: "Inter",
            color: const Color.fromRGBO(51, 51, 51, 1),
            fontWeight: FontWeight.w400),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Colors.white,
                  endDrawer: const EndDrawerMenuTeacher(),
                  appBar: AppBar(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        subjectController.clear();
                        questionController.clear();
                        classRoomController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                    toolbarHeight: height * 0.100,
                    centerTitle: true,
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.edit_en_caps,
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
                        padding: EdgeInsets.only(
                            top: height * 0.023,
                            left: height * 0.02,
                            right: height * 0.023),
                        child: Column(children: [
                          SizedBox(height: height * 0.005),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(82, 165, 160, 1),
                              ),
                            ),
                            child: Row(
                              children: [
                                MyRadioOption<String>(
                                  icon: Icons.check_box_outlined,
                                  value: 'MCQ',
                                  groupValue: _groupValue,
                                  onChanged: _valueChangedHandler(context,height),
                                  label: 'MCQ',
                                ),
                                MyRadioOption<String>(
                                  icon: Icons.account_tree_outlined,
                                  value: 'Survey',
                                  groupValue: _groupValue,
                                  onChanged: _valueChangedHandler(context,height),
                                  label: 'Survey',
                                ),
                                MyRadioOption<String>(
                                  icon: Icons.library_books_sharp,
                                  value: 'Descripitive',
                                  groupValue: _groupValue,
                                  onChanged: _valueChangedHandler(context,height),
                                  label: 'Descriptive',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  showAlertDialog(context, height);
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Color.fromRGBO(28, 78, 80, 1),
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(28, 78, 80, 1),
                                        fontSize: height * 0.018,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    subjectController.text = '';
                                    topicController.text = '';
                                    subtopicController.text = '';
                                    classRoomController.text = '';
                                    questionController.text = '';
                                    urlController.text = '';
                                    adviceController.text = '';
                                    chooses.clear();
                                    tempChoiceId.clear();
                                    radioList.clear();
                                    editChoiceId.clear();
                                    addChoiceId.clear();
                                  });
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.clear_sharp,
                                        size: height * 0.028,
                                        color: const Color.fromRGBO(28, 78, 80, 1),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.clear_all,
                                        style: TextStyle(
                                          color: const Color.fromRGBO(28, 78, 80, 1),
                                          fontSize: height * 0.018,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.001),
                          Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color.fromRGBO(82, 165, 160, 1)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: showIcon!=Icons.expand_circle_down_outlined?
                              Container(
                                  color: const Color.fromRGBO(82, 165, 160, 1),
                                  child: Row(children: [
                                    constraints.maxWidth > 700
                                        ? SizedBox(width: width * 0.03)
                                        : SizedBox(width: width * 0.07),
                                    Text(AppLocalizations.of(context)!.subject_topic,
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: height * 0.020)),
                                    constraints.maxWidth > 700
                                        ? SizedBox(width: width * 0.8)
                                        : SizedBox(width: width * 0.15),
                                    IconButton(
                                      icon: Icon(
                                        showIcon,
                                        color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                        size: height * 0.03,
                                      ),
                                      onPressed: () {
                                        changeIcon(showIcon);
                                      },
                                    )
                                  ])):Column(children: [
                                Container(
                                    color: Color.fromRGBO(82, 165, 160, 1),
                                    child: Row(children: [
                                      SizedBox(width: width * 0.10),
                                      Text(
                                          AppLocalizations.of(context)!.subject_topic,
                                          //"Subject and Topic",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.020)),
                                      SizedBox(width: width * 0.25),
                                      IconButton(
                                        icon: Icon(
                                          showIcon,
                                          color:
                                          const Color.fromRGBO(255, 255, 255, 1),
                                          size: height * 0.03,
                                        ),
                                        onPressed: () {
                                          changeIcon(showIcon);
                                        },
                                      )
                                    ])),
                                SizedBox(height: height * 0.010),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10, top: 20, bottom: 20),
                                    child: Column(children: [
                                      TextFormField(
                                          controller: subjectController,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.018),
                                          decoration: InputDecoration(
                                            labelText: "SUBJECT",
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            labelStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: height * 0.015),
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 0.3),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.02),
                                            hintText: AppLocalizations.of(context)!.sub_hint,
                                            //"Type Subject Here",
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        82, 165, 160, 1)),
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                          )),
                                      SizedBox(height: height * 0.015),
                                      TextFormField(
                                          controller: topicController,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.018),
                                          decoration: InputDecoration(
                                            labelText: AppLocalizations.of(context)!.topic_caps,
                                            //"TOPIC",
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            labelStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: height * 0.015),
                                            hintStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 0.3),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.02),
                                            hintText:
                                            AppLocalizations.of(context)!.topic_hint,
                                            //"Type Topic Here",
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        82, 165, 160, 1)),
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                          )),
                                      SizedBox(height: height * 0.015),
                                      TextFormField(
                                          controller: subtopicController,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.018),
                                          decoration: InputDecoration(
                                            labelText: AppLocalizations.of(context)!.sub_topic_caps,
                                            //'SUB TOPIC',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            labelStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: height * 0.015),
                                            hintStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 0.3),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.02),
                                            hintText: AppLocalizations.of(context)!.sub_topic_hint,
                                            //'Type Sub Topic Here',
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        82, 165, 160, 1)),
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                          )),
                                      SizedBox(height: height * 0.015),
                                      TextFormField(
                                          controller: classRoomController,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.018),
                                          decoration: InputDecoration(
                                            labelText: AppLocalizations.of(context)!.class_caps,
                                            //"CLASS",
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            labelStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: height * 0.015),
                                            hintStyle: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 0.3),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.02),
                                            hintText: AppLocalizations.of(context)!.type_here,
                                            //"Type Here",
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        82, 165, 160, 1)),
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                          )),
                                    ])),
                                SizedBox(height: height * 0.010),
                              ]),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: width * 0.05, right: width * 0.04),
                            child: Column(
                              children: [
                                Row(children: [
                                  Text(
                                    AppLocalizations.of(context)!.qn_qn_page,
                                    // "Question",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(82, 165, 160, 1),
                                      fontSize: height * 0.025,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.03),
                                  const Expanded(child: Divider()),
                                ]),
                                SizedBox(height: height * 0.010),
                                TextFormField(
                                  maxLines: 5,
                                  controller: questionController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: height * 0.018),
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: const Color.fromRGBO(51, 51, 51, 1),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.015),
                                    hintStyle: TextStyle(
                                        color:
                                        const Color.fromRGBO(102, 102, 102, 0.3),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.02),
                                    hintText:
                                    AppLocalizations.of(context)!.type_qn_here,
                                    //"Type Question Here",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(82, 165, 160, 1)),
                                        borderRadius: BorderRadius.circular(15)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      widget.question.question = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.010),
                          _groupValue=="Descripitive"
                              ? const SizedBox(height: 0,)
                              : _groupValue=="Survey"
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.choices,
                                    //"Choices",
                                    style: TextStyle(
                                      color:
                                      const Color.fromRGBO(51, 51, 51, 1),
                                      fontSize: height * 0.016,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                AppLocalizations.of(context)!.delete,
                                //"Delete",
                                style: TextStyle(
                                  color: const Color.fromRGBO(51, 51, 51, 1),
                                  fontSize: height * 0.016,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              constraints.maxWidth > 700
                                  ?  SizedBox(
                                width: width * 0.02,
                              )
                                  : const SizedBox(),
                            ],
                          )
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.choices,
                                    //"Choices",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(51, 51, 51, 1),
                                      fontSize: height * 0.016,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.correct_answer,
                                // "Correct\nAnswer",
                                style: TextStyle(
                                  color: const Color.fromRGBO(51, 51, 51, 1),
                                  fontSize: height * 0.016,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                AppLocalizations.of(context)!.delete,
                                style: TextStyle(
                                  color: const Color.fromRGBO(51, 51, 51, 1),
                                  fontSize: height * 0.016,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              constraints.maxWidth > 700
                                  ?  SizedBox(
                                  width: width * 0.06
                              )
                                  : const SizedBox(),
                            ],
                          ),
                          SizedBox(height: height * 0.010),
                          _groupValue=="Descripitive"
                              ?
                          const SizedBox(height: 0,)
                              : _groupValue=="Survey"
                              ? Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                for (int i = 0; i < chooses.length; i++)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: height * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: chooses[i],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.018),
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                              hintStyle: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 0.3),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: height * 0.02),
                                              hintText: AppLocalizations.of(context)!.type_op_here,
                                              //"Type Option Here",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            onFieldSubmitted: (t){
                                              String val=chooses[i].text;
                                              EditChoice editChoice = EditChoice();
                                              setState(() {
                                                chooses[i].text = val;
                                                widget.question.choices![i]
                                                    .choiceText = val;
                                                if (addChoiceId.contains(tempChoiceId[i])) {
                                                  int index = addChoiceId.indexOf(tempChoiceId[i]);
                                                  editQuestion.addChoices?.removeAt(index);
                                                  addChoice.rightChoice = radioList[i];
                                                  addChoice.questionId = tempChoiceId[i];
                                                  addChoice.choiceText = val;editQuestion.addChoices?.add(addChoice);
                                                } else {
                                                  if (editChoiceId.contains(tempChoiceId[i])) {
                                                    int index = tempChoiceId.indexOf(tempChoiceId[i]);
                                                    editQuestion.editChoices?.removeAt(index);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;editQuestion.editChoices?.add(editChoice);
                                                  } else {
                                                    editChoiceId.add(tempChoiceId[i]);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;
                                                    editQuestion.editChoices?.add(editChoice);
                                                  }
                                                }
                                              });
                                            },
                                            onTapOutside: (t) {
                                              String val=chooses[i].text;
                                              EditChoice editChoice = EditChoice();
                                              setState(() {
                                                chooses[i].text = val;
                                                widget.question.choices![i]
                                                    .choiceText = val;
                                                if (addChoiceId.contains(tempChoiceId[i])) {
                                                  int index = addChoiceId.indexOf(tempChoiceId[i]);
                                                  editQuestion.addChoices?.removeAt(index);
                                                  addChoice.rightChoice = radioList[i];
                                                  addChoice.questionId = tempChoiceId[i];
                                                  addChoice.choiceText = val;editQuestion.addChoices?.add(addChoice);
                                                } else {
                                                  if (editChoiceId.contains(tempChoiceId[i])) {
                                                    int index = tempChoiceId.indexOf(tempChoiceId[i]);
                                                    editQuestion.editChoices?.removeAt(index);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;editQuestion.editChoices?.add(editChoice);
                                                  } else {
                                                    editChoiceId.add(tempChoiceId[i]);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;
                                                    editQuestion.editChoices?.add(editChoice);
                                                  }
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            removeItem(i);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: Color.fromRGBO(82, 165, 160, 1),
                                          ),
                                        ),
                                        constraints.maxWidth > 700
                                            ?  SizedBox(
                                          width: width * 0.02,
                                        )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          )
                              : Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                for (int i = 0; i < chooses.length; i++)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: height * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: chooses[i],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.018),
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                              hintStyle: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 0.3),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: height * 0.02),
                                              hintText: AppLocalizations.of(context)!.type_op_here,
                                              //"Type Option Here",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            onFieldSubmitted: (t){
                                              String val=chooses[i].text;
                                              EditChoice editChoice = EditChoice();
                                              setState(() {
                                                chooses[i].text = val;
                                                widget.question.choices![i]
                                                    .choiceText = val;
                                                if (addChoiceId.contains(tempChoiceId[i])) {
                                                  int index = addChoiceId.indexOf(tempChoiceId[i]);
                                                  editQuestion.addChoices?.removeAt(index);
                                                  addChoice.rightChoice = radioList[i];
                                                  addChoice.questionId = tempChoiceId[i];
                                                  addChoice.choiceText = val;editQuestion.addChoices?.add(addChoice);
                                                } else {
                                                  if (editChoiceId.contains(tempChoiceId[i])) {
                                                    int index = tempChoiceId.indexOf(tempChoiceId[i]);
                                                    editQuestion.editChoices?.removeAt(index);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;editQuestion.editChoices?.add(editChoice);
                                                  } else {
                                                    editChoiceId.add(tempChoiceId[i]);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;
                                                    editQuestion.editChoices?.add(editChoice);
                                                  }
                                                }
                                              });
                                            },
                                            onTapOutside: (t) {
                                              String val=chooses[i].text;
                                              EditChoice editChoice = EditChoice();
                                              setState(() {
                                                chooses[i].text = val;
                                                widget.question.choices![i]
                                                    .choiceText = val;
                                                if (addChoiceId.contains(tempChoiceId[i])) {
                                                  int index = addChoiceId.indexOf(tempChoiceId[i]);
                                                  editQuestion.addChoices?.removeAt(index);
                                                  addChoice.rightChoice = radioList[i];
                                                  addChoice.questionId = tempChoiceId[i];
                                                  addChoice.choiceText = val;editQuestion.addChoices?.add(addChoice);
                                                } else {
                                                  if (editChoiceId.contains(tempChoiceId[i])) {
                                                    int index = tempChoiceId.indexOf(tempChoiceId[i]);
                                                    editQuestion.editChoices?.removeAt(index);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;editQuestion.editChoices?.add(editChoice);
                                                  } else {
                                                    editChoiceId.add(tempChoiceId[i]);
                                                    editChoice.rightChoice = radioList[i];
                                                    editChoice.choiceId = tempChoiceId[i];
                                                    editChoice.choiceText = val;
                                                    editQuestion.editChoices?.add(editChoice);
                                                  }
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            EditChoice editChoice = EditChoice();
                                            if (addChoiceId
                                                .contains(tempChoiceId[i])) {
                                              int index = addChoiceId
                                                  .indexOf(tempChoiceId[i]);
                                              editQuestion.addChoices![index]
                                                  .choiceText = chooses[i].text;
                                              editQuestion.addChoices![index]
                                                  .questionId = tempChoiceId[i];
                                              editQuestion.addChoices![index]
                                                  .rightChoice = !radioList[i];
                                            } else {
                                              if (editChoiceId
                                                  .contains(tempChoiceId[i])) {
                                                int index = editChoiceId
                                                    .indexOf(tempChoiceId[i]);
                                                editQuestion.editChoices![index]
                                                    .choiceText = chooses[i].text;
                                                editQuestion.editChoices![index]
                                                    .choiceId = tempChoiceId[i];
                                                editQuestion.editChoices![index]
                                                    .rightChoice = !radioList[i];
                                              } else {
                                                editChoiceId.add(tempChoiceId[i]);
                                                editChoice.rightChoice =
                                                !radioList[i];
                                                editChoice.choiceId = tempChoiceId[i];
                                                editChoice.choiceText =
                                                    chooses[i].text;
                                                editQuestion.editChoices
                                                    ?.add(editChoice);
                                              }
                                            }
                                            _onRadioChange(i);
                                          },
                                          icon: Icon(
                                            radioList[i]
                                                ? Icons.radio_button_checked_outlined
                                                : Icons
                                                .radio_button_unchecked_outlined,
                                            color:
                                            const Color.fromRGBO(82, 165, 160, 1),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            removeItem(i);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: Color.fromRGBO(82, 165, 160, 1),
                                          ),
                                        ),
                                        constraints.maxWidth > 700
                                            ?  SizedBox(
                                          width: width * 0.05,
                                        )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          _groupValue=="Descripitive"?
                          const SizedBox(height: 0,)
                              :Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    addField();
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.add_more_choice,
                                    // "Add more choice",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(82, 165, 160, 1),
                                      fontSize: height * 0.0225,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.020),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      left: width * 0.05, right: width * 0.04),
                                  child: Row(children: [
                                    Text(
                                      AppLocalizations.of(context)!.advisor,
                                      //"Advisor",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.025,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.03),
                                    const Expanded(child: Divider()),
                                  ]),
                                )
                              ]),
                          SizedBox(height: height * 0.020),
                          TextFormField(
                            controller: adviceController,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.018),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                  color: const Color.fromRGBO(51, 51, 51, 1),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: height * 0.015),
                              hintStyle: TextStyle(
                                  color: const Color.fromRGBO(102, 102, 102, 0.3),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.02),
                              hintText:
                              AppLocalizations.of(context)!.suggest_study,
                              //"Suggest what to study if answered incorrectly",
                            ),
                            onChanged: (val) {
                              setState(() {
                                widget.question.advisorText = val;
                              });
                            },
                          ),
                          SizedBox(height: height * 0.020),
                          TextFormField(
                            controller: urlController,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.018),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                  color: const Color.fromRGBO(51, 51, 51, 1),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: height * 0.015),
                              hintStyle: TextStyle(
                                  color: const Color.fromRGBO(102, 102, 102, 0.3),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.02),
                              hintText:
                              AppLocalizations.of(context)!.url_reference,
                              //"URL - Any reference (Optional)",
                            ),
                            onChanged: (val) {
                              setState(() {
                                widget.question.advisorUrl = val;
                              });
                            },
                          ),
                          SizedBox(height: height * 0.030),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color.fromRGBO(82, 165, 160, 1),
                                  maximumSize: const Size(280, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(39),
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.preview,
                                  style: TextStyle(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: height * 0.025,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  if(questionController.text=='' || subjectController.text=='' || classRoomController.text==''){
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CustomDialog(
                                          title: AppLocalizations.of(context)!.alert_popup,
                                          //"Alert",
                                          //'Wrong password',
                                          content:
                                          AppLocalizations.of(context)!.enter_sub_class,
                                          // "Enter Subject, Class and Question",
                                          //'please enter the correct password',
                                          button: AppLocalizations.of(context)!.retry,
                                          //"Retry",
                                        ),
                                      ),
                                    );
                                  }
                                  else if(_groupValue=='MCQ' && chooses.isEmpty){
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: CustomDialog(
                                          title: AppLocalizations.of(context)!.alert_popup,
                                          //"Alert",
                                          //'Wrong password',
                                          content:
                                          AppLocalizations.of(context)!.one_choice_must,
                                          //"At least one choice must be added",
                                          //'please enter the correct password',
                                          button: AppLocalizations.of(context)!.retry,
                                          //"Retry",
                                        ),
                                      ),
                                    );
                                  }
                                  else{
                                    setState(() {
                                      widget.question.questionType = _groupValue;
                                      widget.question.subject =
                                          subjectController.text;
                                      widget.question.topic = topicController.text;
                                      widget.question.subTopic =
                                          subtopicController.text;
                                      widget.question.datumClass =
                                          classRoomController.text;
                                      widget.question.question =
                                          questionController.text;
                                      widget.question.choices = selected;
                                      widget.question.advisorText =
                                          adviceController.text;
                                      widget.question.advisorUrl =
                                          urlController.text;
                                    });
                                    showQuestionPreview(context);
                                  }
                                }),
                          ),
                        ]),
                      ))));
        }
    );}

  changeIcon(IconData pramIcon) {
    if (pramIcon == Icons.expand_circle_down_outlined) {
      setState(() {
        showIcon = Icons.arrow_circle_up_outlined;
      });
    } else {
      setState(() {
        showIcon = Icons.expand_circle_down_outlined;
      });
    }
  }
}
