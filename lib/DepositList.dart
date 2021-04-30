import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Color colorAppbar = const Color(0xffB5A5F5);
Color light_gray = const Color(0xffe0e0e0);
Color c1 = const Color(0xffB58ADE);
Color light_pink = const Color(0xffF6C9FF);
Color c3 = const Color(0xff98C1FA);
Color c4 = const Color(0xff6C79E0);


Future<List<Deposit>> fetchDeposit() async {
  final response = await http.get('http://localhost:3000/balance');

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var depositList = list.map((element) => Deposit.fromJson(element)).toList();
    return depositList;
  } else {
    throw Exception('Failed to load stockList');
  }
}


class Deposit {
  final String name;
  final String bank;
  final String account;
  final String balance;
  final String usenum;
  final String update_date;
  final String input_date;
//  final int id;
//  final int userid;

//  Deposit({this.id, this.balance, this.name, this.usenum, this.bank, this.userid, this.account, this.update_date, this.input_date});
  Deposit({ this.balance, this.name, this.usenum, this.bank, this.account, this.update_date, this.input_date});

  factory Deposit.fromJson(Map<String, dynamic> json) {
    return new Deposit(
      name: json['Deposit_name'],
      bank: json['Deposit_bank'],
      balance: json['Deposit_balance'],
      usenum: json['fintech_use_num'],
//      userid: json['user_id'],
      account: json['Deposit_account_no'],
      update_date: json['update_date'],
      input_date: json['input_date'],
//      id: json['id'],
    );
  }
}


class DepositList extends StatefulWidget {
  DepositList({Key key}) : super(key: key);

  @override
  DepositListPageState createState() => DepositListPageState();
}


class DepositListPageState extends State<DepositList> {


  Future<List<Deposit>> depositList;
  @override
  void initState(){
    super.initState();
    depositList = fetchDeposit();
  }


  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body:
        Center(
          child: FutureBuilder<List<Deposit>>(
            future: depositList,
            builder: (context, snapshot)
            {
              if (snapshot.hasData) {
                return ListView.builder(

                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    Deposit deposit = snapshot.data[index];

                    return Container(
                      margin:EdgeInsets.only(top: 20.0, bottom:10.0, left:30.0, right:30.0),
                      padding: EdgeInsets.only(left: 35.0, top: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: light_gray,
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
                                  width: 100,
                                  margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                  child: Text(
                                    deposit.bank,
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
                                    deposit.account,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  )),
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
                                  width: 300,
                                  margin: EdgeInsets.only(right: 0.0, bottom: 10.0),
                                  child: Text(
                                    deposit.balance+' 원',
//                                  '',
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