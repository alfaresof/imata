import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/log_in/log_in_cubit.dart';
import 'package:imata/comp/colors.dart';
import 'package:imata/comp/dialog.dart';
import 'package:imata/comp/text.dart';
import 'package:imata/view/report/new_report.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: text(
            'Explore', 30, FontWeight.bold, Colors.black87, TextAlign.center),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: text('report', 25, FontWeight.normal, Colors.black87,
                  TextAlign.left),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: width / 1.2,
                height: height / 1.45,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(children: [
                  Center(child: Image.asset('assets/3d_hand.png')),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 8, left: width / 3.5),
                    child: Image.asset('assets/rubbish.png'),
                  ),
                  ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: OverflowBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: width / 1,
                            height: height / 6.3,
                            decoration: BoxDecoration(
                                color: darkGrey.withOpacity(0.6),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              children: <Widget>[
                                text(
                                    'Help us spot the plump trash by scanning it!',
                                    20,
                                    FontWeight.normal,
                                    Colors.white,
                                    TextAlign.center),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: darkGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding:
                                        EdgeInsets.fromLTRB(60, 10, 60, 10),
                                  ),
                                  child: text('try it !', 20, FontWeight.bold,
                                      Colors.white, TextAlign.center),
                                  onPressed: () {
                                    if(context
                                        .read<LogInCubit>()
                                        .state.id != null)
                                    {
                                     Navigator.pushNamed(context, NewReport.routename) ;

                                    }else {
                                      dialogBuilder(context);
                                    }
                                   },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
