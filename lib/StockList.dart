import 'package:flutter/material.dart';
import 'dart:convert';
import 'StockHistory.dart';
//import '__StockList.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

Color light_gray = const Color(0xffe0e0e0);
//Future<Map<String, dynamic>> fetchEquity() async {
Future<List<Equity>> fetchEquity() async {
  final response = await http.get('http://localhost:3000/test');

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var equityList = list.map((element) => Equity.fromJson(element)).toList();
    return equityList;
  } else {
    throw Exception('Failed to load stockList');
  }
}


class Equity {
  final String eqcode;
  final String name;
  final String company;
  final String count;
  final String selling_price;
  final String purchasing_price;
  final String total_price;
  final String update_date;
  final String input_date;
  final String id;

  Equity({this.id, this.eqcode, this.name, this.company, this.count, this.selling_price, this.purchasing_price, this.total_price, this.update_date, this.input_date});
//
//  factory Equity.fromJson(Map<String,dynamic > json) {
  factory Equity.fromJson(Map<String, dynamic > json) {
//  factory Equity.fromJson(String json) {
    return new Equity(
      eqcode: json['eqcode'],
      name: json['name'],
      company: json['company'],
      count: json['count'],
      selling_price: json['selling_price'],
      purchasing_price: json['purchasing_price'],
      total_price: json['total_price'],
      update_date: json['update_date'],
      input_date: json['input_date'],
      id: json['id'],
    );
  }
}


class StockList extends StatefulWidget {
  StockList({Key key}) : super(key: key);

  @override
  StockListPageState createState() => StockListPageState();
}


class StockListPageState extends State<StockList> {
//  int selectedIndex = 0;
//  Widget _home = Home();
//  Widget _stock = Stock();
//  Widget _deposit = Deposit();

  Future<List<Equity>> equityList;
  @override
  void initState(){
    super.initState();
    equityList = fetchEquity();
  }

  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.only(top:80.0),
        child: Scaffold(
          body:
//          DefaultTabController(
//              child:
              Center(
//            child:DefaultTabController(
            child: FutureBuilder<List<Equity>>(
              future: equityList,
              builder: (context, snapshot)
              {
                if (snapshot.hasData) {
                  return ListView.builder(

                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      Equity equity = snapshot.data[index];
                      int _selling_price = int.parse(equity.selling_price);
                      int _purchasing_price = int.parse(equity.purchasing_price);
                      int _total_price = int.parse(equity.total_price);
                      int _count = int.parse(equity.count);
                      double _advantage = (((_selling_price * _count)-_total_price)/_total_price)*100;
                      String advantage = _advantage.toStringAsFixed(2);
                      Color advColor = (_advantage > 0 ) ? Colors.deepOrangeAccent : Colors.blueAccent;


                      return Container(

                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//            border: Border.all(color: Colors.red, width: 3)
//            border:
//            color: light_pink,
//          color:Colors.white,
                              ),
                              margin: EdgeInsets.only(left:5.0, right:5.0, bottom:5.0),
//          width: 400,
//        height: 300,
                              padding: EdgeInsets.only(left: 40.0, top: 0.0),
                              child: Column(
                                children: <Widget>[
                                  // 1. 국내, 증권사, 종목
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            '',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: light_gray,
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            '증권',
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
                                      Container(
                                          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                  border: Border.all(color: Colors.red, width: 3)
                                          ),
                                          width: 100,
                                          child: Text(
                                            '종목',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black38,
                                            ),
                                          ))
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                          child: Text(
                                            '국내',
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                          child: Text(
                                            equity.company,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          )),
//                  ),
//                  Flexible(
//                      flex:1,
//                      child:
                                      Container(
                                          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                  border: Border.all(color: Colors.red, width: 3)
                                          ),
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),

//                      margin: EdgeInsets.only(bottom: 10.0),
                                          width: 100,
                                          child: Text(
                                            equity.name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ))
//                  )
                                    ],
                                  ),
                                  // 2. 구분, 현재가 수량
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
                                          width: 120,
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
                                          width: 220,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            '현재가',
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                          child: Text(
                                            equity.count,
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
                                          width: 220,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                          child: Text(
                                            equity.selling_price,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          )),
//                  ),
//                  Flexible(
//                      flex:1,
//                      child:
//                Container(
//                    decoration: BoxDecoration(
////            borderRadius: BorderRadius.circular(30.0),
////                  border: Border.all(color: Colors.red, width: 3)
//                    ),
//                    margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
//
////                      margin: EdgeInsets.only(bottom: 10.0),
//                    width: 100,
//                    child: Text(
//                      count,
//                      textAlign: TextAlign.left,
//                      style: TextStyle(
//                        fontSize: 20.0,
//                      ),
//                    ))
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            '평균 매입가/매도가',
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            '총 거래금액',
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
                                      Container(
                                          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                  border: Border.all(color: Colors.red, width: 3)
                                          ),
                                          width: 100,
                                          child: Text(
                                            '수익률 ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black38,
                                            ),
                                          ))

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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                          child: Text(
                                            equity.purchasing_price,
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
                                          width: 120,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                          child: Text(
                                            equity.total_price,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          )),

                                      Container(
                                          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(30.0),
//                            border: Border.all(color: Colors.red, width: 3)
                                          ),
                                          width: 100,
                                          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),

                                          child: Text(
                                            advantage+'%',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: advColor,

                                            ),
                                          )
                                      ),
//                  ),
//                  Flexible(
//                      flex:1,
//                      child:

                                    ],
                                  ),
                                  const Divider(
                                    height: 40,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 30,
                                  ),

                                ],
                              )
                          )
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