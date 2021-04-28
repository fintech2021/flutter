import 'package:flutter/material.dart';
import 'SecondScreen.dart';

Color colorAppbar = const Color(0xffB5A5F5);

//void main() {
//  runApp(MaterialApp(
//    title: 'FirstScreen',
//    home: Scaffold(
//      appBar: AppBar(
//        title: Text('First Screen'),
//        backgroundColor: colorAppbar,
//      ),
//      body: FirstScreenWedget(),
//    ),
//  ));
//}

class EnrollAccountWedget extends StatelessWidget {
  BuildContext ctx;
  Color c1 = const Color(0xffB58ADE);
  Color c2 = const Color(0xffF6C9FF);
  Color c3 = const Color(0xff98C1FA);
  Color c4 = const Color(0xff6C79E0);
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: RaisedButton(
            child: Text('Back to First Screen'),
            onPressed: () {
              Navigator.pop(ctx);
//              Navigator.push(
//                ctx,
//                MaterialPageRoute(builder: (context) => SecondScreenWidget()),
//              );
            },
          ),
        )
    );
//    return MaterialApp(
//        home: Scaffold(
//        body:
//        Container(
//          margin: EdgeInsets.only(top:80.0),
//      width: double.infinity,
//      height: double.infinity,
//      color: Colors.white,
//      child: Container(
//        color: Colors.white,
//        child: Column(
//            children: <Widget>[
//        Flexible(
//        child: Container(
//            alignment: Alignment(0.0, 0.0),
//        height: 45,
//        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
//        padding: EdgeInsets.only(left: 20, right: 20),
//        decoration: new BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.all(Radius.circular(10)),
//            border: Border.all(width: 1, color: Colors.black12)),
//        child: Row(children: <Widget>[
//          Container(
//            width: 100,child: Text("Account Number",
//              style: TextStyle(fontSize: 16, color: Colors.black)),
//        ),
//          Flexible(
//            child: Container(
//              margin: EdgeInsets.only(right: 20),
//              child: TextField(
////                controller: _tec,
//                style: TextStyle(color: Colors.black),
//                decoration: InputDecoration(
//                    border: InputBorder.none,
////                    labelText: '계좌 번호',
//                    hintText: 'Input Your Name',
//                    hintStyle: TextStyle(color: Colors.grey[300])),
//                cursorColor: Colors.blue,
//              ),
//            ),
//          ),
//          ]),
////      ),Container(
////        margin: EdgeInsets.only(top: 80.0,left: 10.0, right:10.0 ),
////        child: Column(
////        children: <Widget>[
////          Text(' You can input text.'
////          ),
//////          TextField(),
////          TextField(
////
////            decoration: InputDecoration(
////              border: OutlineInputBorder(),
////              labelText: '계좌 번호',
////              helperText: 'Korean language support',
////            ),
////          )
//////          inputInfo(),
//////          RaisedButton(
//////          child: Text('Move to Second Screen'),
//////          onPressed: () {
//////            Navigator.pop(ctx);
////////            Navigator.push(
////////              ctx,
////////              MaterialPageRoute(builder: (ctx) => SecondScreenWedget()),
////////            );
//////          },
//////        ),
////     ]
////        )
////    )
//    )
//    )
//    ])
//    )
//    )
//        )
//    );

  }
//  final TextEditingController _controller = new TextEditingController();
//
//  Widget inputInfo(){
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Text(' You can input text.'),
//          TextField(),
//          TextField(
//            decoration: InputDecoration(
//              labelText: 'Input Name',
//              helperText: 'Korean language support',
//            ),
//          )
//        ],
//      )
//    );
//  }
//
}