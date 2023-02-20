import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:qna_test/Pages/teacher_add_my_question_bank.dart';
import '../Entity/demo_question_model.dart';
import '../Entity/question_model.dart';
import '../Providers/question_prepare_provider.dart';

import '../EntityModel/GetQuestionBankModel.dart';
class TeacherLooqPreview extends StatefulWidget {
  const TeacherLooqPreview({
    Key? key,
    required this.question,
    required this.setLocale,
  }) : super(key: key);

  final Question question;
  final void Function(Locale locale) setLocale;
  @override
  TeacherLooqPreviewState createState() => TeacherLooqPreviewState();
}

class TeacherLooqPreviewState extends State<TeacherLooqPreview> {
  String? _groupValue;
  TextEditingController adviceController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  IconData showIcon = Icons.expand_circle_down_outlined;
    List<Choice> selected = [];


  @override
  void initState() {
    super.initState();
    adviceController.text = widget.question.advisorText!;
    urlController.text = widget.question.advisorUrl!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
        // appBar: AppBar(
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 10),
        //       child: IconButton(
        //         icon: const Icon(
        //           Icons.menu,
        //           size: 40.0,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //       ),
        //     ),
        //   ],
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.chevron_left,
        //       size: 40.0,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   toolbarHeight: height * 0.100,
        //   centerTitle: true,
        //   title: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Text(
        //           "PREPARE QUESTION",
        //           style: TextStyle(
        //             color: const Color.fromRGBO(255, 255, 255, 1),
        //             fontSize: height * 0.0225,
        //             fontFamily: "Inter",
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ),
        //       ]),
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             end: Alignment.bottomCenter,
        //             begin: Alignment.topCenter,
        //             colors: [
        //               Color.fromRGBO(0, 106, 100, 1),
        //               Color.fromRGBO(82, 165, 160, 1),
        //             ])),
        //   ),
        // ),
        body: Center(
          child: SizedBox(
            height: height * 0.85,
            width: width * 0.888,
            child: Card(
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
                    Container(
                      height: height * 0.06,
                      color: const Color.fromRGBO(82, 165, 160, 0.1),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.02, left: width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.question.subject!,
                                  style: TextStyle(
                                    color: const Color.fromRGBO(28, 78, 80, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '  |  ${widget.question.topic}  -  ${widget.question.subTopic}',
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(102, 102, 102, 1),
                                    fontSize: height * 0.015,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.question.questionClass!,
                              style: TextStyle(
                                color: const Color.fromRGBO(28, 78, 80, 1),
                                fontSize: height * 0.015,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03, right: width * 0.03),
                      child: Row(children: <Widget>[
                        const Expanded(
                            child: Divider(
                          color: Color.fromRGBO(233, 233, 233, 1),
                          thickness: 2,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Text(widget.question.questionType!,
                              style: TextStyle(
                                  color: const Color.fromRGBO(82, 165, 160, 1),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.02)),
                        ),
                        const Expanded(
                            child: Divider(
                          color: Color.fromRGBO(233, 233, 233, 1),
                          thickness: 2,
                        )),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03, top: height * 0.02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.question.question!,
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
                              question: widget.question,
                              selected: selected,
                              height: height,
                              width: width)),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Advisor",
                            style: TextStyle(
                                color: const Color.fromRGBO(82, 165, 160, 1),
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
                                'Suggest what to study if answered incorrectly ',
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
                            labelText: 'URL - Any reference (Optional)',
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
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        minimumSize: const Size(280, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(39),
                        ),
                      ),
                      //shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Edit',
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
                        backgroundColor: const Color.fromRGBO(82, 165, 160, 1),
                        minimumSize: const Size(280, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(39),
                        ),
                      ),
                      //shape: StadiumBorder(),
                      onPressed: () {
                        Provider.of<QuestionPrepareProvider>(context,
                                listen: false)
                            .addQuestion(widget.question);
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: TeacherAddMyQuestionBank(
                                setLocale: widget.setLocale),
                          ),
                        );
                      },
                      child: Text(
                        'Finalize',
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
        ));
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
  const ChooseWidget({
    Key? key,
    required this.question,
    required this.height,
    required this.width,
    required this.selected,
  }) : super(key: key);

  final Question question;
  final List<Choice> selected;
  final double height;
  final double width;

  @override
  State<ChooseWidget> createState() => _ChooseWidgetState();
}

class _ChooseWidgetState extends State<ChooseWidget> {
  // List<int> tempChoiceList=[];
  // List<int>

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int j = 0; j < widget.question.choices!.length; j++)
          Padding(
            padding: EdgeInsets.only(bottom: widget.height * 0.013),
            child: Container(
                width: widget.width * 0.744,
                height: widget.height * 0.0412,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: const Color.fromRGBO(209, 209, 209, 1)),
                  color:
                  (widget.question.choicesAnswer!.contains(widget.question.choices![j]))
                      ? const Color.fromRGBO(82, 165, 160, 1)
                      : const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widget.width * 0.02,
                      ),
                      Expanded(
                        child: Text(
                          widget.question.choices![j].choiceText,
                          style: TextStyle(
                            color:
                                (widget.question.choicesAnswer!.contains(widget.question.choices![j]))
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(102, 102, 102, 1),
                            fontSize: widget.height * 0.0162,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ])),
          )
      ],
    );
  }
}