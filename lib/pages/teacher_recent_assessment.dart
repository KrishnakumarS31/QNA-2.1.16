import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:qna_test/Pages/privacy_policy_hamburger.dart';
import 'package:qna_test/Pages/terms_of_services.dart';
import 'package:qna_test/pages/reset_password_teacher.dart';
import 'package:qna_test/pages/teacher_assessment_summary.dart';
import 'about_us.dart';
import 'cookie_policy.dart';
import 'help_page.dart';
import 'settings_languages.dart';
import '../Entity/demo_question_model.dart';
import '../Providers/question_prepare_provider.dart';
import 'teacher_prepare_qnBank.dart';


class TeacherRecentAssessment extends StatefulWidget {
  const TeacherRecentAssessment({
    Key? key, required this.setLocale,

  }) : super(key: key);
  final void Function(Locale locale) setLocale;


  @override
  TeacherRecentAssessmentState createState() => TeacherRecentAssessmentState();
}

class TeacherRecentAssessmentState extends State<TeacherRecentAssessment> {
  bool additionalDetails = true;

  showAdditionalDetails(){
    setState(() {
      !additionalDetails;
    });
  }


  @override
  void initState() {
    super.initState();
    //quesList = Provider.of<QuestionPrepareProvider>(context, listen: false).getAllQuestion;
  }



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color textColor = const Color.fromRGBO(48, 145, 139, 1);
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient:  LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(0, 106, 100, 1),
                    Color.fromRGBO(82, 165, 160, 1),
                  ],
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.050),
                Container(
                  alignment: Alignment.center,
                  height: height / 6,
                  child:
                  Row(
                      children:  [
                        CircleAvatar(
                          backgroundColor: const Color.fromRGBO(0,106,100,0),
                          radius: MediaQuery
                              .of(context)
                              .size
                              .width * 0.15,
                          child: Image.asset(
                            "assets/images/ProfilePic_Avatar.png",
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          "Teacher Name",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyLarge
                              ?.merge(const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.02,
                              fontSize: 16)),
                        ),
                      ]),
                ),
                const SizedBox(height: 0.022),
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: width * 0.09),
                        child: Text(
                          AppLocalizations.of(context)!.teacher,
                          style: const TextStyle(
                              color: Color.fromRGBO(221, 221, 221, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.02,
                              fontSize: 12),
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: width * 0.09),
                        child: const Text(
                          "teacher@gmail.com",
                          style: TextStyle(
                              color: Color.fromRGBO(221, 221, 221, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.02,
                              fontSize: 12),
                        )
                    ),
                  ],
                ),
                //    )
              ],
            ),
          ),
          Flexible(
            child:
            ListView(
              children: [
                ListTile(
                    leading:
                    const Icon(
                        Icons.people_alt,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.user_profile,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyLarge
                          ?.merge(TextStyle(
                          color: textColor,
                          //Color.fromRGBO(48, 145, 139, 1),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.02,
                          fontSize: 16)),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.rightToLeft,
                      //     child: TeacherUserProfile(userDataModel: userDataModel,),
                      //   ),
                      // );
                    }),
                ListTile(
                    leading:
                    const Icon(
                        Icons.key_outlined,
                        color: Color.fromRGBO(141, 167, 167, 1)
                    ),
                    title: Text(AppLocalizations.of(context)!.change_password,
                      style: TextStyle(
                          color: textColor,
                          //Color.fromRGBO(48, 145, 139, 1),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.02,
                          fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const ResetPassword(),
                        ),
                      );
                    }),
                ListTile(
                    leading:
                    const Icon(
                        Icons.mail_outline_sharp,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.change_emailId,
                      style: TextStyle(
                          color: textColor,
                          //Color.fromRGBO(48, 145, 139, 1),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.02,
                          fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.rightToLeft,
                      //     child:  ChangeEmailTeacher(userId: userDataModel.data!.id),
                      //   ),
                      // );
                    }),
                const Divider(
                  thickness: 2,
                ),
                ListTile(
                    leading:
                    const Icon(
                        Icons.translate,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.language,style: TextStyle(
                        color: textColor,
                        //Color.fromRGBO(48, 145, 139, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SettingsLanguages(setLocale: widget.setLocale),
                        ),
                      );
                    }),
                const Divider(
                  thickness: 2,
                ),
                ListTile(
                    leading:
                    const Icon(
                        Icons.verified_user_outlined,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.privacy_and_terms,style: TextStyle(
                        color: textColor,
                        //Color.fromRGBO(48, 145, 139, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PrivacyPolicyHamburger(setLocale: widget.setLocale),
                        ),
                      );
                    }),
                ListTile(
                    leading:
                    const Icon(
                        Icons.verified_user_outlined,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text('Terms of Services',style: TextStyle(
                        color: textColor,
                        //Color.fromRGBO(48, 145, 139, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: TermsOfServiceHamburger(setLocale: widget.setLocale),
                        ),
                      );
                    }),
                ListTile(
                    leading:
                    const Icon(
                        Icons.note_alt_outlined,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.cookie_policy,style: TextStyle(
                        color: textColor,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: CookiePolicy(setLocale: widget.setLocale),
                        ),
                      );
                    }),
                const Divider(
                  thickness: 2,
                ),
                ListTile(
                    leading:
                    const Icon(
                        Icons.perm_contact_calendar_outlined,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.about_us,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyLarge
                          ?.merge(TextStyle(
                          color: textColor,
                          //Color.fromRGBO(48, 145, 139, 1),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.02,
                          fontSize: 16)),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: AboutUs(setLocale: widget.setLocale),
                        ),
                      );
                    }),
                ListTile(
                    leading:
                    const Icon(
                        Icons.help_outline,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.help,style: TextStyle(
                        color: textColor,
                        //Color.fromRGBO(48, 145, 139, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),),
                    trailing:  const Icon(Icons.navigate_next,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: HelpPageHamburger(setLocale: widget.setLocale),
                        ),
                      );
                    }),
                const Divider(
                  thickness: 2,
                ),
                ListTile(
                    leading:
                    const Icon(
                        Icons.power_settings_new,
                        color: Color.fromRGBO(141, 167, 167, 1)),
                    title: Text(AppLocalizations.of(context)!.logout,style: const TextStyle(
                        color: Color.fromRGBO(226, 68, 0, 1),
                        //Color.fromRGBO(48, 145, 139, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),),
                    onTap: () async {
                    }),
                SizedBox(height: height * 0.03),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Version : 1.0.0",
                    style: TextStyle(
                        color: Color.fromRGBO(180, 180, 180, 1),
                        //Color.fromRGBO(48, 145, 139, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.02,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ],
      ),
    ),

      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
                "IN PROGRESS",
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: height * 0.0225,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "ASSESSMENTS",
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
                SizedBox(height: height*0.01,),
                Center(
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      color: Colors.white,
                    ),
                    height: height * 0.1675,
                    width: width * 0.888,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          height: height * 0.037,
                          decoration:  const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                            color: Color.fromRGBO(82, 165, 160, 1),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: width * 0.02),
                            child: Row(
                              children: [
                                Text("Maths",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: height * 0.02,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),),
                                Text("  |  Class IX",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: height * 0.015,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(right: width * 0.02),
                              child: Icon(Icons.circle,color: Colors.white,),
                            ),
                            Text("Calculus - Chapter 12.2/13",
                              style: TextStyle(
                                color: const Color.fromRGBO(102, 102, 102, 1),
                                fontSize: height * 0.015,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              ),),
                            Padding(
                              padding:  EdgeInsets.only(right: width * 0.02),
                              child: Icon(Icons.circle,color: const Color.fromRGBO(255, 166, 0, 1),),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration:  const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Color.fromRGBO(204, 204, 204, 1),
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              width: width * 0.44,
                              height: height * 0.0875,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("50",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(28, 78, 80, 1),
                                      fontSize: height * 0.03,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  Text("Marks",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.015,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w400,
                                    ),),
                                ],
                              ),

                            ),
                            Container(
                              width: width * 0.44,
                              height: height * 0.0875,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("50",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(28, 78, 80, 1),
                                      fontSize: height * 0.03,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  Text("Questions",
                                    style: TextStyle(
                                      color: const Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: height * 0.015,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w400,
                                    ),),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.025,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Assessment ID:",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("------------------",
                      style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Institute Test ID:",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("ABC903857928",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Divider(),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Time Permitted:",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("00 Minutes",
                      style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Start Date & Time:",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("DD/MM/YYYY      HH:MM AM",
                      style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("End Date & Time:",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("DD/MM/YYYY      HH:MM AM",
                      style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Divider(),
                SizedBox(height: height*0.01,),
                additionalDetails?
                Container(
                  height: height * 0.05,
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                    color: Color.fromRGBO(82, 165, 160, 1),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Additional Details",
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: height * 0.02,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),),
                        Padding(
                          padding:  EdgeInsets.only(right: width * 0.02),
                          child: IconButton(icon: Icon(Icons.arrow_circle_up_outlined,color: const Color.fromRGBO(255, 255, 255, 1),), onPressed: () { showAdditionalDetails(); },),
                        )
                      ],
                    ),
                  ),
                ):
                Container(
                  height: height * 0.05,
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                    color: Color.fromRGBO(82, 165, 160, 1),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Additional Details",
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: height * 0.02,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),),
                        Padding(
                          padding:  EdgeInsets.only(right: width * 0.02),
                          child: IconButton(icon: Icon(Icons.arrow_circle_down_outlined,color: const Color.fromRGBO(255, 255, 255, 1),), onPressed: () { showAdditionalDetails(); },),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Category",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("Test/Practice",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Retries",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("Allowed (3 Times)",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Guest",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("Allowed",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Answer Sheet",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("Viewable",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Advisor",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("Subash",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Email",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("No",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Text("Inactive",
                        style: TextStyle(
                          color: const Color.fromRGBO(102, 102, 102, 1),
                          fontSize: height * 0.02,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),),
                    ),
                    Text("No",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.0175,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                  ],
                ),
                SizedBox(height: height*0.03,),
                Container(
                  height: height * 0.05,
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                    color: Color.fromRGBO(82, 165, 160, 1),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Questions",
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: height * 0.02,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          ),),
                        Padding(
                          padding:  EdgeInsets.only(right: width * 0.02),
                          child: Icon(Icons.arrow_circle_up_outlined,color: const Color.fromRGBO(255, 255, 255, 1),),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.01,),

                QuestionWidget(height: height),
                QuestionWidget(height: height),
                QuestionWidget(height: height),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text("  View All Questions  ",
                      style: TextStyle(
                        color: const Color.fromRGBO(28, 78, 80, 1),
                        fontSize: height * 0.02,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),),
                    const Icon(Icons.keyboard_arrow_down_sharp,color: Color.fromRGBO(28, 78, 80, 1),),
                    const Expanded(child: Divider()),

                  ],
                ),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    Container(
                      height: height * 0.08,
                      width: width * 0.28,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 1, color: Color.fromRGBO(232, 232, 232, 1),),
                        ),
                      ),
                      child: Center(
                        child: Text("WEB",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: const Color.fromRGBO(153, 153, 153, 1),
                            fontSize: height * 0.015,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.3,
                        child: Center(
                          child: Text("Android App",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: const Color.fromRGBO(153, 153, 153, 1),
                              fontSize: height * 0.015,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.08,
                      width: width * 0.28,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 1, color: Color.fromRGBO(232, 232, 232, 1),),
                        ),
                      ),
                      child: Center(
                        child: Text("IOS App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: const Color.fromRGBO(153, 153, 153, 1),
                            fontSize: height * 0.015,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),),
                      ),
                    )
                  ],
                ),



                SizedBox(height: height*0.03,),
                Center(
                  child: Container(
                    width: width * 0.888,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                          minimumSize: const Size(280, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(39),
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(82, 165, 160, 1),
                          )
                      ),
                      //shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: TeacherAssessmentSummary(setLocale: widget.setLocale),
                          ),
                        );
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: height * 0.025,
                            fontFamily: "Inter",
                            color: Color.fromRGBO(82, 165, 160, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
              ],

            )
        ),
      ),
    );
  }

}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height*0.01,),
          Text("MCQ",
            style: TextStyle(
              color: const Color.fromRGBO(28, 78, 80, 1),
              fontSize: height * 0.015,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),),
          SizedBox(height: height*0.01,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et nulla cursus, dictum risus sit amet, semper massa. Sed sit. Phasellus viverra, odio dignissim",
            style: TextStyle(
              color: const Color.fromRGBO(51, 51, 51, 1),
              fontSize: height * 0.015,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
            ),),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("C. Lorem ipsum dolor sit amet",
                style: TextStyle(
                  color: const Color.fromRGBO(82, 165, 160, 1),
                  fontSize: height * 0.015,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),),
              Row(
                children: [
                  Text("Marks: ",
                    style: TextStyle(
                      color: const Color.fromRGBO(102, 102, 102, 1),
                      fontSize: height * 0.015,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),),
                  Text("5",
                    style: TextStyle(
                      color: const Color.fromRGBO(82, 165, 160, 1),
                      fontSize: height * 0.015,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),

            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

