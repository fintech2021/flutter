import 'package:flutter/material.dart';
//import 'EnrollAccount.dart';
import 'main.dart';


Color colorAppbar = const Color(0xffB5A5F5);

void main() {
  runApp(MaterialApp(
    title: 'SecondScreen',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: colorAppbar,
      ),
      body: SecondScreenWedget(),
    ),
  ));
}

class SecondScreenWedget extends StatelessWidget {
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

  }

}