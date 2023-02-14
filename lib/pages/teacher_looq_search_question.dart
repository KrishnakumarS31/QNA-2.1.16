import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qna_test/Pages/teacher_looq_clone_preview.dart';
import '../Entity/demo_question_model.dart';
import 'about_us.dart';
import 'cookie_policy.dart';
import 'help_page.dart';
import 'settings_languages.dart';
import 'package:qna_test/Pages/privacy_policy_hamburger.dart';
import 'package:qna_test/Pages/terms_of_services.dart';
import 'package:qna_test/pages/reset_password_teacher.dart';

class TeacherLooqQuestionBank extends StatefulWidget {
  const TeacherLooqQuestionBank({
    Key? key, required this.setLocale,



  }) : super(key: key);
  final void Function(Locale locale) setLocale;


  @override
  TeacherLooqQuestionBankState createState() => TeacherLooqQuestionBankState();
}

class TeacherLooqQuestionBankState extends State<TeacherLooqQuestionBank> {
  bool agree = false;
  List<DemoQuestionModel> quesList =getData();
  Color textColor = const Color.fromRGBO(48, 145, 139, 1);
  static List<DemoQuestionModel> getData() {
    const data=[
      {
        "id":1,
        "questionType":"MCQ",
        "subject":"Maths",
        "topic":"ADD",
        "subTopic":"Add",
        "studentClass":"2",
        "question":"2 + 2",
        "choices":["1","2","4","0"],
        "correctChoice":[3],
        "advice":"agraefweg",
        "url":"waffar"
      },
      {
        "id":2,
        "questionType":"MCQ",
        "subject":"Maths",
        "topic":"ADD",
        "subTopic":"Add",
        "studentClass":"2",
        "question":"2 + 2",
        "choices":["1","2","4","0"],
        "correctChoice":[3],
        "advice":"agraefweg",
        "url":"waffar"
      },
      {
        "id":3,
        "questionType":"MCQ",
        "subject":"Maths",
        "topic":"ADD",
        "subTopic":"Add",
        "studentClass":"2",
        "question":"2 + 2",
        "choices":["1","2","4","0"],
        "correctChoice":[3],
        "advice":"agraefweg",
        "url":"waffar"
      },
      {
        "id":4,
        "questionType":"MCQ",
        "subject":"Maths",
        "topic":"ADD",
        "subTopic":"Add",
        "studentClass":"2",
        "question":"2 + 2",
        "choices":["1","2","4","0"],
        "correctChoice":[3],
        "advice":"agraefweg",
        "url":"waffar"
      },
      {
        "id":5,
        "questionType":"MCQ",
        "subject":"Maths",
        "topic":"ADD",
        "subTopic":"Add",
        "studentClass":"2",
        "question":"2 - 2",
        "choices":["1","2","4","0"],
        "correctChoice":[4],
        "advice":"agraefweg",
        "url":"waffar"
      }

    ];
    return data.map<DemoQuestionModel>(DemoQuestionModel.fromJson).toList();
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
    TextEditingController teacherQuestionBankSearchController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
        automaticallyImplyLeading: false,
        

        toolbarHeight: height * 0.100,
        centerTitle: true,
        title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "LOOQ",
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: height * 0.0225,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "SEARCH QUESTIONS",
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
                //SizedBox(height: height * 0.005),
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
                                color: const Color.fromRGBO(255, 255, 255, 1), onPressed: () {  }, icon: const Icon(Icons.search),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tap to Review/Edit/Delete",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: const Color.fromRGBO(153, 153, 153, 1),
                        fontSize: height * 0.015,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),),
                    Row(
                      children: [
                        Text("My Questions",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: height * 0.015,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),),
                        SizedBox(width: width * 0.02,),
                        const Icon(Icons.circle_rounded,color: Color.fromRGBO(82, 165, 160, 1),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                for ( DemoQuestionModel i in quesList )
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child:  TeacherLooqClonePreview(question: i,setLocale: widget.setLocale),
                        ),
                      );
                    },
                      child: QuestionPreview(height: height, width: width,question: i,)),
                Align(
                  alignment: Alignment.center,
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
                     Navigator.of(context).pop();
                    },
                    child: Text(
                      'Back to Questions',
                      style: TextStyle(
                          fontSize: height * 0.025,
                          fontFamily: "Inter",
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],

            )
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
    return Column(
      children: [
        Container(
          height: height * 0.04,
          width: width * 0.9,
          color: const Color.fromRGBO(82, 165, 160, 1),
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
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "  |  ${question.topic} - ${question.subTopic}",
                      style: TextStyle(
                          fontSize: height * 0.015,
                          fontFamily: "Inter",
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),

                Text(
                  question.studentClass,
                  style: TextStyle(
                      fontSize: height * 0.015,
                      fontFamily: "Inter",
                      color: const Color.fromRGBO(255, 255, 255, 1),
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
            question.questionType,
            style: TextStyle(
                fontSize: height * 0.015,
                fontFamily: "Inter",
                color: const Color.fromRGBO(28, 78, 80, 1),
                fontWeight: FontWeight.w600),
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
                color: const Color.fromRGBO(51, 51, 51, 1),
                fontWeight: FontWeight.w400),
          ),
        ),


        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       answer,
        //       style: TextStyle(
        //           fontSize: height * 0.02,
        //           fontFamily: "Inter",
        //           color: Color.fromRGBO(82, 165, 160, 1),
        //           fontWeight: FontWeight.w600),
        //     ),
        //     Text(
        //       question.questionType,
        //       style: TextStyle(
        //           fontSize: height * 0.02,
        //           fontFamily: "Inter",
        //           color: Color.fromRGBO(82, 165, 160, 1),
        //           fontWeight: FontWeight.w600),
        //     ),
        //   ],
        // ),
        SizedBox(height: height * 0.01,),
        const Divider()

      ],
    );
  }
}