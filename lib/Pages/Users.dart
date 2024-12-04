import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:sizer/sizer.dart';

import '../Components/CustomLoading.dart';
import '../Services/wp-api.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  Future refresh() {
    setState(() {
      fetchWpUsers();
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
                Text("Kullanıcı Listesi", style: TextStyle(
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
            future: fetchWpUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map wppost = snapshot.data?[index];

                    return Column(
                      children: [
                        Card(

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => PostDetailScreen(
                                    //           wppost: wppost,
                                    //         )));
                                  },
                                  child: Text(
                                      parse((wppost['name']).toString())
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
                                    parse((wppost['slug'])
                                        .toString())
                                        .documentElement!
                                        .text,
                                    style:TextStyle(
                                        fontFamily: 'sm'
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: double.infinity,
                                  child: Text(
                                    parse((wppost['description'])
                                        .toString())
                                        .documentElement!
                                        .text,
                                    style:TextStyle(
                                        fontFamily: 'sm'
                                    ),
                                  ),
                                ),
                                Text(parse((wppost['url']).toString())
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
