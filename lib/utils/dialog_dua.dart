import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogDua extends StatelessWidget {
  final String title;
  final String content;
  final String textConfirm;
  final String textCancle;
  final VoidCallback onConfirm;
  final VoidCallback onCancle;

  CustomDialogDua({
    required this.title,
    required this.content,
    required this.textConfirm,
    required this.onConfirm,
    required this.textCancle,
    required this.onCancle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 10 + 16,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      textCancle.tr,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    onPressed: onCancle,
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    child: Text(
                      textConfirm.tr,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    onPressed: onConfirm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
