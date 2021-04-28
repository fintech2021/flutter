import 'package:flutter/material.dart';

Color colorAppbar = const Color(0xffB5A5F5);
Color light_gray = const Color(0xffe0e0e0);

class StockListWedget extends StatelessWidget {
  BuildContext ctx;
  Color c1 = const Color(0xffB58ADE);
  Color light_pink = const Color(0xffF6C9FF);
  Color c3 = const Color(0xff98C1FA);
  Color c4 = const Color(0xff6C79E0);

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Center(
        child: Column(
      children: <Widget>[
        stockDetail('012345', 'test', 'KB증권', '10000', '5', '8000', '40000'),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        stockDetail('012345', 'test', 'KB증권', '15000', '5', '18000', '90000'),
      ],
    ));
  }

  Widget stockDetail(String code, String name, String company, String currentPrice, String count, String avePrice, String totalPrice) {
    int _currentPrice = int.parse(currentPrice);
    int _count = int.parse(count);
    int _totalPrice = int.parse(totalPrice);
    double _advantage = ((_currentPrice * _count)-_totalPrice)/_totalPrice; // 수익률
    String advantage = _advantage.toStringAsFixed(2);

    Color advColor = (_advantage > 0 ) ? Colors.deepOrangeAccent : Colors.blueAccent;
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
                      company,
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
                      name,
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
                      count,
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
                      currentPrice,
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
                      avePrice,
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
                      totalPrice,
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


//              rowDeposit(),
//              rowStock(),
          ],
        ));
  }

  Widget labelText(String code, String Name) {
    return Container();
  }
}
