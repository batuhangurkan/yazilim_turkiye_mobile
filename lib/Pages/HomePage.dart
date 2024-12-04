import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:yazilim_turkiye_mobile/Components/CustomLoading.dart';

import '../Services/wp-api.dart';
import 'package:html/parser.dart';

import 'PostDetailScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Future refresh() {
    setState(() {
      fetchWpPosts();
    });
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/yazilimturk_logo.fw_.png", scale: 1.5,),
        bottom: PreferredSize(
            child: Column(
              children: [
                Text("Anasayfa", style: TextStyle(
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
      body: RefreshIndicator(
        color: Colors.red,
        onRefresh: refresh,
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data?[index];
                  var imageurl =
                  wppost["_embedded"]["wp:featuredmedia"][0]["source_url"];
                  return Column(
                    children: [
                      Card(

                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 5, bottom: 5),
                                  child: Image.network(imageurl),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PostDetailScreen(
                                            wppost: wppost,
                                          )));
                                },
                                child: Text(
                                  parse((wppost['title']['rendered']).toString())
                                      .documentElement!
                                      .text,
                                  style: TextStyle(
                                    fontFamily: 'sb', fontSize: 20
                                  )
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                child: Text(
                                  parse((wppost['excerpt']['rendered'])
                                      .toString())
                                      .documentElement!
                                      .text,
                                  style:TextStyle(
                                    fontFamily: 'sm'
                                  ),
                                ),
                              ),
                              Text(parse((wppost['date']).toString())
                                  .documentElement!
                                  .text, style: TextStyle(
                                fontFamily: 'sm'
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return Text('HATA : ${snapshot.hasError}');
            }
            return CustomLoading(
            );
          },
        ),
      ),
    );
  }
}
