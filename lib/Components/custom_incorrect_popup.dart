import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog(
      {Key? key,
        required this.title,
        required this.content,
        required this.button,
        this.numberOfScreenBack,
        this.subContent,})
      : super(key: key);
  final String title;
  final String content;
  String? subContent;
  final String button;
  int? numberOfScreenBack;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      color: Colors.black12,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 2.0),
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
                offset: Offset(0.0, 3.0),
              ),
            ],
          ),
          padding: const EdgeInsets.all(15.0),
          // margin: const EdgeInsets.all(15.0),
          height: height * 0.27,
          width: width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.01,right:width * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      // SizedBox(width: width * 0.1),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(226, 68, 0, 1),
                        ),
                        // height: height * 0.05,
                        // width: width * 0.1,
                        child: const Icon(
                          Icons.info_outline_rounded,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      // SizedBox(width: width * 0.03),
                      SizedBox(width: width * 0.01),
                      Text(
                        widget.title,
                        style:
                        Theme.of(context).primaryTextTheme.headlineMedium?.merge(
                            TextStyle(
                                color: const Color.fromRGBO(51, 51, 51, 1),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.024)),
                      ),
                    ]
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                widget.content,
                style:
                Theme.of(context).primaryTextTheme.headlineMedium?.merge(
                    const
                    TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
              ),
              Text(
                widget.subContent??'',
                style: const TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  if(widget.numberOfScreenBack==null || widget.numberOfScreenBack==0){
                    Navigator.of(context).pop();
                  }
                  else{
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= widget.numberOfScreenBack!);
                  }

                },
                child: Text(
                  widget.button,
                  style: TextStyle(
                      color: const Color.fromRGBO(48, 145, 139, 1),
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w500),
                  // style: GoogleFonts.poppins(
                  //     fontSize: localHeight * 0.02),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

