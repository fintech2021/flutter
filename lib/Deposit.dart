import 'package:flutter/material.dart';
import 'package:front_2/DepositList.dart';

import 'StockHistory.dart';
import 'StockList.dart';

class Balance extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.only(top:80.0),
        child: Scaffold(
            body: DefaultTabController(
              length: 2,

              child: Container(
                child: DepositList()
              ),
            )
        )
    );
  }
}

