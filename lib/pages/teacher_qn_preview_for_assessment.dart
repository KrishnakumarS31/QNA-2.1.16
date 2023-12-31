import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qna_test/Providers/new_question_provider.dart';
import '../Entity/Teacher/question_entity.dart';
import '../Providers/question_prepare_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:qna_test/DataSource/http_url.dart';

class TeacherQnPreviewAssessment extends StatefulWidget {
  TeacherQnPreviewAssessment(
      {super.key, required this.assessment,
      required this.finalQuestion,
      });
  Question finalQuestion;
  bool assessment;


  @override
  TeacherQnPreviewAssessmentState createState() =>
      TeacherQnPreviewAssessmentState();
}

class TeacherQnPreviewAssessmentState
    extends State<TeacherQnPreviewAssessment> {
  TextEditingController adviceController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  IconData showIcon = Icons.expand_circle_down_outlined;

  List<dynamic> selected = [];

  @override
  void initState() {
    super.initState();
    adviceController.text = widget.finalQuestion.advisorText!;
    urlController.text = widget.finalQuestion.advisorUrl!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // if (constraints.maxWidth > 900) { return WillPopScope(
          //     onWillPop: () async => false,
          //     child: Scaffold(
          //         resizeToAvoidBottomInset: true,
          //         backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
          //         body: Center(
          //           child: SizedBox(
          //             height: height * 0.81,
          //             width: width * 0.888,
          //             child: Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(15.0),
          //                 ),
          //                 elevation: 12,
          //                 color: const Color.fromRGBO(255, 255, 255, 1),
          //                 margin: EdgeInsets.only(
          //                     left: width * 0.030,
          //                     right: width * 0.030,
          //                     bottom: height * 0.015,
          //                     top: height * 0.025),
          //                 //padding: const EdgeInsets.all(40),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     //ChooseWidget(question: question, selected: selected, height: height, width: width),
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                           left: width * 0.03, top: height * 0.02),
          //                       child: Align(
          //                         alignment: Alignment.centerLeft,
          //                         child: Text('${widget.finalQuestion.questionType}',
          //                             style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontFamily: 'Inter',
          //                                 fontWeight: FontWeight.w700,
          //                                 fontSize: height * 0.02)),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                           left: width * 0.03, top: height * 0.02),
          //                       child: Align(
          //                         alignment: Alignment.centerLeft,
          //                         child: Text('${widget.finalQuestion.question}',
          //                             style: TextStyle(
          //                                 color: const Color.fromRGBO(51, 51, 51, 1),
          //                                 fontFamily: 'Inter',
          //                                 fontWeight: FontWeight.w400,
          //                                 fontSize: height * 0.015)),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.25,
          //                       child: SingleChildScrollView(
          //                         scrollDirection: Axis.vertical,
          //                         child: ChooseWidget(
          //                           selected: selected,
          //                           height: height,
          //                           width: width,
          //                           finalQuestion: widget.finalQuestion,
          //                         ),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(left: width * 0.03),
          //                       child: Align(
          //                         alignment: Alignment.centerLeft,
          //                         child: Text(
          //                             AppLocalizations.of(context)!.advisor,
          //                             //"Advisor",
          //                             style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontFamily: 'Inter',
          //                                 fontWeight: FontWeight.w700,
          //                                 fontSize: height * 0.02)),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                           left: width * 0.03, right: width * 0.03),
          //                       child: TextFormField(
          //                         controller: adviceController,
          //                         enabled: false,
          //                         decoration: InputDecoration(
          //                             border: const UnderlineInputBorder(),
          //                             labelText:
          //                             AppLocalizations.of(context)!.suggest_study,
          //                             // 'Suggest what to study if answered incorrectly ',
          //                             labelStyle: TextStyle(
          //                                 color: const Color.fromRGBO(0, 0, 0, 0.25),
          //                                 fontFamily: 'Inter',
          //                                 fontWeight: FontWeight.w400,
          //                                 fontSize: height * 0.015)),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                           left: width * 0.03, right: width * 0.03),
          //                       child: TextFormField(
          //                         controller: urlController,
          //                         enabled: false,
          //                         decoration: InputDecoration(
          //                             border: const UnderlineInputBorder(),
          //                             labelText:
          //                             AppLocalizations.of(context)!.url_reference,
          //                             //'URL - Any reference (Optional)',
          //                             labelStyle: TextStyle(
          //                                 color: const Color.fromRGBO(0, 0, 0, 0.25),
          //                                 fontFamily: 'Inter',
          //                                 fontWeight: FontWeight.w400,
          //                                 fontSize: height * 0.015)),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                     ElevatedButton(
          //                       style: ElevatedButton.styleFrom(
          //                         side: const BorderSide(
          //                           color: Color.fromRGBO(82, 165, 160, 1),
          //                         ),
          //                         backgroundColor:
          //                         const Color.fromRGBO(255, 255, 255, 1),
          //                         minimumSize: const Size(280, 48),
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(39),
          //                         ),
          //                       ),
          //                       onPressed: () {
          //                         Navigator.of(context).pop();
          //                       },
          //                       child: Text(
          //                         AppLocalizations.of(context)!.edit_button,
          //                         //'Edit',
          //                         style: TextStyle(
          //                             fontSize: height * 0.025,
          //                             fontFamily: "Inter",
          //                             color: const Color.fromRGBO(82, 165, 160, 1),
          //                             fontWeight: FontWeight.w600),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                     ElevatedButton(
          //                       style: ElevatedButton.styleFrom(
          //                         backgroundColor:
          //                         const Color.fromRGBO(82, 165, 160, 1),
          //                         minimumSize: const Size(280, 48),
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(39),
          //                         ),
          //                       ),
          //                       //shape: StadiumBorder(),
          //                       onPressed: () {
          //                         widget.finalQuestion.questionType=='MCQ'?widget.finalQuestion.questionMark=1:widget.finalQuestion.questionMark=0;
          //                         Provider.of<NewQuestionProvider>(context,
          //                             listen: false)
          //                             .addQuestion(widget.finalQuestion);
          //                         Provider.of<QuestionPrepareProvider>(context,
          //                             listen: false)
          //                             .addQuestion(widget.finalQuestion);
          //                         Navigator.pushNamed(
          //                           context,
          //                           '/teacherAddMyQuestionBankForAssessment',
          //                           arguments: widget.assessment,
          //                         );
          //                         // Navigator.push(
          //                         //   context,
          //                         //   PageTransition(
          //                         //     type: PageTransitionType.rightToLeft,
          //                         //     child: TeacherAddMyQuestionBankForAssessment(
          //                         //       assessment: widget.assessment,
          //                         //     ),
          //                         //   ),
          //                         // );
          //                       },
          //                       child: Text(
          //                         AppLocalizations.of(context)!.finalize,
          //                         //'Finalize',
          //                         style: TextStyle(
          //                             fontSize: height * 0.025,
          //                             fontFamily: "Inter",
          //                             color: const Color.fromRGBO(255, 255, 255, 1),
          //                             fontWeight: FontWeight.w600),
          //                       ),
          //                     ),
          //                   ],
          //                 )),
          //           ),
          //         )));}
          if(constraints.maxWidth > 500) { return Center(
            child: WillPopScope(
                onWillPop: () async => false,
                child: SizedBox(
                  width: webWidth,
                  child: Scaffold(
                      resizeToAvoidBottomInset: true,
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
                      body: Center(
                        child: SizedBox(
                          height: height * 0.81,
                          width: webWidth * 0.888,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 12,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              margin: EdgeInsets.only(
                                  left: width * 0.030,
                                  right: width * 0.030,
                                  bottom: height * 0.015,
                                  top: height * 0.025),
                              //padding: const EdgeInsets.all(40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //ChooseWidget(question: question, selected: selected, height: height, width: width),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: webWidth * 0.03, top: height * 0.02),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('${widget.finalQuestion.questionType}',
                                          style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              fontSize: height * 0.02)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: webWidth * 0.03, top: height * 0.02),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('${widget.finalQuestion.question}',
                                          style: TextStyle(
                                              color: const Color.fromRGBO(51, 51, 51, 1),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.015)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  SizedBox(
                                    height: height * 0.25,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: ChooseWidget(
                                        selected: selected,
                                        height: height,
                                        width: webWidth,
                                        finalQuestion: widget.finalQuestion,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: webWidth * 0.03),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          AppLocalizations.of(context)!.advisor,
                                          //"Advisor",
                                          style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              fontSize: height * 0.02)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: webWidth * 0.03, right: webWidth * 0.03),
                                    child: TextFormField(
                                      controller: adviceController,
                                      enabled: false,
                                      decoration: InputDecoration(
                                          border: const UnderlineInputBorder(),
                                          labelText:
                                          AppLocalizations.of(context)!.suggest_study,
                                          // 'Suggest what to study if answered incorrectly ',
                                          labelStyle: TextStyle(
                                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.015)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: webWidth * 0.03, right: webWidth * 0.03),
                                    child: TextFormField(
                                      controller: urlController,
                                      enabled: false,
                                      decoration: InputDecoration(
                                          border: const UnderlineInputBorder(),
                                          labelText:
                                          AppLocalizations.of(context)!.url_reference,
                                          //'URL - Any reference (Optional)',
                                          labelStyle: TextStyle(
                                              color: const Color.fromRGBO(0, 0, 0, 0.25),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.015)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Color.fromRGBO(82, 165, 160, 1),
                                      ),
                                      backgroundColor:
                                      const Color.fromRGBO(255, 255, 255, 1),
                                      minimumSize: const Size(280, 48),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(39),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.edit_button,
                                      //'Edit',
                                      style: TextStyle(
                                          fontSize: height * 0.025,
                                          fontFamily: "Inter",
                                          color: const Color.fromRGBO(82, 165, 160, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      const Color.fromRGBO(82, 165, 160, 1),
                                      minimumSize: const Size(280, 48),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(39),
                                      ),
                                    ),
                                    //shape: StadiumBorder(),
                                    onPressed: () {
                                      widget.finalQuestion.questionType=='MCQ'?widget.finalQuestion.questionMark=1:widget.finalQuestion.questionMark=0;
                                      Provider.of<NewQuestionProvider>(context,
                                          listen: false)
                                          .addQuestion(widget.finalQuestion);
                                      Provider.of<QuestionPrepareProvider>(context,
                                          listen: false)
                                          .addQuestion(widget.finalQuestion);
                                      Navigator.pushNamed(
                                        context,
                                        '/teacherAddMyQuestionBankForAssessment',
                                        arguments: widget.assessment,
                                      );
                                      // Navigator.push(
                                      //   context,
                                      //   PageTransition(
                                      //     type: PageTransitionType.rightToLeft,
                                      //     child: TeacherAddMyQuestionBankForAssessment(
                                      //       assessment: widget.assessment,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.finalize,
                                      //'Finalize',
                                      style: TextStyle(
                                          fontSize: height * 0.025,
                                          fontFamily: "Inter",
                                          color: const Color.fromRGBO(255, 255, 255, 1),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      )),
                )),
          );}
          else { return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
                  body: Center(
                    child: SizedBox(
                      height: height * 0.81,
                      width: width * 0.888,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 12,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          margin: EdgeInsets.only(
                              left: width * 0.030,
                              right: width * 0.030,
                              bottom: height * 0.015,
                              top: height * 0.025),
                          //padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //ChooseWidget(question: question, selected: selected, height: height, width: width),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, top: height * 0.02),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('${widget.finalQuestion.questionType}',
                                      style: TextStyle(
                                          color:
                                          const Color.fromRGBO(82, 165, 160, 1),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: height * 0.02)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, top: height * 0.02),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('${widget.finalQuestion.question}',
                                      style: TextStyle(
                                          color: const Color.fromRGBO(51, 51, 51, 1),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.015)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              SizedBox(
                                height: height * 0.25,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: ChooseWidget(
                                    selected: selected,
                                    height: height,
                                    width: width,
                                    finalQuestion: widget.finalQuestion,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      AppLocalizations.of(context)!.advisor,
                                      //"Advisor",
                                      style: TextStyle(
                                          color:
                                          const Color.fromRGBO(82, 165, 160, 1),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: height * 0.02)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, right: width * 0.03),
                                child: TextFormField(
                                  controller: adviceController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      labelText:
                                      AppLocalizations.of(context)!.suggest_study,
                                      // 'Suggest what to study if answered incorrectly ',
                                      labelStyle: TextStyle(
                                          color: const Color.fromRGBO(0, 0, 0, 0.25),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.015)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, right: width * 0.03),
                                child: TextFormField(
                                  controller: urlController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      labelText:
                                      AppLocalizations.of(context)!.url_reference,
                                      //'URL - Any reference (Optional)',
                                      labelStyle: TextStyle(
                                          color: const Color.fromRGBO(0, 0, 0, 0.25),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.015)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color.fromRGBO(82, 165, 160, 1),
                                  ),
                                  backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                                  minimumSize: const Size(280, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(39),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.edit_button,
                                  //'Edit',
                                  style: TextStyle(
                                      fontSize: height * 0.025,
                                      fontFamily: "Inter",
                                      color: const Color.fromRGBO(82, 165, 160, 1),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color.fromRGBO(82, 165, 160, 1),
                                  minimumSize: const Size(280, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(39),
                                  ),
                                ),
                                //shape: StadiumBorder(),
                                onPressed: () {
                                  widget.finalQuestion.questionType=='MCQ'?widget.finalQuestion.questionMark=1:widget.finalQuestion.questionMark=0;
                                  Provider.of<NewQuestionProvider>(context,
                                      listen: false)
                                      .addQuestion(widget.finalQuestion);
                                  Provider.of<QuestionPrepareProvider>(context,
                                      listen: false)
                                      .addQuestion(widget.finalQuestion);
                                  Navigator.pushNamed(
                                    context,
                                    '/teacherAddMyQuestionBankForAssessment',
                                    arguments: widget.assessment,
                                  );
                                  // Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.rightToLeft,
                                  //     child: TeacherAddMyQuestionBankForAssessment(
                                  //       assessment: widget.assessment,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.finalize,
                                  //'Finalize',
                                  style: TextStyle(
                                      fontSize: height * 0.025,
                                      fontFamily: "Inter",
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )),
                    ),
                  )));}
        },
    );

  }

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

class ChooseWidget extends StatefulWidget {
  ChooseWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.selected,
    this.finalQuestion,
  }) : super(key: key);

  final List<dynamic> selected;
  final double height;
  final double width;
  Question? finalQuestion;

  @override
  State<ChooseWidget> createState() => _ChooseWidgetState();
}

class _ChooseWidgetState extends State<ChooseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int j = 0; j < widget.finalQuestion!.choices!.length; j++)
          MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.height * 0.013),
              child: Container(
                  width: widget.width * 0.744,
                  height: widget.height * 0.0412,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: const Color.fromRGBO(209, 209, 209, 1)),
                    color: (widget.finalQuestion!.choices![j].rightChoice!)
                        ? const Color.fromRGBO(82, 165, 160, 1)
                        : const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widget.width * 0.02,
                        ),
                        Text(
                          widget.finalQuestion!.choices![j].choiceText!,
                          style: TextStyle(
                            color:
                                (widget.finalQuestion!.choices![j].rightChoice!)
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(102, 102, 102, 1),
                            fontSize: widget.height * 0.0162,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ])),
            ),
          ))
      ],
    );
  }
}
