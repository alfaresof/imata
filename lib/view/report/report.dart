import 'package:flutter/material.dart';
import 'package:imata/comp/colors.dart';
import 'package:imata/comp/text.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: text('Explore',30,FontWeight.bold , Colors.black87),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(

              children: <Widget>[
                text('report', 20, FontWeight.normal, Colors.black87),
                Stack(
                  children: [
                    Container(
                      width: width/1.2,
                      height: height/1.45,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: OverflowBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: width/1,
                                height: height/7,
                                decoration: BoxDecoration(
                                    color: Colors.black87.withOpacity(0.4),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)
                                    )
                                ),
                                // color: Colors.black.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        // text()
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
