import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../Components/custom_incorrect_popup.dart';
import '../DataSource/http_url.dart';
class TeacherForgotPassword extends StatefulWidget {
  const TeacherForgotPassword({Key? key, required this.email, required this.otp})
      : super(key: key);

  final String email;
  final String otp;

  @override
  TeacherForgotPasswordState createState() => TeacherForgotPasswordState();
}

class TeacherForgotPasswordState extends State<TeacherForgotPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
    {
      if (constraints.maxWidth > webWidth) {
        return Center(
            child: SizedBox(
            width: webWidth,
            child:  WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.white,
                body: Column(children: [
                  Container(
                    height: height * 0.26,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(0, 106, 100, 1),
                          Color.fromRGBO(82, 165, 160, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(width, height * 0.30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.03,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            height: height * 0.22,
                            width: width * 0.22,
                            child:
                            Image.asset("assets/images/question_mark_logo.png"),
                          ),
                        ),
                        Container(
                          width: width * 0.03,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    AppLocalizations.of(context)!.reset_password_caps,
                    style: TextStyle(
                      color: const Color.fromRGBO(82, 165, 160, 1),
                      fontSize: height * 0.027,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.055,
                  ),
                  Form(
                    key: formKey,
                    child: SizedBox(
                      height: height * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: height * 0.025,
                                    right: height * 0.025),
                                child: TextFormField(
                                  controller: oldPassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    labelText: AppLocalizations.of(context)!
                                        .new_password_caps,
                                    labelStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            51, 51, 51, 1),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.015),
                                    hintText:
                                    AppLocalizations.of(context)!.new_password,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            102, 102, 102, 0.3),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.02),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                82, 165, 160, 1)),
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                  ),
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return AppLocalizations.of(context)!
                                          .new_pass_req;
                                      //"New password is required(Password Should be 8 Characters)";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: height * 0.025,
                                    right: height * 0.025),
                                child: TextFormField(
                                  controller: newPassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    labelText: AppLocalizations.of(context)!
                                        .confirm_new_password_caps,
                                    labelStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            51, 51, 51, 1),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.015),
                                    hintText: AppLocalizations.of(context)!
                                        .confirm_new_password,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            102, 102, 102, 0.3),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.02),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                82, 165, 160, 1)),
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .enter_email_id;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(82, 165, 160, 1),
                              minimumSize: Size(width * 0.77, height * 0.06),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(39),
                              ),
                            ),
                            onPressed: () async {
                              bool valid = formKey.currentState!.validate();
                              if (valid) {
                                if (200 == 200) {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: showAlertDialog(context)),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: CustomDialog(
                                        title: AppLocalizations.of(context)!
                                            .incorrect_password,
                                        //'Incorrect Password',
                                        content: AppLocalizations.of(context)!
                                            .incorrect_password,
                                        //'Your Password has not been changed',
                                        button: AppLocalizations.of(context)!
                                            .retry,
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.submit,
                              style: TextStyle(
                                  fontSize: height * 0.024,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])))));
      }
      else {
        return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.white,
                body: Column(children: [
                  Container(
                    height: height * 0.26,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(0, 106, 100, 1),
                          Color.fromRGBO(82, 165, 160, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(width, height * 0.30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.03,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            height: height * 0.22,
                            width: width * 0.22,
                            child:
                            Image.asset("assets/images/question_mark_logo.png"),
                          ),
                        ),
                        Container(
                          width: width * 0.03,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    AppLocalizations.of(context)!.reset_password_caps,
                    style: TextStyle(
                      color: const Color.fromRGBO(82, 165, 160, 1),
                      fontSize: height * 0.027,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.055,
                  ),
                  Form(
                    key: formKey,
                    child: SizedBox(
                      height: height * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: height * 0.025,
                                    right: height * 0.025),
                                child: TextFormField(
                                  controller: oldPassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    labelText: AppLocalizations.of(context)!
                                        .new_password_caps,
                                    labelStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            51, 51, 51, 1),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.015),
                                    hintText:
                                    AppLocalizations.of(context)!.new_password,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            102, 102, 102, 0.3),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.02),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                82, 165, 160, 1)),
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                  ),
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return AppLocalizations.of(context)!
                                          .new_pass_req;
                                      //"New password is required(Password Should be 8 Characters)";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: height * 0.025,
                                    right: height * 0.025),
                                child: TextFormField(
                                  controller: newPassword,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    labelText: AppLocalizations.of(context)!
                                        .confirm_new_password_caps,
                                    labelStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            51, 51, 51, 1),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.015),
                                    hintText: AppLocalizations.of(context)!
                                        .confirm_new_password,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            102, 102, 102, 0.3),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.02),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                82, 165, 160, 1)),
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .enter_email_id;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(82, 165, 160, 1),
                              minimumSize: Size(width * 0.77, height * 0.06),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(39),
                              ),
                            ),
                            onPressed: () async {
                              bool valid = formKey.currentState!.validate();
                              if (valid) {
                                if (200 == 200) {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: showAlertDialog(context)),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: CustomDialog(
                                        title: AppLocalizations.of(context)!
                                            .incorrect_password,
                                        //'Incorrect Password',
                                        content: AppLocalizations.of(context)!
                                            .incorrect_password,
                                        //'Your Password has not been changed',
                                        button: AppLocalizations.of(context)!
                                            .retry,
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.submit,
                              style: TextStyle(
                                  fontSize: height * 0.024,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
      }
    }
    );}

  showAlertDialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: height * 0.04,
            color: const Color.fromRGBO(66, 194, 0, 1),
          ),
          SizedBox(
            width: height * 0.002,
          ),
          Text(
              AppLocalizations.of(context)!.success,
            //"Success",
            style: TextStyle(
                color: const Color.fromRGBO(51, 51, 51, 1),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: height * 0.02),
          ),
        ],
      ),
      content: Text(
          AppLocalizations.of(context)!.incorrect_password,
        //"Your Password has been changed Successfully",
        style: TextStyle(
            color: const Color.fromRGBO(51, 51, 51, 1),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: height * 0.018),
      ),
      actions: [
        TextButton(
          child: Text(
            AppLocalizations.of(context)!.ok_caps,
           // "OK",
            style: TextStyle(
                color: const Color.fromRGBO(48, 145, 139, 1),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: height * 0.018),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
