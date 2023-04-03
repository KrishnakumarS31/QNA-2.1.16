import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:qna_test/Pages/welcome_page.dart';
import '../DataSource/app_user_repo.dart';
import '../Entity/app_user.dart';
import '../Providers/LanguageChangeProvider.dart';

class SettingsLanguages extends StatefulWidget {
  const SettingsLanguages({Key? key,})
      : super(key: key);



  @override
  SettingsLanguagesState createState() => SettingsLanguagesState();
}

class SettingsLanguagesState extends State<SettingsLanguages> {
  List<String> languages = [
    'வணக்கம் (Tamil)',
    'Hello (English)',
    'नमस्ते (Hindi)',
    'ಕನ್ನಡ (Kannada)',
    'नमस्कार Marathi',
    'Hola (Spanish)',
    'హలో (Telugu)',
    'ഹലോ (Malayalam)',
    'ਪੰਜਾਬੀ (Punjabi)'
  ];
  String selected = 'Hello (English)';
  Color selectedColor = const Color.fromRGBO(82, 165, 160, 1);
  Color notSelectedColor = const Color.fromRGBO(51, 51, 51, 1);

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    AppUser? user = await AppUserRepo().getUserDetail();
    if (user!.locale == 'ta') {
      setState(() {
        selected = 'வணக்கம் (Tamil)';
      });
    } else if (user.locale == 'hi') {
      setState(() {
        selected = 'नमस्ते (Hindi)';
      });
    } else if (user.locale == 'kn') {
      setState(() {
        selected = 'ಕನ್ನಡ (Kannada)';
      });
    } else if (user.locale == 'mr') {
      setState(() {
        selected = 'नमस्कार Marathi';
      });
    } else if (user.locale == 'es') {
      setState(() {
        selected = 'Hola (Spanish)';
      });
    } else if (user.locale == 'te') {
      setState(() {
        selected = 'హలో (Telugu)';
      });
    } else if (user.locale == 'ml') {
      setState(() {
        selected = 'ഹലോ (Malayalam)';
      });
    } else if (user.locale == 'pa') {
      setState(() {
        selected = 'ਪੰਜਾਬੀ (Punjabi)';
      });
    }
    else {
      setState(() {
        selected = 'Hello (English)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
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
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.language,
                //"LANGUAGE",
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: height * 0.025,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.bottomRight,
                        begin: Alignment.topLeft,
                        colors: [
                      Color.fromRGBO(82, 165, 160, 1),
                      Color.fromRGBO(0, 106, 100, 1),
                    ])),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  right: width * 0.08, left: width * 0.08, top: height * 0.035),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.025),
                    child: Text(
                      AppLocalizations.of(context)!.preferred_language,
                      style: TextStyle(
                        color: const Color.fromRGBO(102, 102, 102, 1),
                        fontSize: height * 0.02,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.72,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (int j = 0; j < languages.length; j++)
                              GestureDetector(
                                onTap: () async {
                                  late String selectedLocale;
                                  setState(() {
                                    selected = languages[j];
                                  });
                                  if (selected == 'வணக்கம் (Tamil)') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'ta'));
                                    selectedLocale = 'ta';
                                  } else if (selected == 'नमस्ते (Hindi)') {
                                    AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'hi'));
                                    selectedLocale = 'hi';
                                  } else if (selected == 'ಕನ್ನಡ (Kannada)') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'kn'));
                                    selectedLocale = 'kn';
                                  } else if (selected == 'नमस्कार Marathi') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'mr'));
                                    selectedLocale = 'mr';
                                  } else if (selected == 'Hola (Spanish)') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'es'));
                                    selectedLocale = 'es';
                                  } else if (selected == 'హలో (Telugu)') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'te'));
                                    selectedLocale = 'te';
                                  } else if (selected == 'ഹലോ (Malayalam)') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'ml'));
                                    selectedLocale = 'ml';
                                  } else if (selected == 'ਪੰਜਾਬੀ (Punjabi)') {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'pa'));
                                    selectedLocale = 'pa';
                                  } else {
                                     AppUserRepo().deleteUserDetail();
                                    // widget.setLocale(const Locale.fromSubtags(
                                    //     languageCode: 'en'));
                                    selectedLocale = 'en';
                                  }
                                  Provider.of<LanguageChangeProvider>(context, listen: false).changeLocale(selectedLocale);
                                  int i = await AppUserRepo().createUserDetail(
                                      AppUser(locale: selectedLocale, id: 35));
                                  Navigator.pushNamedAndRemoveUntil(context, '/',(route) => route.isFirst);
                                  // Navigator.of(context).pushAndRemoveUntil(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => WelcomePage(
                                  //             )),
                                  //     (route) => route.isFirst);
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.15)),
                                    )),
                                    width: width * 0.833,
                                    height: height * 0.0775,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            languages[j],
                                            style: TextStyle(
                                              color: selected == languages[j]
                                                  ? selectedColor
                                                  : notSelectedColor,
                                              fontSize: height * 0.0162,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          selected == languages[j]
                                              ? Icon(
                                                  Icons.check,
                                                  color: selectedColor,
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                )
                                        ],
                                      ),
                                    )),
                              ),
                          ],
                        )),
                  ),
                ],
              ),
            )));
  }
}
