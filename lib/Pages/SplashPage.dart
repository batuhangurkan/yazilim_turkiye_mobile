import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:sizer/sizer.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  //internet bağlantısı kontrolü
  Future checkuserconnection(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Future.delayed(Duration(seconds: 3), () async {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        });
      }
    } on SocketException catch (e) {
      Dialogs.materialDialog(
        context: context,
        msgStyle: TextStyle(fontFamily: "sm",color: Colors.grey.shade600),
        msg:
        'Uygulama internete bağlanırken sorun yaşandı. Lütfen internet bağlantınızı kontrol edip tekrar deneyin!',
        title: 'Bağlantı Hatası',
        titleStyle:
        TextStyle(fontFamily: "sm",color: Colors.black),
        color: Colors.white,
        barrierDismissible: false,
        msgAlign: TextAlign.center,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 3.h,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              onPressed: () async {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/splash', (route) => false);
              },

              // ),
              child:  MaterialButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/splash', (route) => false);
              }, child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.red[300],
                ),
                width: MediaQuery.of(context).size.width / 1, height: 5.h, child: Text("Tekrar Deneyiniz ", textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white, fontFamily: 'sm'
              ), ),
              ),),
            ),
          ),
        ],
      );
    }
  }


  @override
  void initState() {
   checkuserconnection(context);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        top: true,
        left: true,
        right: true,
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // this will take full width of screen
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FadeInDown(
                      child: Image.asset(
                        "assets/images/yazilimturk_logo.fw_.png",
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.8,
                      )
                  ),



                  Text("İnternet Bağlantınız Kontrol Ediliyor...", style: TextStyle(
                    fontFamily: 'sm', color: Colors.grey
                  ),),
                  SizedBox(height: 2.h,),
                  LoadingAnimationWidget.beat(color: Colors.red, size: 40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
