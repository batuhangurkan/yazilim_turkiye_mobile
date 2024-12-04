import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:sizer/sizer.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, this.wppost});

  final wppost;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/yazilimturk_logo.fw_.png", scale: 1.5,),
        bottom: PreferredSize(
            child: Column(
              children: [
                Text("Post Detayları", style: TextStyle(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: widget.wppost['id'],
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image(
                    image: NetworkImage(
                      widget.wppost['_embedded']['wp:featuredmedia'][0]
                      ['source_url'],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    parse((widget.wppost['content']['rendered']).toString())
                        .documentElement!
                        .text,
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(parse((widget.wppost['date']).toString())
                  .documentElement!
                  .text),
            )
          ],
        ),
      ),
    );
  }
}