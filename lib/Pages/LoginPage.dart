import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yazilim_turkiye_mobile/Components/CustomLoading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  //uygulamanın versiyon numarasını tuttuğum yer!
  String versionNumber = 'V0.0.1';


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: FadeInUp(
            child: Column(
              children: [
                SizedBox(height: 15.h,),
               Column(
                 children: [
                   Row(
                     children: [
                       Image.asset("assets/images/yazilimturk_logo.fw_.png")
                     ],
                   ),
               
                 ],
               ),
                SizedBox(height: 2.h,),
            
                Row(
                  children: [
                    SizedBox(width: 5.w,),
                    Text("Tekrardan Hoş Geldiniz,", style: TextStyle(fontFamily: 'sb', fontSize: 20),)
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(
                  children: [
                    SizedBox(width: 5.w,),
                    Text("YazılımTürkiye.com websitesinin mobil versiyonudur!", style: TextStyle(fontFamily: 'sm', fontSize: 12),)
                  ],
                ),
                SizedBox(height: 2.h,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
            
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "E-Mail",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey[400],
                      ),
                      hintStyle: GoogleFonts.ubuntu(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
            
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
            
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.grey[400],
                      ),
                      hintStyle: GoogleFonts.ubuntu(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h,),
                MaterialButton(onPressed: () {}, child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red[300],
                  ),
                  width: MediaQuery.of(context).size.width / 1, height: 5.h, child: Text("Giriş Yap", textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white, fontFamily: 'sm'
                ), ),
                ),),
                SizedBox(height: 2.h,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/passwordreset');
              },
              child: FadeInUp(
                duration: Duration(milliseconds: 1500),
                child: RichText(
                    text: TextSpan(
                        text: "Şifrenizi mi unuttunuz? " + ' ',
                        style: TextStyle(fontFamily: 'sm',
                            color: Colors.grey[500], fontSize: 16),
                        children: [
                          TextSpan(
                              text: "Şifremi sıfırla",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ])),
              ),
            ),
                SizedBox(height: 2.h,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                          height: 2,
                          color: Colors.grey,
                        )),
                    Text(
                      "Bunları Dene",
                      style: TextStyle(fontFamily: 'sm',
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Divider(
                          height: 5,
                          color: Colors.black,
                        )),
                  ]),
                ),
                SizedBox(height: 2.h,),
                MaterialButton(onPressed: () async {

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder:
                              (BuildContext context, _, __) =>
                              CustomLoading()));
    Future.delayed(Duration(seconds: 2), () async {

      Navigator.pushNamedAndRemoveUntil(
          context, '/bottomnavbar', (route) => false);
    });

                  
                  
                  
                }, child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red[300],
                  ),
                  width: MediaQuery.of(context).size.width / 1, height: 5.h, child: Text("Misafir Olarak Giriş Yap", textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white, fontFamily: 'sm'
                ), ),
                ),),
                SizedBox(height: 2.h,),
                Text("", style: TextStyle(
                  fontFamily: 'sm'
                ),),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse('https://www.yazilimturkiye.com');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    debugPrint('URL açılamıyor: $url');
                  }
                },
                child: Text("YazilimTurkiye.com", style: TextStyle(
                  fontFamily: 'sb', color: Colors.blue, fontSize: 15
                )
            
            
            
            
            
            
            
            
                ),),
                SizedBox(height: 2.h,),
                Text("Uygulama Versiyonu" + " " +versionNumber, style: TextStyle(
                  fontFamily: 'sm', color: Colors.grey
                ),)
              
              
              ],
            ),
          ),
        ),
    );
  }
}
