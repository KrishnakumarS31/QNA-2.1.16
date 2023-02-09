import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qna_test/pages/student_looq_selected_assessment.dart';


class StudentLooqLanding extends StatefulWidget {
  const StudentLooqLanding({
    Key? key

  }) : super(key: key);



  @override
  StudentLooqLandingState createState() => StudentLooqLandingState();
}

class StudentLooqLandingState extends State<StudentLooqLanding> {
  bool agree = false;
  TextEditingController SearchController=TextEditingController();


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                "PRACTICE",
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
      // endDrawer: Drawer(
      //   child: Column(
      //     children: [
      //       Container(
      //         decoration: const BoxDecoration(
      //             gradient:  LinearGradient(
      //               begin: Alignment.topLeft,
      //               end: Alignment.bottomRight,
      //               colors: [
      //                 Color.fromRGBO(0, 106, 100, 1),
      //                 Color.fromRGBO(82, 165, 160, 1),
      //               ],
      //             )
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const SizedBox(height: 50),
      //             Container(
      //               alignment: Alignment.center,
      //               height: height / 6,
      //               child:
      //               Row(
      //                   children:  [
      //                     CircleAvatar(
      //                       backgroundColor: const Color.fromRGBO(0,106,100,0),
      //                       radius: MediaQuery
      //                           .of(context)
      //                           .size
      //                           .width * 0.15,
      //                       child: Image.asset(
      //                         "assets/images/ProfilePic_Avatar.png",
      //                       ),
      //                     ),
      //                     const SizedBox(height: 2.0),
      //                     Text(
      //                       name,
      //                       style: Theme.of(context)
      //                           .primaryTextTheme
      //                           .bodyLarge
      //                           ?.merge(const TextStyle(
      //                           color: Color.fromRGBO(255, 255, 255, 1),
      //                           fontFamily: 'Inter',
      //                           fontWeight: FontWeight.w600,
      //                           letterSpacing: -0.02,
      //                           fontSize: 16)),
      //                     ),
      //                   ]),
      //             ),
      //             const SizedBox(height: 0.022),
      //             Column(
      //               children: [
      //                 Container(
      //                     padding: EdgeInsets.only(left: localWidth * 0.09),
      //                     child: Text(
      //                       AppLocalizations.of(context)!.student,
      //                       style: const TextStyle(
      //                           color: Color.fromRGBO(221, 221, 221, 1),
      //                           fontFamily: 'Inter',
      //                           fontWeight: FontWeight.w500,
      //                           letterSpacing: -0.02,
      //                           fontSize: 12),
      //                     )
      //                 ),
      //               ],
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Container(
      //                     padding: EdgeInsets.only(left: localWidth * 0.09),
      //                     child:  Text(
      //                       "${userDataModel.data?.email}",
      //                       style: TextStyle(
      //                           color: Color.fromRGBO(221, 221, 221, 1),
      //                           fontFamily: 'Inter',
      //                           fontWeight: FontWeight.w500,
      //                           letterSpacing: -0.02,
      //                           fontSize: 12),
      //                     )
      //                 ),
      //               ],
      //             ),
      //             //    )
      //           ],
      //         ),
      //       ),
      //       Flexible(
      //         child:
      //         ListView(
      //           children: [
      //             ListTile(
      //                 leading:
      //                 Icon(
      //                     Icons.people_alt,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.user_profile,
      //                   style: Theme.of(context)
      //                       .primaryTextTheme
      //                       .bodyLarge
      //                       ?.merge(TextStyle(
      //                       color: textColor,
      //                       //Color.fromRGBO(48, 145, 139, 1),
      //                       fontFamily: 'Inter',
      //                       fontWeight: FontWeight.w500,
      //                       letterSpacing: -0.02,
      //                       fontSize: 16)),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: StudentUserProfile(userDataModel: userDataModel,),
      //                     ),
      //                   );
      //                 }),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.key_outlined,
      //                     color: Color.fromRGBO(141, 167, 167, 1)
      //                 ),
      //                 title: Text(AppLocalizations.of(context)!.change_password,
      //                   style: TextStyle(
      //                       color: textColor,
      //                       //Color.fromRGBO(48, 145, 139, 1),
      //                       fontFamily: 'Inter',
      //                       fontWeight: FontWeight.w500,
      //                       letterSpacing: -0.02,
      //                       fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child:  ResetPasswordStudent(userId: userDataModel.data!.id,),
      //                     ),
      //                   );
      //                 }),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.mail_outline_sharp,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.change_emailId,
      //                   style: TextStyle(
      //                       color: textColor,
      //                       //Color.fromRGBO(48, 145, 139, 1),
      //                       fontFamily: 'Inter',
      //                       fontWeight: FontWeight.w500,
      //                       letterSpacing: -0.02,
      //                       fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child:  ChangeEmailStudent(userId: userDataModel.data!.id),
      //                     ),
      //                   );
      //                 }),
      //             const Divider(
      //               thickness: 2,
      //             ),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.translate,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.language,style: TextStyle(
      //                     color: textColor,
      //                     //Color.fromRGBO(48, 145, 139, 1),
      //                     fontFamily: 'Inter',
      //                     fontWeight: FontWeight.w500,
      //                     letterSpacing: -0.02,
      //                     fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () async {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: SettingsLanguages(setLocale: widget.setLocale),
      //                     ),
      //                   );
      //                 }),
      //             const Divider(
      //               thickness: 2,
      //             ),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.verified_user_outlined,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.privacy_and_terms,style: TextStyle(
      //                     color: textColor,
      //                     //Color.fromRGBO(48, 145, 139, 1),
      //                     fontFamily: 'Inter',
      //                     fontWeight: FontWeight.w500,
      //                     letterSpacing: -0.02,
      //                     fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () async {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: PrivacyPolicyHamburger(setLocale: widget.setLocale),
      //                     ),
      //                   );
      //                 }),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.verified_user_outlined,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text('Terms of Services',style: TextStyle(
      //                     color: textColor,
      //                     //Color.fromRGBO(48, 145, 139, 1),
      //                     fontFamily: 'Inter',
      //                     fontWeight: FontWeight.w500,
      //                     letterSpacing: -0.02,
      //                     fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () async {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: TermsOfServiceHamburger(setLocale: widget.setLocale),
      //                     ),
      //                   );
      //                 }),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.note_alt_outlined,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.cookie_policy,style: TextStyle(
      //                     color: textColor,
      //                     fontFamily: 'Inter',
      //                     fontWeight: FontWeight.w500,
      //                     letterSpacing: -0.02,
      //                     fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () async {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: CookiePolicy(setLocale: widget.setLocale),
      //                     ),
      //                   );
      //                 }),
      //             const Divider(
      //               thickness: 2,
      //             ),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.perm_contact_calendar_outlined,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.about_us,
      //                   style: Theme.of(context)
      //                       .primaryTextTheme
      //                       .bodyLarge
      //                       ?.merge(TextStyle(
      //                       color: textColor,
      //                       //Color.fromRGBO(48, 145, 139, 1),
      //                       fontFamily: 'Inter',
      //                       fontWeight: FontWeight.w500,
      //                       letterSpacing: -0.02,
      //                       fontSize: 16)),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () async {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: AboutUs(setLocale: widget.setLocale),
      //                     ),
      //                   );
      //                 }),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.help_outline,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.help,style: TextStyle(
      //                     color: textColor,
      //                     //Color.fromRGBO(48, 145, 139, 1),
      //                     fontFamily: 'Inter',
      //                     fontWeight: FontWeight.w500,
      //                     letterSpacing: -0.02,
      //                     fontSize: 16),),
      //                 trailing:  const Icon(Icons.navigate_next,
      //                     color: Color.fromRGBO(153, 153, 153, 1)),
      //                 onTap: () async {
      //                   Navigator.push(
      //                     context,
      //                     PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       child: HelpPageHamburger(setLocale: widget.setLocale),
      //                     ),
      //                   );
      //                 }),
      //             const Divider(
      //               thickness: 2,
      //             ),
      //             ListTile(
      //                 leading:
      //                 const Icon(
      //                     Icons.power_settings_new,
      //                     color: Color.fromRGBO(141, 167, 167, 1)),
      //                 title: Text(AppLocalizations.of(context)!.logout,style: const TextStyle(
      //                     color: Color.fromRGBO(226, 68, 0, 1),
      //                     //Color.fromRGBO(48, 145, 139, 1),
      //                     fontFamily: 'Inter',
      //                     fontWeight: FontWeight.w500,
      //                     letterSpacing: -0.02,
      //                     fontSize: 16),),
      //                 onTap: () async {
      //                 }),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: EdgeInsets.only(top: height * 0.023,left: height * 0.023,right: height * 0.023),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  controller: SearchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle:  TextStyle(color:  Color.fromRGBO(102, 102, 102, 0.3),fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: height * 0.016),
                    hintText: "Maths, 10th, CBSE, Assessment ID",
                    suffixIcon:
                    Column(
                        children: [
                          Container(
                              height: height * 0.073,
                              width: width*0.13,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color.fromRGBO(82, 165, 160, 1),
                              ),
                              child: IconButton(
                                iconSize: height * 0.04,
                                color:  Color.fromRGBO(255, 255, 255, 1), onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   PageTransition(
                                //     type: PageTransitionType.rightToLeft,
                                //     child:  TeacherLooqQuestionBank(),
                                //   ),
                                // );
                              }, icon:  Icon(Icons.search),
                              )),
                        ]),
                    focusedBorder:  OutlineInputBorder(
                        borderSide:  BorderSide(color: Color.fromRGBO(82, 165, 160, 1)),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  enabled: true,
                  onChanged: (value) {
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text("Showing results of Maths | 10th",
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.015),),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'In progress',),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'In progress',),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'Active',),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'In progress',),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'Inactive',),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'Active',),
                SizedBox(height: height*0.02,),
                CardInfo(height: height, width: width, status: 'Inactive',),
                SizedBox(height: height*0.02,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(82, 165, 160, 1),
                      ),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      minimumSize: const Size(280, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                    //shape: StadiumBorder(),
                    onPressed: () {

                    },
                    child: Text(
                      'Load More',
                      style: TextStyle(
                          fontSize: height * 0.025,
                          fontFamily: "Inter",
                          color: Color.fromRGBO(82, 165, 160, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03,),
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
    required this.status
  }) : super(key: key);

  final double height;
  final double width;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ()
        {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: StudentLooqSelectedAssessment(),
            ),
          );
          // if (status == 'In progress')
          // {
          //   Navigator.push(
          //     context,
          //     PageTransition(
          //       type: PageTransitionType.rightToLeft,
          //       child: TeacherRecentAssessment(),
          //     ),
          //   );
          // }
          // else if(status == 'Active'){
          //   Navigator.push(
          //     context,
          //     PageTransition(
          //       type: PageTransitionType.rightToLeft,
          //       child: TeacherActiveAssessment(),
          //     ),
          //   );
          // }
          // else{
          //   Navigator.push(
          //     context,
          //     PageTransition(
          //       type: PageTransitionType.rightToLeft,
          //       child: TeacherInactiveAssessment(),
          //     ),
          //   );
          // }
        },
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
                    Row(
                      children: [
                        Text("Maths ",
                          style: TextStyle(
                            color: const Color.fromRGBO(28, 78, 80, 1),
                            fontSize: height * 0.0175,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),),
                        Text(" | Class IX",
                          style: TextStyle(
                            color: const Color.fromRGBO(28, 78, 80, 1),
                            fontSize: height * 0.0175,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: width * 0.02),
                child: Row(
                  children: [
                    Text("Assessment ID: ",
                      style: TextStyle(
                        color: const Color.fromRGBO(102, 102, 102, 1),
                        fontSize: height * 0.015,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),),
                    Text(" 0123456789",
                      style: TextStyle(
                        color: const Color.fromRGBO(82, 165, 160, 1),
                        fontSize: height * 0.015,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: width * 0.02,right: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Institute Test ID: ",
                          style: TextStyle(
                            color: const Color.fromRGBO(102, 102, 102, 1),
                            fontSize: height * 0.015,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),),
                        Text(" ABC903857928",
                          style: TextStyle(
                            color: const Color.fromRGBO(82, 165, 160, 1),
                            fontSize: height * 0.015,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),),
                      ],
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
      ),
    );
  }
}









