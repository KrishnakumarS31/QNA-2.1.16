import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/end_drawer_menu_teacher.dart';
import '../Entity/Teacher/get_assessment_model.dart';
import '../Entity/Teacher/question_entity.dart' as questions;
import '../EntityModel/CreateAssessmentModel.dart';
import '../Providers/edit_assessment_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:qna_test/DataSource/http_url.dart';

class TeacherRecentAssessment extends StatefulWidget {
  TeacherRecentAssessment(
      {Key? key, required this.finalAssessment,required this.assessmentType})
      : super(key: key);
  CreateAssessmentModel finalAssessment;
  String assessmentType;

  @override
  TeacherRecentAssessmentState createState() => TeacherRecentAssessmentState();
}

class TeacherRecentAssessmentState extends State<TeacherRecentAssessment> {
  bool additionalDetails = true;
  bool questionShirnk = false;
  GetAssessmentModel assessment = GetAssessmentModel();
  CreateAssessmentModel finalAssessment = CreateAssessmentModel(questions: []);
  int mark = 0;

  showAdditionalDetails() {
    setState(() {
      additionalDetails = !additionalDetails;
    });
  }

  showQuestionDetails() {
    setState(() {
      questionShirnk = !questionShirnk;
    });
  }

  @override
  void initState() {
    assessment = Provider.of<EditAssessmentProvider>(context, listen: false)
        .getAssessment;
    finalAssessment = widget.finalAssessment;
    finalAssessment.removeQuestions = [];
    for (int i = 0; i < finalAssessment.questions!.length; i++) {
      mark = mark + finalAssessment.questions![i].questionMarks!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // if(constraints.maxWidth > 900)
          //   {
          //     return WillPopScope(
          //         onWillPop: () async => false,
          //         child: Scaffold(
          //           extendBodyBehindAppBar: true,
          //           endDrawer: const EndDrawerMenuTeacher(),
          //           appBar: AppBar(
          //             elevation: 0,
          //             automaticallyImplyLeading: false,
          //             backgroundColor: Colors.transparent,
          //             leading: IconButton(
          //               icon: const Icon(
          //                 Icons.chevron_left,
          //                 size: 40.0,
          //                 color: Colors.white,
          //               ),
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //             ),
          //             toolbarHeight: height * 0.100,
          //             centerTitle: true,
          //             title: Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Text(
          //                     AppLocalizations.of(context)!.in_progress_caps,
          //                     //"IN PROGRESS",
          //                     style: TextStyle(
          //                       color: const Color.fromRGBO(255, 255, 255, 1),
          //                       fontSize: height * 0.0225,
          //                       fontFamily: "Inter",
          //                       fontWeight: FontWeight.w400,
          //                     ),
          //                   ),
          //                   Text(
          //                     AppLocalizations.of(context)!.assessment_caps,
          //                     //"ASSESSMENTS",
          //                     style: TextStyle(
          //                       color: const Color.fromRGBO(255, 255, 255, 1),
          //                       fontSize: height * 0.0225,
          //                       fontFamily: "Inter",
          //                       fontWeight: FontWeight.w400,
          //                     ),
          //                   ),
          //                 ]),
          //             flexibleSpace: Container(
          //               decoration: const BoxDecoration(
          //                   gradient: LinearGradient(
          //                       end: Alignment.bottomCenter,
          //                       begin: Alignment.topCenter,
          //                       colors: [
          //                         Color.fromRGBO(0, 106, 100, 1),
          //                         Color.fromRGBO(82, 165, 160, 1),
          //                       ])),
          //             ),
          //           ),
          //           body: SingleChildScrollView(
          //             scrollDirection: Axis.vertical,
          //             child: Padding(
          //                 padding: EdgeInsets.only(
          //                     top: height * 0.023,
          //                     left: height * 0.023,
          //                     right: height * 0.023),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     SizedBox(
          //                       height: height * 0.18,
          //                     ),
          //                     Center(
          //                       child: Container(
          //                         decoration: BoxDecoration(
          //                           border: Border.all(
          //                             color: const Color.fromRGBO(217, 217, 217, 1),
          //                           ),
          //                           color: Colors.white,
          //                         ),
          //                         width: width * 0.888,
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Container(
          //                               decoration: const BoxDecoration(
          //                                 borderRadius: BorderRadius.only(
          //                                     topLeft: Radius.circular(1.0),
          //                                     topRight: Radius.circular(1.0)),
          //                                 color: Color.fromRGBO(82, 165, 160, 1),
          //                               ),
          //                               child: Padding(
          //                                 padding: EdgeInsets.only(left: width * 0.02),
          //                                 child: Row(
          //                                   children: [
          //                                     Text(
          //                                       assessment.subject!,
          //                                       style: TextStyle(
          //                                         color: const Color.fromRGBO(
          //                                             255, 255, 255, 1),
          //                                         fontSize: height * 0.02,
          //                                         fontFamily: "Inter",
          //                                         fontWeight: FontWeight.w700,
          //                                       ),
          //                                     ),
          //                                     Text(
          //                                       "  |  ${assessment.getAssessmentModelClass}",
          //                                       style: TextStyle(
          //                                         color: const Color.fromRGBO(
          //                                             255, 255, 255, 1),
          //                                         fontSize: height * 0.015,
          //                                         fontFamily: "Inter",
          //                                         fontWeight: FontWeight.w400,
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                             Row(
          //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                               children: [
          //                                 Padding(
          //                                   padding: EdgeInsets.only(right: width * 0.02),
          //                                   child: const Icon(
          //                                     Icons.circle,
          //                                     color: Colors.white,
          //                                   ),
          //                                 ),
          //                                 Text(
          //                                   "${assessment.topic} - ${assessment.subTopic}",
          //                                   style: TextStyle(
          //                                     color:
          //                                     const Color.fromRGBO(102, 102, 102, 1),
          //                                     fontSize: height * 0.015,
          //                                     fontFamily: "Inter",
          //                                     fontWeight: FontWeight.w400,
          //                                   ),
          //                                 ),
          //                                 Padding(
          //                                   padding: EdgeInsets.only(right: width * 0.02),
          //                                   child: const Icon(
          //                                     Icons.circle,
          //                                     color: Color.fromRGBO(255, 166, 0, 1),
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Container(
          //                                   decoration: const BoxDecoration(
          //                                     color: Colors.white,
          //                                   ),
          //                                   width: width * 0.44,
          //                                   height: height * 0.0875,
          //                                   child: Column(
          //                                     mainAxisAlignment:
          //                                     MainAxisAlignment.spaceEvenly,
          //                                     children: [
          //                                       Text(
          //                                         "$mark",
          //                                         style: TextStyle(
          //                                           color: const Color.fromRGBO(
          //                                               28, 78, 80, 1),
          //                                           fontSize: height * 0.03,
          //                                           fontFamily: "Inter",
          //                                           fontWeight: FontWeight.w700,
          //                                         ),
          //                                       ),
          //                                       Text(
          //                                         AppLocalizations.of(context)!.marks,
          //                                         //"Marks",
          //                                         style: TextStyle(
          //                                           color: const Color.fromRGBO(
          //                                               102, 102, 102, 1),
          //                                           fontSize: height * 0.015,
          //                                           fontFamily: "Inter",
          //                                           fontWeight: FontWeight.w400,
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 const SizedBox(
          //                                     height: 50,
          //                                     child: VerticalDivider(
          //                                         color:
          //                                         Color.fromRGBO(204, 204, 204, 1))),
          //                                 SizedBox(
          //                                   width: width * 0.4,
          //                                   height: height * 0.0875,
          //                                   child: Column(
          //                                     mainAxisAlignment:
          //                                     MainAxisAlignment.spaceEvenly,
          //                                     children: [
          //                                       Text(
          //                                         "${finalAssessment.questions?.length}",
          //                                         style: TextStyle(
          //                                           color: const Color.fromRGBO(
          //                                               28, 78, 80, 1),
          //                                           fontSize: height * 0.03,
          //                                           fontFamily: "Inter",
          //                                           fontWeight: FontWeight.w700,
          //                                         ),
          //                                       ),
          //                                       Text(
          //                                         AppLocalizations.of(context)!.qn_button,
          //                                         //"Questions",
          //                                         style: TextStyle(
          //                                           color: const Color.fromRGBO(
          //                                               102, 102, 102, 1),
          //                                           fontSize: height * 0.015,
          //                                           fontFamily: "Inter",
          //                                           fontWeight: FontWeight.w400,
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 )
          //                               ],
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.025,
          //                     ),
          //                     Row(
          //                       children: [
          //                         SizedBox(
          //                           width: width * 0.4,
          //                           child: Text(
          //                             AppLocalizations.of(context)!.assessment_id_caps,
          //                             //"Assessment ID:",
          //                             style: TextStyle(
          //                               color: const Color.fromRGBO(102, 102, 102, 1),
          //                               fontSize: height * 0.02,
          //                               fontFamily: "Inter",
          //                               fontWeight: FontWeight.w600,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           "${assessment.assessmentCode}",
          //                           style: TextStyle(
          //                             color: const Color.fromRGBO(82, 165, 160, 1),
          //                             fontSize: height * 0.0175,
          //                             fontFamily: "Inter",
          //                             fontWeight: FontWeight.w700,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     Row(
          //                       children: [
          //                         SizedBox(
          //                           width: width * 0.4,
          //                           child: Text(
          //                             AppLocalizations.of(context)!.institute_test_id_small,
          //                             //"Institute Test ID:",
          //                             style: TextStyle(
          //                               color: const Color.fromRGBO(102, 102, 102, 1),
          //                               fontSize: height * 0.02,
          //                               fontFamily: "Inter",
          //                               fontWeight: FontWeight.w600,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           "----------",
          //                           style: TextStyle(
          //                             color: const Color.fromRGBO(82, 165, 160, 1),
          //                             fontSize: height * 0.0175,
          //                             fontFamily: "Inter",
          //                             fontWeight: FontWeight.w700,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     const Divider(),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     Row(
          //                       children: [
          //                         SizedBox(
          //                           width: width * 0.4,
          //                           child: Text(
          //                             AppLocalizations.of(context)!.time_permitted,
          //                             //"Time Permitted:",
          //                             style: TextStyle(
          //                               color: const Color.fromRGBO(102, 102, 102, 1),
          //                               fontSize: height * 0.02,
          //                               fontFamily: "Inter",
          //                               fontWeight: FontWeight.w600,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           assessment.assessmentDuration == null
          //                               ? "00 Minutes"
          //                               : "${assessment.assessmentDuration} Minutes",
          //                           style: TextStyle(
          //                             color: const Color.fromRGBO(82, 165, 160, 1),
          //                             fontSize: height * 0.0175,
          //                             fontFamily: "Inter",
          //                             fontWeight: FontWeight.w700,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     Row(
          //                       children: [
          //                         SizedBox(
          //                           width: width * 0.4,
          //                           child: Text(
          //                             "${AppLocalizations.of(context)!.start_date_time} : ",
          //                             //"Start Date & Time:",
          //                             style: TextStyle(
          //                               color: const Color.fromRGBO(102, 102, 102, 1),
          //                               fontSize: height * 0.02,
          //                               fontFamily: "Inter",
          //                               fontWeight: FontWeight.w600,
          //                             ),
          //                           ),
          //                         ),
          //                         finalAssessment.assessmentStartdate == null
          //                             ? Text(
          //                           "DD/MM/YYYY      HH:MM AM",
          //                           style: TextStyle(
          //                             color: const Color.fromRGBO(153, 153, 153, 1),
          //                             fontSize: height * 0.0175,
          //                             fontFamily: "Inter",
          //                             fontWeight: FontWeight.w400,
          //                           ),
          //                         )
          //                             : Text(
          //                           "ABC903857928",
          //                           style: TextStyle(
          //                             color: const Color.fromRGBO(82, 165, 160, 1),
          //                             fontSize: height * 0.0175,
          //                             fontFamily: "Inter",
          //                             fontWeight: FontWeight.w700,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     Row(
          //                       children: [
          //                         SizedBox(
          //                           width: width * 0.4,
          //                           child: Text(
          //                             "${AppLocalizations.of(context)!.end_date_time} : ",
          //                             style: TextStyle(
          //                               color: const Color.fromRGBO(102, 102, 102, 1),
          //                               fontSize: height * 0.02,
          //                               fontFamily: "Inter",
          //                               fontWeight: FontWeight.w600,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           "DD/MM/YYYY      HH:MM AM",
          //                           style: TextStyle(
          //                             color: const Color.fromRGBO(153, 153, 153, 1),
          //                             fontSize: height * 0.0175,
          //                             fontFamily: "Inter",
          //                             fontWeight: FontWeight.w400,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     const Divider(),
          //                     SizedBox(
          //                       height: height * 0.01,
          //                     ),
          //                     additionalDetails
          //                         ? Container(
          //                       height: height * 0.05,
          //                       decoration: const BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(8.0),
          //                             topRight: Radius.circular(8.0)),
          //                         color: Color.fromRGBO(82, 165, 160, 1),
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.only(left: width * 0.02),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text(
          //                               AppLocalizations.of(context)!.additional_details,
          //                               //"Additional Details",
          //                               style: TextStyle(
          //                                 color: const Color.fromRGBO(
          //                                     255, 255, 255, 1),
          //                                 fontSize: height * 0.02,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding:
          //                               EdgeInsets.only(right: width * 0.02),
          //                               child: IconButton(
          //                                 icon: const Icon(
          //                                   Icons.arrow_circle_up_outlined,
          //                                   color: Color.fromRGBO(255, 255, 255, 1),
          //                                 ),
          //                                 onPressed: () {
          //                                   showAdditionalDetails();
          //                                 },
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     )
          //                         : Container(
          //                       height: height * 0.05,
          //                       decoration: const BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(8.0),
          //                             topRight: Radius.circular(8.0)),
          //                         color: Color.fromRGBO(82, 165, 160, 1),
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.only(left: width * 0.02),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text(
          //                               AppLocalizations.of(context)!.additional_details,
          //                               //"Additional Details",
          //                               style: TextStyle(
          //                                 color: const Color.fromRGBO(
          //                                     255, 255, 255, 1),
          //                                 fontSize: height * 0.02,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding:
          //                               EdgeInsets.only(right: width * 0.02),
          //                               child: IconButton(
          //                                 icon: const Icon(
          //                                   Icons.arrow_circle_down_outlined,
          //                                   color: Color.fromRGBO(255, 255, 255, 1),
          //                                 ),
          //                                 onPressed: () {
          //                                   showAdditionalDetails();
          //                                 },
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.02,
          //                     ),
          //                     additionalDetails
          //                         ? Column(
          //                       children: [
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.category,
          //                                 //"Category",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               "${finalAssessment.assessmentType}",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: height * 0.01,
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.retries,
          //                                 // "Retries",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               finalAssessment.assessmentSettings
          //                                   ?.allowedNumberOfTestRetries !=
          //                                   null
          //                                   ? "${AppLocalizations.of(context)!.allowed}(${finalAssessment.assessmentSettings?.allowedNumberOfTestRetries} Times)"
          //                               //"Allowed (${finalAssessment.assessmentSettings?.allowedNumberOfTestRetries} Times)"
          //                                   : AppLocalizations.of(context)!.not_allowed,
          //                               //"Not Allowed",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: height * 0.01,
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.guest,
          //                                 // "Guest",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               assessment.assessmentSettings?.allowGuestStudent ==
          //                                   null
          //                                   ? AppLocalizations.of(context)!.not_allowed
          //                               //"Not Allowed"
          //                                   : assessment
          //                                   .assessmentSettings!.allowGuestStudent!
          //                                   ? AppLocalizations.of(context)!.allowed
          //                               //"Allowed"
          //                                   : AppLocalizations.of(context)!.not_allowed,
          //                               //"Not Allowed",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: height * 0.01,
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.answer_sheet,
          //                                 //"Answer Sheet",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               assessment.assessmentSettings
          //                                   ?.showSolvedAnswerSheetInAdvisor ==
          //                                   null
          //                                   ? AppLocalizations.of(context)!.not_viewable
          //                               //"Not Viewable"
          //                                   : assessment.assessmentSettings!
          //                                   .showSolvedAnswerSheetInAdvisor!
          //                                   ? AppLocalizations.of(context)!.viewable
          //                               //"Viewable"
          //                                   : AppLocalizations.of(context)!.not_viewable,
          //                               //"Not Viewable",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: height * 0.01,
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.advisor,
          //                                 //"Advisor",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               assessment.assessmentSettings?.showAdvisorName ==
          //                                   null
          //                                   ? AppLocalizations.of(context)!.no
          //                               //"No"
          //                                   : assessment
          //                                   .assessmentSettings!.showAdvisorName!
          //                                   ? AppLocalizations.of(context)!.yes
          //                               //"Yes"
          //                                   : AppLocalizations.of(context)!.no,
          //                               //"No",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: height * 0.01,
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.email_small,
          //                                 //"Email",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               assessment.assessmentSettings?.showAdvisorEmail ==
          //                                   null
          //                                   ? AppLocalizations.of(context)!.no
          //                               //"No"
          //                                   : assessment
          //                                   .assessmentSettings!.showAdvisorEmail!
          //                                   ? AppLocalizations.of(context)!.yes
          //                               //"Yes"
          //                                   : AppLocalizations.of(context)!.no,
          //                               //"No",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: height * 0.01,
          //                         ),
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               width: width * 0.4,
          //                               child: Text(
          //                                 AppLocalizations.of(context)!.in_active,
          //                                 //"Inactive",
          //                                 style: TextStyle(
          //                                   color: const Color.fromRGBO(
          //                                       102, 102, 102, 1),
          //                                   fontSize: height * 0.02,
          //                                   fontFamily: "Inter",
          //                                   fontWeight: FontWeight.w600,
          //                                 ),
          //                               ),
          //                             ),
          //                             Text(
          //                               assessment.assessmentSettings?.notAvailable == null
          //                                   ? AppLocalizations.of(context)!.no
          //                               //"No"
          //                                   : assessment.assessmentSettings!.notAvailable!
          //                                   ? AppLocalizations.of(context)!.yes
          //                               //"Yes"
          //                                   : AppLocalizations.of(context)!.no,
          //                               //"No",
          //                               style: TextStyle(
          //                                 color:
          //                                 const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontSize: height * 0.0175,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ],
          //                     )
          //                         : const SizedBox(
          //                       height: 0,
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                     questionShirnk
          //                         ? Container(
          //                       height: height * 0.05,
          //                       decoration: const BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(8.0),
          //                             topRight: Radius.circular(8.0)),
          //                         color: Color.fromRGBO(82, 165, 160, 1),
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.only(left: width * 0.02),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text(
          //                               AppLocalizations.of(context)!.qn_button,
          //                               //"Questions",
          //                               style: TextStyle(
          //                                 color: const Color.fromRGBO(
          //                                     255, 255, 255, 1),
          //                                 fontSize: height * 0.02,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding:
          //                               EdgeInsets.only(right: width * 0.02),
          //                               child: IconButton(
          //                                 onPressed: () {
          //                                   showQuestionDetails();
          //                                 },
          //                                 icon: const Icon(
          //                                   Icons.arrow_circle_up_outlined,
          //                                   color: Color.fromRGBO(255, 255, 255, 1),
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     )
          //                         : Container(
          //                       height: height * 0.05,
          //                       decoration: const BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(8.0),
          //                             topRight: Radius.circular(8.0)),
          //                         color: Color.fromRGBO(82, 165, 160, 1),
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.only(left: width * 0.02),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text(
          //                               AppLocalizations.of(context)!.qn_button,
          //                               //"Questions",
          //                               style: TextStyle(
          //                                 color: const Color.fromRGBO(
          //                                     255, 255, 255, 1),
          //                                 fontSize: height * 0.02,
          //                                 fontFamily: "Inter",
          //                                 fontWeight: FontWeight.w700,
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding:
          //                               EdgeInsets.only(right: width * 0.02),
          //                               child: IconButton(
          //                                 onPressed: () {
          //                                   showQuestionDetails();
          //                                 },
          //                                 icon: const Icon(
          //                                   Icons.arrow_circle_down_outlined,
          //                                   color: Color.fromRGBO(255, 255, 255, 1),
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     questionShirnk
          //                         ? SizedBox(
          //                       height: height * 0.4,
          //                       child: ListView.builder(
          //                           padding: EdgeInsets.zero,
          //                           itemCount: assessment.questions!.length,
          //                           itemBuilder: (context, index) => QuestionWidget(
          //                             height: height,
          //                             question: assessment.questions![index],
          //                             assessment: finalAssessment,
          //                             index: index,
          //                           )),
          //                     )
          //                         : const SizedBox(
          //                       height: 0,
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.02,
          //                     ),
          //                     GestureDetector(
          //                       onTap: (){
          //                         showQuestionDetails();
          //                       },
          //                       child: Row(
          //                         children: [
          //                           const Expanded(child: Divider()),
          //                           Text(
          //                             AppLocalizations.of(context)!.view_all_qns,
          //                             //"  View All Questions  ",
          //                             style: TextStyle(
          //                               color: const Color.fromRGBO(28, 78, 80, 1),
          //                               fontSize: height * 0.02,
          //                               fontFamily: "Inter",
          //                               fontWeight: FontWeight.w700,
          //                             ),
          //                           ),
          //                           // const Icon(
          //                           //   Icons.keyboard_arrow_down_sharp,
          //                           //   color: Color.fromRGBO(28, 78, 80, 1),
          //                           // ),
          //                           const Expanded(child: Divider()),
          //                         ],
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.02,
          //                     ),
          //                     // Row(
          //                     //   children: [
          //                     //     Container(
          //                     //       height: height * 0.08,
          //                     //       width: width * 0.28,
          //                     //       decoration: const BoxDecoration(
          //                     //         border: Border(
          //                     //           right: BorderSide(
          //                     //             width: 1,
          //                     //             color: Color.fromRGBO(232, 232, 232, 1),
          //                     //           ),
          //                     //         ),
          //                     //       ),
          //                     //       child: Center(
          //                     //         child: Text(
          //                     //           "WEB",
          //                     //           textAlign: TextAlign.center,
          //                     //           style: TextStyle(
          //                     //             decoration: TextDecoration.underline,
          //                     //             color: const Color.fromRGBO(153, 153, 153, 1),
          //                     //             fontSize: height * 0.015,
          //                     //             fontFamily: "Inter",
          //                     //             fontWeight: FontWeight.w400,
          //                     //           ),
          //                     //         ),
          //                     //       ),
          //                     //     ),
          //                     //     Expanded(
          //                     //       child: SizedBox(
          //                     //         height: height * 0.08,
          //                     //         width: width * 0.3,
          //                     //         child: Center(
          //                     //           child: Text(
          //                     //             "Android App",
          //                     //             textAlign: TextAlign.center,
          //                     //             style: TextStyle(
          //                     //               decoration: TextDecoration.underline,
          //                     //               color: const Color.fromRGBO(153, 153, 153, 1),
          //                     //               fontSize: height * 0.015,
          //                     //               fontFamily: "Inter",
          //                     //               fontWeight: FontWeight.w400,
          //                     //             ),
          //                     //           ),
          //                     //         ),
          //                     //       ),
          //                     //     ),
          //                     //     Container(
          //                     //       height: height * 0.08,
          //                     //       width: width * 0.28,
          //                     //       decoration: const BoxDecoration(
          //                     //         border: Border(
          //                     //           left: BorderSide(
          //                     //             width: 1,
          //                     //             color: Color.fromRGBO(232, 232, 232, 1),
          //                     //           ),
          //                     //         ),
          //                     //       ),
          //                     //       child: Center(
          //                     //         child: Text(
          //                     //           "IOS App",
          //                     //           textAlign: TextAlign.center,
          //                     //           style: TextStyle(
          //                     //             decoration: TextDecoration.underline,
          //                     //             color: const Color.fromRGBO(153, 153, 153, 1),
          //                     //             fontSize: height * 0.015,
          //                     //             fontFamily: "Inter",
          //                     //             fontWeight: FontWeight.w400,
          //                     //           ),
          //                     //         ),
          //                     //       ),
          //                     //     )
          //                     //   ],
          //                     // ),
          //                     // SizedBox(
          //                     //   height: height * 0.03,
          //                     // ),
          //                     Center(
          //                       child: SizedBox(
          //                         width: width * 0.888,
          //                         child: ElevatedButton(
          //                           style: ElevatedButton.styleFrom(
          //                               backgroundColor:
          //                               const Color.fromRGBO(255, 255, 255, 1),
          //                               minimumSize: const Size(280, 48),
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius: BorderRadius.circular(39),
          //                               ),
          //                               side: const BorderSide(
          //                                 color: Color.fromRGBO(82, 165, 160, 1),
          //                               )),
          //                           onPressed: () {
          //                             Navigator.pushNamed(context, '/teacherAssessmentSummary',arguments: widget.assessmentType);
          //                           },
          //                           child: Text(
          //                             AppLocalizations.of(context)!.edit_button,
          //                             //'Edit',
          //                             style: TextStyle(
          //                                 fontSize: height * 0.025,
          //                                 fontFamily: "Inter",
          //                                 color: const Color.fromRGBO(82, 165, 160, 1),
          //                                 fontWeight: FontWeight.w600),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: height * 0.03,
          //                     ),
          //                   ],
          //                 )),
          //           ),
          //         ));
          //   }
          if(constraints.maxWidth > 500)
            {
              return Center(
                child: WillPopScope(
                    onWillPop: () async => false,
                    child: Container(
                      width: webWidth,
                      child: Scaffold(
                        extendBodyBehindAppBar: true,
                        endDrawer: const EndDrawerMenuTeacher(),
                        appBar: AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.transparent,
                          leading: IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          toolbarHeight: height * 0.100,
                          centerTitle: true,
                          title: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.in_progress_caps,
                                  //"IN PROGRESS",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: height * 0.0225,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.assessment_caps,
                                  //"ASSESSMENTS",
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
                                  left: height * 0.023,
                                  right: height * 0.023),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.18,
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromRGBO(217, 217, 217, 1),
                                        ),
                                        color: Colors.white,
                                      ),
                                      width: webWidth * 0.888,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(1.0),
                                                  topRight: Radius.circular(1.0)),
                                              color: Color.fromRGBO(82, 165, 160, 1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: webWidth * 0.02),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    assessment.subject!,
                                                    style: TextStyle(
                                                      color: const Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: height * 0.02,
                                                      fontFamily: "Inter",
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    "  |  ${assessment.getAssessmentModelClass}",
                                                    style: TextStyle(
                                                      color: const Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: height * 0.015,
                                                      fontFamily: "Inter",
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(right: webWidth * 0.02),
                                                child: const Icon(
                                                  Icons.circle,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${assessment.topic} - ${assessment.subTopic}",
                                                style: TextStyle(
                                                  color:
                                                  const Color.fromRGBO(102, 102, 102, 1),
                                                  fontSize: height * 0.015,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: webWidth * 0.02),
                                                child: const Icon(
                                                  Icons.circle,
                                                  color: Color.fromRGBO(255, 166, 0, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                width: webWidth * 0.44,
                                                height: height * 0.0875,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "$mark",
                                                      style: TextStyle(
                                                        color: const Color.fromRGBO(
                                                            28, 78, 80, 1),
                                                        fontSize: height * 0.03,
                                                        fontFamily: "Inter",
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(context)!.marks,
                                                      //"Marks",
                                                      style: TextStyle(
                                                        color: const Color.fromRGBO(
                                                            102, 102, 102, 1),
                                                        fontSize: height * 0.015,
                                                        fontFamily: "Inter",
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                  height: 50,
                                                  child: VerticalDivider(
                                                      color:
                                                      Color.fromRGBO(204, 204, 204, 1))),
                                              SizedBox(
                                                width: webWidth * 0.4,
                                                height: height * 0.0875,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "${finalAssessment.questions?.length}",
                                                      style: TextStyle(
                                                        color: const Color.fromRGBO(
                                                            28, 78, 80, 1),
                                                        fontSize: height * 0.03,
                                                        fontFamily: "Inter",
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(context)!.qn_button,
                                                      //"Questions",
                                                      style: TextStyle(
                                                        color: const Color.fromRGBO(
                                                            102, 102, 102, 1),
                                                        fontSize: height * 0.015,
                                                        fontFamily: "Inter",
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.025,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: webWidth * 0.4,
                                        child: Text(
                                          AppLocalizations.of(context)!.assessment_id_caps,
                                          //"Assessment ID:",
                                          style: TextStyle(
                                            color: const Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: height * 0.02,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${assessment.assessmentCode}",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(82, 165, 160, 1),
                                          fontSize: height * 0.0175,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: webWidth * 0.4,
                                        child: Text(
                                          AppLocalizations.of(context)!.institute_test_id_small,
                                          //"Institute Test ID:",
                                          style: TextStyle(
                                            color: const Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: height * 0.02,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "----------",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(82, 165, 160, 1),
                                          fontSize: height * 0.0175,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  const Divider(),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: webWidth * 0.4,
                                        child: Text(
                                          AppLocalizations.of(context)!.time_permitted,
                                          //"Time Permitted:",
                                          style: TextStyle(
                                            color: const Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: height * 0.02,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        assessment.assessmentDuration == null
                                            ? "00 Minutes"
                                            : "${assessment.assessmentDuration} Minutes",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(82, 165, 160, 1),
                                          fontSize: height * 0.0175,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: webWidth * 0.4,
                                        child: Text(
                                          "${AppLocalizations.of(context)!.start_date_time} : ",
                                          //"Start Date & Time:",
                                          style: TextStyle(
                                            color: const Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: height * 0.02,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      finalAssessment.assessmentStartdate == null
                                          ? Text(
                                        "DD/MM/YYYY      HH:MM AM",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(153, 153, 153, 1),
                                          fontSize: height * 0.0175,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                          : Text(
                                        "ABC903857928",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(82, 165, 160, 1),
                                          fontSize: height * 0.0175,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: webWidth * 0.4,
                                        child: Text(
                                          "${AppLocalizations.of(context)!.end_date_time} : ",
                                          style: TextStyle(
                                            color: const Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: height * 0.02,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "DD/MM/YYYY      HH:MM AM",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(153, 153, 153, 1),
                                          fontSize: height * 0.0175,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  const Divider(),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  additionalDetails
                                      ? Container(
                                    height: height * 0.05,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                      color: Color.fromRGBO(82, 165, 160, 1),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: webWidth * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.additional_details,
                                            //"Additional Details",
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: height * 0.02,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: webWidth * 0.02),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.arrow_circle_up_outlined,
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                              ),
                                              onPressed: () {
                                                showAdditionalDetails();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                      : Container(
                                    height: height * 0.05,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                      color: Color.fromRGBO(82, 165, 160, 1),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: webWidth * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.additional_details,
                                            //"Additional Details",
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: height * 0.02,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: webWidth * 0.02),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.arrow_circle_down_outlined,
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                              ),
                                              onPressed: () {
                                                showAdditionalDetails();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  additionalDetails
                                      ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: webWidth * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.category,
                                              //"Category",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${finalAssessment.assessmentType}",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: webWidth * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.retries,
                                              // "Retries",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            finalAssessment.assessmentSettings
                                                ?.allowedNumberOfTestRetries !=
                                                null
                                                ? "${AppLocalizations.of(context)!.allowed}(${finalAssessment.assessmentSettings?.allowedNumberOfTestRetries} Times)"
                                            //"Allowed (${finalAssessment.assessmentSettings?.allowedNumberOfTestRetries} Times)"
                                                : AppLocalizations.of(context)!.not_allowed,
                                            //"Not Allowed",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: webWidth * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.guest,
                                              // "Guest",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            assessment.assessmentSettings?.allowGuestStudent ==
                                                null
                                                ? AppLocalizations.of(context)!.not_allowed
                                            //"Not Allowed"
                                                : assessment
                                                .assessmentSettings!.allowGuestStudent!
                                                ? AppLocalizations.of(context)!.allowed
                                            //"Allowed"
                                                : AppLocalizations.of(context)!.not_allowed,
                                            //"Not Allowed",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.answer_sheet,
                                              //"Answer Sheet",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            assessment.assessmentSettings
                                                ?.showSolvedAnswerSheetInAdvisor ==
                                                null
                                                ? AppLocalizations.of(context)!.not_viewable
                                            //"Not Viewable"
                                                : assessment.assessmentSettings!
                                                .showSolvedAnswerSheetInAdvisor!
                                                ? AppLocalizations.of(context)!.viewable
                                            //"Viewable"
                                                : AppLocalizations.of(context)!.not_viewable,
                                            //"Not Viewable",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: webWidth * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.advisor,
                                              //"Advisor",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            assessment.assessmentSettings?.showAdvisorName ==
                                                null
                                                ? AppLocalizations.of(context)!.no
                                            //"No"
                                                : assessment
                                                .assessmentSettings!.showAdvisorName!
                                                ? AppLocalizations.of(context)!.yes
                                            //"Yes"
                                                : AppLocalizations.of(context)!.no,
                                            //"No",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: webWidth * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.email_small,
                                              //"Email",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            assessment.assessmentSettings?.showAdvisorEmail ==
                                                null
                                                ? AppLocalizations.of(context)!.no
                                            //"No"
                                                : assessment
                                                .assessmentSettings!.showAdvisorEmail!
                                                ? AppLocalizations.of(context)!.yes
                                            //"Yes"
                                                : AppLocalizations.of(context)!.no,
                                            //"No",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: webWidth * 0.4,
                                            child: Text(
                                              AppLocalizations.of(context)!.in_active,
                                              //"Inactive",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    102, 102, 102, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            assessment.assessmentSettings?.notAvailable == null
                                                ? AppLocalizations.of(context)!.no
                                            //"No"
                                                : assessment.assessmentSettings!.notAvailable!
                                                ? AppLocalizations.of(context)!.yes
                                            //"Yes"
                                                : AppLocalizations.of(context)!.no,
                                            //"No",
                                            style: TextStyle(
                                              color:
                                              const Color.fromRGBO(82, 165, 160, 1),
                                              fontSize: height * 0.0175,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                      : const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  questionShirnk
                                      ? Container(
                                    height: height * 0.05,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                      color: Color.fromRGBO(82, 165, 160, 1),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: webWidth * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.qn_button,
                                            //"Questions",
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: height * 0.02,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: webWidth * 0.02),
                                            child: IconButton(
                                              onPressed: () {
                                                showQuestionDetails();
                                              },
                                              icon: const Icon(
                                                Icons.arrow_circle_up_outlined,
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                      : Container(
                                    height: height * 0.05,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                      color: Color.fromRGBO(82, 165, 160, 1),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: webWidth * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.qn_button,
                                            //"Questions",
                                            style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: height * 0.02,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: webWidth * 0.02),
                                            child: IconButton(
                                              onPressed: () {
                                                showQuestionDetails();
                                              },
                                              icon: const Icon(
                                                Icons.arrow_circle_down_outlined,
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  questionShirnk
                                      ? SizedBox(
                                    height: height * 0.4,
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: assessment.questions!.length,
                                        itemBuilder: (context, index) => QuestionWidget(
                                          height: height,
                                          question: assessment.questions![index],
                                          assessment: finalAssessment,
                                          index: index,
                                        )),
                                  )
                                      : const SizedBox(
                                    height: 0,
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      showQuestionDetails();
                                    },
                                    child: Row(
                                      children: [
                                        const Expanded(child: Divider()),
                                        Text(
                                          AppLocalizations.of(context)!.view_all_qns,
                                          //"  View All Questions  ",
                                          style: TextStyle(
                                            color: const Color.fromRGBO(28, 78, 80, 1),
                                            fontSize: height * 0.02,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        // const Icon(
                                        //   Icons.keyboard_arrow_down_sharp,
                                        //   color: Color.fromRGBO(28, 78, 80, 1),
                                        // ),
                                        const Expanded(child: Divider()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       height: height * 0.08,
                                  //       width: width * 0.28,
                                  //       decoration: const BoxDecoration(
                                  //         border: Border(
                                  //           right: BorderSide(
                                  //             width: 1,
                                  //             color: Color.fromRGBO(232, 232, 232, 1),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       child: Center(
                                  //         child: Text(
                                  //           "WEB",
                                  //           textAlign: TextAlign.center,
                                  //           style: TextStyle(
                                  //             decoration: TextDecoration.underline,
                                  //             color: const Color.fromRGBO(153, 153, 153, 1),
                                  //             fontSize: height * 0.015,
                                  //             fontFamily: "Inter",
                                  //             fontWeight: FontWeight.w400,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Expanded(
                                  //       child: SizedBox(
                                  //         height: height * 0.08,
                                  //         width: width * 0.3,
                                  //         child: Center(
                                  //           child: Text(
                                  //             "Android App",
                                  //             textAlign: TextAlign.center,
                                  //             style: TextStyle(
                                  //               decoration: TextDecoration.underline,
                                  //               color: const Color.fromRGBO(153, 153, 153, 1),
                                  //               fontSize: height * 0.015,
                                  //               fontFamily: "Inter",
                                  //               fontWeight: FontWeight.w400,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Container(
                                  //       height: height * 0.08,
                                  //       width: width * 0.28,
                                  //       decoration: const BoxDecoration(
                                  //         border: Border(
                                  //           left: BorderSide(
                                  //             width: 1,
                                  //             color: Color.fromRGBO(232, 232, 232, 1),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       child: Center(
                                  //         child: Text(
                                  //           "IOS App",
                                  //           textAlign: TextAlign.center,
                                  //           style: TextStyle(
                                  //             decoration: TextDecoration.underline,
                                  //             color: const Color.fromRGBO(153, 153, 153, 1),
                                  //             fontSize: height * 0.015,
                                  //             fontFamily: "Inter",
                                  //             fontWeight: FontWeight.w400,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: height * 0.03,
                                  // ),
                                  Center(
                                    child: SizedBox(
                                      width: webWidth * 0.888,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color.fromRGBO(255, 255, 255, 1),
                                            minimumSize: const Size(280, 48),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(39),
                                            ),
                                            side: const BorderSide(
                                              color: Color.fromRGBO(82, 165, 160, 1),
                                            )),
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/teacherAssessmentSummary',arguments: widget.assessmentType);
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
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    )),
              );
            }
          else {
            return WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  endDrawer: const EndDrawerMenuTeacher(),
                  appBar: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    toolbarHeight: height * 0.100,
                    centerTitle: true,
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.in_progress_caps,
                            //"IN PROGRESS",
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: height * 0.0225,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.assessment_caps,
                            //"ASSESSMENTS",
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
                            left: height * 0.023,
                            right: height * 0.023),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.18,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  color: Colors.white,
                                ),
                                width: width * 0.888,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(1.0),
                                            topRight: Radius.circular(1.0)),
                                        color: Color.fromRGBO(82, 165, 160, 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: width * 0.02),
                                        child: Row(
                                          children: [
                                            Text(
                                              assessment.subject!,
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontSize: height * 0.02,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "  |  ${assessment.getAssessmentModelClass}",
                                              style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontSize: height * 0.015,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: width * 0.02),
                                          child: const Icon(
                                            Icons.circle,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${assessment.topic} - ${assessment.subTopic}",
                                          style: TextStyle(
                                            color:
                                            const Color.fromRGBO(102, 102, 102, 1),
                                            fontSize: height * 0.015,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: width * 0.02),
                                          child: const Icon(
                                            Icons.circle,
                                            color: Color.fromRGBO(255, 166, 0, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          width: width * 0.44,
                                          height: height * 0.0875,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "$mark",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      28, 78, 80, 1),
                                                  fontSize: height * 0.03,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)!.marks,
                                                //"Marks",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 1),
                                                  fontSize: height * 0.015,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 50,
                                            child: VerticalDivider(
                                                color:
                                                Color.fromRGBO(204, 204, 204, 1))),
                                        SizedBox(
                                          width: width * 0.4,
                                          height: height * 0.0875,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "${finalAssessment.questions?.length}",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      28, 78, 80, 1),
                                                  fontSize: height * 0.03,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)!.qn_button,
                                                //"Questions",
                                                style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      102, 102, 102, 1),
                                                  fontSize: height * 0.015,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.025,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    AppLocalizations.of(context)!.assessment_id_caps,
                                    //"Assessment ID:",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.02,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${assessment.assessmentCode}",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(82, 165, 160, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    AppLocalizations.of(context)!.institute_test_id_small,
                                    //"Institute Test ID:",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.02,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "----------",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(82, 165, 160, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Divider(),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    AppLocalizations.of(context)!.time_permitted,
                                    //"Time Permitted:",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.02,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  assessment.assessmentDuration == null
                                      ? "00 Minutes"
                                      : "${assessment.assessmentDuration} Minutes",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(82, 165, 160, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    "${AppLocalizations.of(context)!.start_date_time} : ",
                                    //"Start Date & Time:",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.02,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                finalAssessment.assessmentStartdate == null
                                    ? Text(
                                  "DD/MM/YYYY      HH:MM AM",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(153, 153, 153, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                                    : Text(
                                  "ABC903857928",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(82, 165, 160, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    "${AppLocalizations.of(context)!.end_date_time} : ",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.02,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "DD/MM/YYYY      HH:MM AM",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(153, 153, 153, 1),
                                    fontSize: height * 0.0175,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Divider(),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            additionalDetails
                                ? Container(
                              height: height * 0.05,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                color: Color.fromRGBO(82, 165, 160, 1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.additional_details,
                                      //"Additional Details",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: height * 0.02,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: width * 0.02),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_circle_up_outlined,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        onPressed: () {
                                          showAdditionalDetails();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                                : Container(
                              height: height * 0.05,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                color: Color.fromRGBO(82, 165, 160, 1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.additional_details,
                                      //"Additional Details",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: height * 0.02,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: width * 0.02),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_circle_down_outlined,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        onPressed: () {
                                          showAdditionalDetails();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            additionalDetails
                                ? Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.category,
                                        //"Category",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${finalAssessment.assessmentType}",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.retries,
                                        // "Retries",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      finalAssessment.assessmentSettings
                                          ?.allowedNumberOfTestRetries !=
                                          null
                                          ? "${AppLocalizations.of(context)!.allowed}(${finalAssessment.assessmentSettings?.allowedNumberOfTestRetries} Times)"
                                      //"Allowed (${finalAssessment.assessmentSettings?.allowedNumberOfTestRetries} Times)"
                                          : AppLocalizations.of(context)!.not_allowed,
                                      //"Not Allowed",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.guest,
                                        // "Guest",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      assessment.assessmentSettings?.allowGuestStudent ==
                                          null
                                          ? AppLocalizations.of(context)!.not_allowed
                                      //"Not Allowed"
                                          : assessment
                                          .assessmentSettings!.allowGuestStudent!
                                          ? AppLocalizations.of(context)!.allowed
                                      //"Allowed"
                                          : AppLocalizations.of(context)!.not_allowed,
                                      //"Not Allowed",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.answer_sheet,
                                        //"Answer Sheet",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      assessment.assessmentSettings
                                          ?.showSolvedAnswerSheetInAdvisor ==
                                          null
                                          ? AppLocalizations.of(context)!.not_viewable
                                      //"Not Viewable"
                                          : assessment.assessmentSettings!
                                          .showSolvedAnswerSheetInAdvisor!
                                          ? AppLocalizations.of(context)!.viewable
                                      //"Viewable"
                                          : AppLocalizations.of(context)!.not_viewable,
                                      //"Not Viewable",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.advisor,
                                        //"Advisor",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      assessment.assessmentSettings?.showAdvisorName ==
                                          null
                                          ? AppLocalizations.of(context)!.no
                                      //"No"
                                          : assessment
                                          .assessmentSettings!.showAdvisorName!
                                          ? AppLocalizations.of(context)!.yes
                                      //"Yes"
                                          : AppLocalizations.of(context)!.no,
                                      //"No",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.email_small,
                                        //"Email",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      assessment.assessmentSettings?.showAdvisorEmail ==
                                          null
                                          ? AppLocalizations.of(context)!.no
                                      //"No"
                                          : assessment
                                          .assessmentSettings!.showAdvisorEmail!
                                          ? AppLocalizations.of(context)!.yes
                                      //"Yes"
                                          : AppLocalizations.of(context)!.no,
                                      //"No",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        AppLocalizations.of(context)!.in_active,
                                        //"Inactive",
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              102, 102, 102, 1),
                                          fontSize: height * 0.02,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      assessment.assessmentSettings?.notAvailable == null
                                          ? AppLocalizations.of(context)!.no
                                      //"No"
                                          : assessment.assessmentSettings!.notAvailable!
                                          ? AppLocalizations.of(context)!.yes
                                      //"Yes"
                                          : AppLocalizations.of(context)!.no,
                                      //"No",
                                      style: TextStyle(
                                        color:
                                        const Color.fromRGBO(82, 165, 160, 1),
                                        fontSize: height * 0.0175,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                                : const SizedBox(
                              height: 0,
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            questionShirnk
                                ? Container(
                              height: height * 0.05,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                color: Color.fromRGBO(82, 165, 160, 1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.qn_button,
                                      //"Questions",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: height * 0.02,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: width * 0.02),
                                      child: IconButton(
                                        onPressed: () {
                                          showQuestionDetails();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_circle_up_outlined,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                                : Container(
                              height: height * 0.05,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                color: Color.fromRGBO(82, 165, 160, 1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.qn_button,
                                      //"Questions",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: height * 0.02,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: width * 0.02),
                                      child: IconButton(
                                        onPressed: () {
                                          showQuestionDetails();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_circle_down_outlined,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            questionShirnk
                                ? SizedBox(
                              height: height * 0.4,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: assessment.questions!.length,
                                  itemBuilder: (context, index) => QuestionWidget(
                                    height: height,
                                    question: assessment.questions![index],
                                    assessment: finalAssessment,
                                    index: index,
                                  )),
                            )
                                : const SizedBox(
                              height: 0,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            GestureDetector(
                              onTap: (){
                                showQuestionDetails();
                              },
                              child: Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  Text(
                                    AppLocalizations.of(context)!.view_all_qns,
                                    //"  View All Questions  ",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(28, 78, 80, 1),
                                      fontSize: height * 0.02,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  // const Icon(
                                  //   Icons.keyboard_arrow_down_sharp,
                                  //   color: Color.fromRGBO(28, 78, 80, 1),
                                  // ),
                                  const Expanded(child: Divider()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       height: height * 0.08,
                            //       width: width * 0.28,
                            //       decoration: const BoxDecoration(
                            //         border: Border(
                            //           right: BorderSide(
                            //             width: 1,
                            //             color: Color.fromRGBO(232, 232, 232, 1),
                            //           ),
                            //         ),
                            //       ),
                            //       child: Center(
                            //         child: Text(
                            //           "WEB",
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //             decoration: TextDecoration.underline,
                            //             color: const Color.fromRGBO(153, 153, 153, 1),
                            //             fontSize: height * 0.015,
                            //             fontFamily: "Inter",
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: SizedBox(
                            //         height: height * 0.08,
                            //         width: width * 0.3,
                            //         child: Center(
                            //           child: Text(
                            //             "Android App",
                            //             textAlign: TextAlign.center,
                            //             style: TextStyle(
                            //               decoration: TextDecoration.underline,
                            //               color: const Color.fromRGBO(153, 153, 153, 1),
                            //               fontSize: height * 0.015,
                            //               fontFamily: "Inter",
                            //               fontWeight: FontWeight.w400,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       height: height * 0.08,
                            //       width: width * 0.28,
                            //       decoration: const BoxDecoration(
                            //         border: Border(
                            //           left: BorderSide(
                            //             width: 1,
                            //             color: Color.fromRGBO(232, 232, 232, 1),
                            //           ),
                            //         ),
                            //       ),
                            //       child: Center(
                            //         child: Text(
                            //           "IOS App",
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //             decoration: TextDecoration.underline,
                            //             color: const Color.fromRGBO(153, 153, 153, 1),
                            //             fontSize: height * 0.015,
                            //             fontFamily: "Inter",
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: height * 0.03,
                            // ),
                            Center(
                              child: SizedBox(
                                width: width * 0.888,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      const Color.fromRGBO(255, 255, 255, 1),
                                      minimumSize: const Size(280, 48),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(39),
                                      ),
                                      side: const BorderSide(
                                        color: Color.fromRGBO(82, 165, 160, 1),
                                      )),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/teacherAssessmentSummary',arguments: widget.assessmentType);
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
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                          ],
                        )),
                  ),
                ));
          }

        },);

  }
}

class QuestionWidget extends StatefulWidget {
  QuestionWidget(
      {Key? key,
        required this.height,
        required this.question,
        required this.assessment,
        required this.index})
      : super(key: key);

  final double height;
  questions.Question question;
  CreateAssessmentModel assessment;
  int index;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String ans = '';
  CreateAssessmentModel assessment = CreateAssessmentModel(questions: []);

  @override
  void initState() {
    assessment = widget.assessment;
    for (int i = 0; i < widget.question.choices!.length; i++) {
      if (widget.question.choices![i].rightChoice!) {
        ans = '${widget.question.choices![i].choiceText} $ans';
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromRGBO(82, 165, 160, 0.08),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.height * 0.01,
              ),
              Text(
                widget.question.questionType!,
                style: TextStyle(
                  color: const Color.fromRGBO(28, 78, 80, 1),
                  fontSize: widget.height * 0.015,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: widget.height * 0.01,
              ),
              Text(
                widget.question.question!,
                style: TextStyle(
                  color: const Color.fromRGBO(51, 51, 51, 1),
                  fontSize: widget.height * 0.015,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: widget.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ans,
                    style: TextStyle(
                      color: const Color.fromRGBO(82, 165, 160, 1),
                      fontSize: widget.height * 0.015,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.marks_small,
                        // "Marks: ",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: widget.height * 0.015,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${assessment.questions![widget.index].questionMarks}",
                        style: TextStyle(
                          color: const Color.fromRGBO(82, 165, 160, 1),
                          fontSize: widget.height * 0.015,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
