import 'package:flutter/material.dart';

Color light_gray = const Color(0xffe0e0e0);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}

class MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  Widget _home = MyContacts();
  Widget _myEmails = MyEmails();
  Widget _myProfile = MyProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("BottomNavigationBar Example"),
//      ),
      body:  this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text("Stock"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text("Deposit"),
          )
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody( )  {
    if(this.selectedIndex == 0) {
      return this._home;
    } else if(this.selectedIndex==1) {
      return this._myEmails;
    } else {
      return this._myProfile;
    }
  }

  void onTapHandler(int index)  {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}

class MyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Column(
          children: <Widget>[
            userName('최수영 님'),
            totalAsset('34', width: 100, height: 50),
//          makeText('계좌 계설하기', width: 100, height: 50),
            plusButton(),
//          bottombar(),

          ],

//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),



    );
  }

  Widget makeText(String title, {double width, double height}) {
    return Container(
      child: Center(
      ),
      width: 300.0,
      height: height,
      decoration: BoxDecoration(color: Colors.red[300]),
      margin: EdgeInsets.all(10.0),
    );
  }

  Widget plusButton(){
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: light_gray,
        ),
        margin: EdgeInsets.all(20.0),
//      color: light_gray,
        width: 350,
        padding: EdgeInsets.all(15.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center, // 주 축 기준 중앙
//      crossAxisAlignment: CrossAxisAlignment.center, // 교차 축 기준 중앙
          children: <Widget>[

//              Icon(Icons.sentiment_very_satisfied),
            Icon(Icons.add),
            Text('  계좌 추가하기 ',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
          ],
        )
    );
  }
  Widget totalAsset(String title, {double width, double height}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: light_gray,
        ),
        margin: EdgeInsets.all(5.0),
        width: 350,
        height: 300,
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            rowDeposit(),
            rowStock(),

          ],

        )

    );
  }

  Widget userName(String name) {
    return Container(
        child: Text(name, style: TextStyle(fontSize: 30.0),),
        width: 350.0,
//      height: 50.0,
//      decoration: BoxDecoration(color: Colors.red[300]),
        margin: EdgeInsets.only(top:70.0, bottom:10.0),
        padding: EdgeInsets.all(5.0)
    );
  }
  Widget rowDeposit(){
    return Row(
        children: <Widget> [
          setAssetName('예금'),
          totalDeposit('1000'),
        ]
    );
  }
  Widget rowStock(){
    return Row(
        children: <Widget> [
          setAssetName('주식'),
          totalStock('+ 10000000'),
        ]
    );
  }
  Widget setAssetName(String name) {
    return Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(right:10.0, bottom: 20.0),
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), //모서리를 둥글게
//            border: Border.all(color: Colors.red, width: 3)//테두리
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 주 축 기준 중앙
          children: <Widget>[
            Text(name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23.0,
              ),

            ),
          ],
        )
    );
  }
}
  Widget totalDeposit(String money){
    return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(50.0),
//          border: Border.all(color: Colors.red, width: 3),
//        color: light_gray,
        ),

        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(money,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
            Text(" 원",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
          ],
        )
    );
  }
  Widget totalStock(String money){
    return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(50.0),
//        border: Border.all(color: Colors.red, width: 3),
//        color: light_gray,
        ),
        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(money,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.red,
              ),
            ),
            Text(" 원",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.red,
              ),
            ),
          ],
        )
    );

  }





class MyEmails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Emails"));
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}