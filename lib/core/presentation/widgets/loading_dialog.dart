import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderDialog {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    var size = MediaQuery.of(context).size;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Lottie.asset('assets/Animation - 1710548049726.json',
                  repeat: true, animate: true),
            ));
      },
    );
  }
}
// child: Dialog(
//             key: key,
//             // backgroundColor: Colors.white,
//             child: Container(
//               // width: size.width,
//               // height: size.height,
//               child: Center(
//                 child: Lottie.asset('assets/loader.json',
//                     repeat: true, animate: true, fit: BoxFit.scaleDown),
//               ),
//             ),
//           ),