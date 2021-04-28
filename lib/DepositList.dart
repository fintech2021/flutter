import 'package:flutter/material.dart';
import 'SecondScreen.dart';

Color colorAppbar = const Color(0xffB5A5F5);
Color light_gray = const Color(0xffe0e0e0);

class DepositWidget extends StatelessWidget {
  BuildContext ctx;
  Color c1 = const Color(0xffB58ADE);
  Color light_pink = const Color(0xffF6C9FF);
  Color c3 = const Color(0xff98C1FA);
  Color c4 = const Color(0xff6C79E0);

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Center(
        child: Container(
            margin: EdgeInsets.only(top: 70.0),
            child: Column(
              children: <Widget>[
                card('KB증권', '0760446903201', '2,240,000'),
              ],
            )));
  }

  Widget card(String bank, String account, String total) {
    return Container(
      padding: EdgeInsets.only(left: 35.0, top: 30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
//            border: Border.all(color: Colors.red, width: 3)
//            border:
//            color: light_pink,
        color: light_gray,
//          color:Colors.white,
      ),
      width: 330,
      height: 200,
//      color: c1,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                      ),
                  width: 80,
                  margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: Text(
                    bank,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )
//                  ),
                  ),
//                  Flexible(
//                      flex:1,
//                      child:
              Container(
                  decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                      ),
                  width: 190,
                  margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: Text(
                    account,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
//                  ),
//                  Flexible(
//                      flex:1,
//                      child:
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(30.0),
//                    border: Border.all(color: Colors.red, width: 3)
                    ),
                width: 200,
                height: 70,
                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                      ),
                  width: 250,
                  margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: Text(
                    total + '원 ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
//                  ),
//                  Flexible(
//                      flex:1,
//                      child:
            ],
          ),
        ],
      ),
    );
  }


  }

