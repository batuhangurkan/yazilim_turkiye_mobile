import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:sizer/sizer.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/yazilimturk_logo.fw_.png", scale: 1.5,),
        bottom: PreferredSize(
            child: Column(
              children: [
                Text("Ayarlar", style: TextStyle(
                    fontFamily: 'sm', fontSize: 15
                ),),
                SizedBox(height: 1.h,),
                Container(
                  color: Colors.grey[400],
                  height: 1.0,
                ),
              ],
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Column(
        children: [
          ListTile(
              title: Text("Uygulama Hakkında"),
              leading: FaIcon(FontAwesomeIcons.infoCircle, color: Colors.red,),
              onTap: () {

              }),
          SizedBox(height: 1.h,),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
              title: Text("Bize Ulaşın!"),
              leading: FaIcon(FontAwesomeIcons.phone, color: Colors.red,),
              onTap: () {

              }),
          SizedBox(height: 1.h,),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
              title: Text("Çıkış Yap"),
              leading: FaIcon(FontAwesomeIcons.signOutAlt, color: Colors.red,),
              onTap: () {
                  Dialogs.materialDialog(context: context, title: "Çıkış Yap!", msg: "Uygulamadan çıkış yapmak istediğinize emin misiniz?", titleStyle: TextStyle(
                    fontFamily: 'sb',
                  ), msgStyle: TextStyle(
                    fontFamily: 'sm'
                  ), actions: [
                    IconsOutlineButton(

                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      text: 'İptal',
                      iconData: Icons.cancel_outlined,
                      textStyle: GoogleFonts.sora(color: Colors.white),
                      iconColor: Colors.white,
                    ),
    IconsButton(
    onPressed: () {
    new Future.delayed(const Duration(seconds: 1), () {


    Navigator.pushNamedAndRemoveUntil(
    context, '/login', (route) => false);
    });



    }, text: 'Kapat',
      color: Colors.greenAccent,
      iconData: Icons.check,
      textStyle: GoogleFonts.sora(color: Colors.white),
      iconColor: Colors.white,
    ),
                  ]  );
              }),
          SizedBox(height: 1.h,),
          Divider(
            height: 2,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
