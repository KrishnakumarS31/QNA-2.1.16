import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:qna_test/Components/custom_incorrect_popup.dart';
import 'package:qna_test/Pages/settings_languages.dart';
import 'package:qna_test/pages/student_assessment_questions.dart';
import 'package:qna_test/pages/student_user_profile.dart';
import '../Entity/question_paper_model.dart';
import '../EntityModel/user_data_model.dart';
import '../Services/qna_service.dart';
import 'about_us.dart';
import 'change_email_student.dart';
import 'cookie_policy.dart';
import 'help_page.dart';
import 'privacy_policy_hamburger.dart';
import 'reset_password_student.dart';
import 'terms_of_services.dart';




class StudentMemLogedStart extends StatefulWidget {
  StudentMemLogedStart({
    Key? key,required this.regNumber, required this.setLocale,this.userId
  }) : super(key: key);
  final void Function(Locale locale) setLocale;
  final String? regNumber;
  int? userId;

  @override
  StudentMemLogedStartState createState() => StudentMemLogedStartState();
}
class StudentMemLogedStartState extends State<StudentMemLogedStart> {
  TextEditingController assessmentID = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  late QuestionPaperModel values;
  UserDataModel userDataModel=UserDataModel(code: 0, message: '');
  String name='';
  String email = "";
  String assessmentId = "";


  @override
  void initState() {
    super.initState();
    getData();

  }

  getData() async {
      userDataModel=await QnaService.getUserDataService(widget.userId);
      setState((){
        name=userDataModel.data!.firstName;
        email = userDataModel.data!.email;
      });
  }
  @override
  Widget build(BuildContext context) {
    double localWidth = MediaQuery.of(context).size.width;
    double localHeight = MediaQuery.of(context).size.height;
    Color textColor = const Color.fromRGBO(48, 145, 139, 1);
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          backgroundColor: Colors.transparent,
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
                              name,
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
                            child:  Text(
                              "${userDataModel.data?.email}",
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
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: StudentUserProfile(userDataModel: userDataModel,),
                            ),
                          );
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
                              child:  ResetPasswordStudent(userId: userDataModel.data!.id,),
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
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child:  ChangeEmailStudent(userId: userDataModel.data!.id),
                              ),
                            );
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
                    SizedBox(height: localHeight * 0.03),
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
                    SizedBox(height: localHeight * 0.03),
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
                          Text(name,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyLarge
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
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                    AppLocalizations.of(context)!.enter_assId,
                                    style: TextStyle(
                                        color:
                                        const Color.fromRGBO(102, 102, 102, 1),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: localHeight * 0.017),
                                  ),
                                  TextSpan(
                                      text: "\t*",
                                      style: TextStyle(
                                          color:
                                          const Color.fromRGBO(219, 35, 35, 1),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: localHeight * 0.017)),
                                ])),
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
                                        onChanged: (val)
                                        {
                                          formKey.currentState!.validate();
                                        },
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
                          onPressed: () async {
    if (formKey.currentState!.validate()) {
      assessmentId = assessmentID.text;
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(
                      48, 145, 139, 1),
                ));
          });
      values = await QnaService.getQuestion(assessmentId: assessmentID.text);
      if (values.code == 200) {
        if (assessmentID.text.length >= 8) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: StudQuestion(
                  assessmentId: assessmentID.text,
                  ques: values,
                  userName: userDataModel.data!.firstName),
            ),
          );
        }
      }
      else {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: CustomDialog(
              title: AppLocalizations.of(context)!.invalid_assessment_iD,
              content: '',
              button: AppLocalizations.of(context)!.retry,),
          ),
        );
      }
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