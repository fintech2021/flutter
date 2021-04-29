import 'dart:convert';

import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'package:http/http.dart' as http;


Color colorAppbar = const Color(0xffB5A5F5);
Color light_gray = const Color(0xffe0e0e0);
//Future<Map<String, dynamic>> fetchEquity() async {
Future<List<History>> fetchHistory() async {
  final response = await http.get('http://localhost:3000/history');

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var historyList = list.map((element) => History.fromJson(element)).toList();
    return historyList;
  } else {
    throw Exception('Failed to load stockList');
  }
}


class History {
  final String eqcode;
  final String name;
  final String company;
  final String count;
  final String category;
  final String account;
  final String withdrawAmount;
  final String depositAmount;
  final String update_date;
  final String input_date;
  final String id;

  History({this.id, this.eqcode, this.name, this.company, this.count, this.withdrawAmount, this.depositAmount, this.account, this.category,  this.update_date, this.input_date});
//
//  factory Equity.fromJson(Map<String,dynamic > json) {
  factory History.fromJson(Map<String, dynamic > json) {
//  factory Equity.fromJson(String json) {
    return new History(
      eqcode: json['eqcode'],
      name: json['name'],
      company: json['company'],
      count: json['count'],
      withdrawAmount: json['withdrawAmount'],
      depositAmount: json['depositAmount'],
      category: json['category'],
      account: json['account'],
      update_date: json['update_date'],
      input_date: json['input_date'],
      id: json['id'],
    );
  }
}


class HistoryList extends StatefulWidget {
  HistoryList({Key key}) : super(key: key);

  @override
  HistoryListPageState createState() => HistoryListPageState();
}


class HistoryListPageState extends State<HistoryList> {
//  int selectedIndex = 0;
//  Widget _home = Home();
//  Widget _stock = Stock();
//  Widget _deposit = Deposit();

  Future<List<History>> historyList;
  @override
  void initState(){
    super.initState();
    historyList = fetchHistory();
  }
//  @override

  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.only(top:80.0),
        child: Scaffold(
        body:
//          DefaultTabController(
//              child:
        Center(
//            child:DefaultTabController(
        child: FutureBuilder<List<History>>(
        future: historyList,
        builder: (context, snapshot)
    {
      if (snapshot.hasData) {
        return ListView.builder(

            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
          History history = snapshot.data[index];
//          String _m = (history.depositAmount == '') ? '- '+history.withdrawAmount : '+ '+history.depositAmount;
//              String _m =  (history.depositAmount == '') ? history.withdrawAmount : history.depositAmount;
              Color _color = (history.depositAmount == '') ? Colors.deepOrangeAccent : Colors.blueAccent;

//

          return Container(


              child:  Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//            border: Border.all(color: Colors.red, width: 3)
//            border:
//            color: light_pink,
//          color:Colors.white,
                  ),
                  margin: EdgeInsets.all(5.0),
//          width: 400,
//        height: 300,
                  padding: EdgeInsets.only(left: 40.0, top: 10.0),
                  child: Column(
                      children: <Widget>[
                        //날짜
                        Row(
                          children: <Widget>[
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
//                  color: light_gray,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                  color: light_gray,
                                ),
//                    width: 300,
                                margin: EdgeInsets.only( bottom:10.0),
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  history.input_date,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                )
//                  ),
                            ),
//
                          ],
                        ),

                        //계좌번호
                        Row(
                          children: <Widget>[
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
                                decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                ),
                                width: 130,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '증권',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black38,
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
                                width: 200,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '계좌번호',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black38,
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
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
                                decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                ),
                                width: 130,
                                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                child: Text(
                                  history.company,
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
                                width: 200,
                                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                child: Text(
                                  history.account,
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

                        // 구분, 종목
                        Row(
                          children: <Widget>[
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
                                decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                ),
                                width: 130,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '구분',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black38,
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
                                width: 200,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '종목',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black38,
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
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
                                decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                ),
                                width: 130,
                                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                child: Text(
                                  history.category,
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
                                width: 200,
                                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                child: Text(
                                  history.name+' ('+ history.eqcode + ')',
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
                        // 수량 , 거래금
                        Row(
                          children: <Widget>[
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
                                decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                ),
                                width: 130,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '수량',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black38,
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
                                width:  200,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '금액',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black38,
                                  ),
                                )),
//                  ),
//                  Flexible(
//                      flex:1,
//                      child:
//                  )
                          ],
                        ),
                        Row(
                          children: <Widget>[
//                  Flexible(
//                    flex:1,
//                    child:
                            Container(
                                decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                ),
                                width: 130,
                                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                child: Text(
                                  history.count ,
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
                                width: 150,
                                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                child: Text(
                                  history.withdrawAmount+'원',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: _color,
                                  ),
                                )),
                          ],
                        )]))
//                          ListTile(
//
//                            title: Text(equity.company),
//                          )

          );

            },
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return CircularProgressIndicator();
    },
        ),
        ),
        ),
    );
  }
}