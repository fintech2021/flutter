import 'package:flutter/material.dart';
import 'SecondScreen.dart';

Color colorAppbar = const Color(0xffB5A5F5);
Color light_gray = const Color(0xffe0e0e0);
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

class HistoryWedget extends StatelessWidget {
  BuildContext ctx;
  Color c1 = const Color(0xffB58ADE);
  Color light_pink = const Color(0xffF6C9FF);
  Color c3 = const Color(0xff98C1FA);
  Color c4 = const Color(0xff6C79E0);

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Center(
//      alignment: Alignment.center,
//        width: double.infinity,
//        height: double.infinity,
//        color: Colors.white,
        child: Column(
          children: <Widget>[
            stockHistory('2021.04.27  23:00:24', '0760446903201','KB증권', '053200', '카카오', '매수','1', '8000', ''),
            const Divider(
              height: 10,
              thickness: 1,
              indent:   20,
              endIndent: 20,
            ),
            stockHistory('2021.04.29  07:35:44', '0560427403201', '키움증권', '076200', '삼성전자', '매도', '3', '', '90000'),
          ],
        ));
  }

  Widget stockHistory(String date, String account, String company, String code, String name, String category,  String count, String withdrawAmount, String depositAmount) {
//    int _currentPrice = int.parse(currentPrice);
//    int _count = int.parse(count);
//    int _totalPrice = int.parse(totalPrice);
//    double _advantage = ((_currentPrice * _count)-_totalPrice)/_totalPrice; // 수익률
//    String advantage = _advantage.toStringAsFixed(2);
  String _m = (depositAmount == '') ? '- '+withdrawAmount : '+ '+depositAmount;

    Color _color = (depositAmount == '') ? Colors.deepOrangeAccent : Colors.blueAccent;
    return Container(
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
                      date,
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
                      company,
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
                      category,
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
                      name+' ('+ code + ')',
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
                      count ,
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
                      _m+'원',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: _color,
                      ),
                    )),
          ],
        )]));
  }

}
