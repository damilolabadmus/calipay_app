import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Pandora {

  void showToast(String message, BuildContext context, String messageType) {
    switch (messageType) {
      case "SUCCESS":
        displayToast(message, context, Colors.green);
        break;
      case "FAILED":
        displayToast(message, context, Colors.red);
        break;
      case "WARNING":
        displayToast(message, context, Colors.orangeAccent);
        break;
      case "INFO":
        displayToast(message, context, Colors.black54);
        break;
    }
  }

  void displayToast(String message, BuildContext context, Color color) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                EvaIcons.alertCircleOutline,
                color: Colors.white,
              ),
              Text(message,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Regular',
                  )),
            ],
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
      ),
    );
  }


}

enum MessageTypes { SUCCESS, FAILED, WARNING, INFO }
enum ExceptionTypes { NODATAEXCEPTION, UNKNOWN, WARNING, INFO }
