
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:qna_test/Components/custom_incorrect_popup.dart';
import 'Student_Quest_ReviseAns.dart';
import 'hamBurger_menu.dart';
import 'reset_passwordStudent.dart';
import 'stud_mem_question01.dart';




class StudentMemLogedStart extends StatefulWidget {
  const StudentMemLogedStart({
    Key? key
    //,
   // required this.regNumber
  }) : super(key: key);
  //final String regNumber;

  @override
  StudentMemLogedStartState createState() => StudentMemLogedStartState();
}
class StudentMemLogedStartState extends State<StudentMemLogedStart> {
  TextEditingController assessmentID = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double localWidth = MediaQuery.of(context).size.width;
    double localHeight = MediaQuery.of(context).size.height;
    Color textColor = const Color.fromRGBO(48, 145, 139, 1);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: const Color.fromRGBO(0,106,100,1),
        ),
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
                    const SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      height: localHeight / 6,
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
                              "Student Name",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
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
                            padding: EdgeInsets.only(left: localWidth * 0.09),
                            child: Text(
                                AppLocalizations.of(context)!.student,
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
                            padding: EdgeInsets.only(left: localWidth * 0.09),
                            child: const Text(
                              "Student@gmail.com",
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
                child: ListView(
                  children: [
                    ListTile(
                        leading:
                        const Icon(
                            Icons.people_alt,
                            color: Color.fromRGBO(141, 167, 167, 1)),
                        title: Text(AppLocalizations.of(context)!.user_profile,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
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
                              child: ResetPasswordStudent(),
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
                        }),
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
                        }),
                    const Divider(
                      thickness: 2,
                    ),
                    ListTile(
                        leading:
                        const Icon(
                            Icons.note_alt_outlined,
                            color: Color.fromRGBO(141, 167, 167, 1)),
                        title: Text(AppLocalizations.of(context)!.cookie_policy,style: TextStyle(
                            color: textColor,
                            //Color.fromRGBO(48, 145, 139, 1),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.02,
                            fontSize: 16),),
                        trailing:  const Icon(Icons.navigate_next,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        onTap: () async {
                        }),
                    ListTile(
                        leading:
                        const Icon(
                            Icons.perm_contact_calendar_outlined,
                            color: Color.fromRGBO(141, 167, 167, 1)),
                        title: Text(AppLocalizations.of(context)!.about_us,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
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
                        }),
                    const Divider(
                      thickness: 2,
                    ),
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
                        onTap: () async {
                        }),
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
                  ],
                ),
              ),
            ],
          ),
        ),
        body:
        SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child:
            Column(
                children: [
                  Container(
                    //height: localHeight * 0.43,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(0, 106, 100, 1),
                          Color.fromRGBO(82, 165, 160, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              localWidth,
                              localHeight * 0.35)
                      ),
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children : [
                        const SizedBox(height:50.0),
                        Align(
                          alignment: Alignment.topCenter,
                          child:
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            height: localHeight * 0.20,
                            width: localWidth * 0.30,
                            child: Image.asset("assets/images/question_mark_logo.png"),
                          ),
                        ),
                        const SizedBox(height: 25.0),

                      ],
                    ),
                  ),
                  Container(
                    width: 149,
                    margin: const EdgeInsets.all(15),
                    child: Column(
                        children: [
                           Align(alignment: Alignment.center,
                            child:
                            Text(AppLocalizations.of(context)!.welcome,
                              style: const TextStyle(
                                  color: Color.fromRGBO(28, 78, 80, 1),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.02,
                                  fontSize: 24),),
                          ),
                          SizedBox(
                            height: localHeight * 0.02,
                          ),
                          Text("StudentName",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.merge(const TextStyle(
                                color: Color.fromRGBO(28, 78, 80, 1),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.02,
                                fontSize: 24)),),
                          SizedBox(
                            height: localHeight * 0.03,
                          ),
                        ]),

                  ),
                  Container(
                    //margin: const EdgeInsets.only(left: 10,right: 50),
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Align(
                            alignment: Alignment.topLeft,
                            child:
                            Text(AppLocalizations.of(context)!.enter_assId,
                              style: const TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),),

                          ),
                          SizedBox(
                            height: localHeight * 0.02,
                          ),
                          Column(
                            children:  [
                              Align(alignment: Alignment.center,
                                child: Form(
                                    key: formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: TextFormField(
                                        validator: (value){
                                          return value!.length < 8 ? AppLocalizations.of(context)!.valid_assId : null;
                                        },
                                        controller: assessmentID,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                                        ],
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          helperStyle: const TextStyle(color: Color.fromRGBO(102, 102, 102, 0.3),fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: 16),
                                          hintText: AppLocalizations.of(context)!.assessment_id,
                                          prefixIcon: const Icon(
                                              Icons.event_note_outlined,color: Color.fromRGBO(82, 165, 160, 1)),
                                        )
                                    )
                                ),
                              )],
                          ),
                        ]),

                  ),
                  SizedBox(
                    height: localHeight * 0.08,
                  ),
                  Column(
                    children: [
                      Align(alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(82, 165, 160, 1),
                              minimumSize: const Size(280, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(39),
                              ),
                            ),
                            //shape: StadiumBorder(),
                            child: Text(AppLocalizations.of(context)!.start,
                                style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                          onPressed: () {
                            bool valid=formKey.currentState!.validate();
                            if(assessmentID.text.length >= 8){
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: StudMemQuestion(assessmentId: assessmentID.text),
                                ),
                              );
                            }
                            else {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: CustomDialog(title: AppLocalizations.of(context)!.invalid_assessment_iD, content: '', button: AppLocalizations.of(context)!.retry,),
                                ),
                              );
                            }

                          },
                            // onPressed: () async {
                            //   if (formKey.currentState!.validate()) {
                            //     Navigator.push(
                            //       context,
                            //       PageTransition(
                            //         type: PageTransitionType.rightToLeft,
                            //         child: const StudReviseQuest(),
                            //       ),
                            //     );
                            //   }
                            //   else {
                            //     setState(() {
                            //       autoValidate = true;
                            //     });
                            //   }
                            // }
                            ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: localHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(141, 167, 167, 1),
                        ),
                        onPressed: () {},
                      ),
                       Text(AppLocalizations.of(context)!.search_library,
                          style: const TextStyle(
                              color: Color.fromRGBO(48, 145, 139, 1),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: localHeight * 0.03,
                  ),
                ])));

  }
}