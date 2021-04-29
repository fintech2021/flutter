import 'package:flutter/material.dart';

import 'StockHistory.dart';
import 'StockList.dart';

class Stock extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.only(top:80.0),
        child: Scaffold(
            body: DefaultTabController(
              length: 2,

              child: Column(
                children: <Widget>[


                  Container(
                    margin: EdgeInsets.only(top:50.0),
                    constraints: BoxConstraints(maxHeight: 150.0),
                    child: Material(
                      color: Colors.indigo,
                      child: TabBar(
                        labelPadding: EdgeInsets.only(top: 10.0),
                        tabs: [
                          Tab(text:'Stock List'),
                          Tab(text:'History'),
//    Tab(icon: Icon(Icons.directions_bike)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
//        Widget()
                        StockList(),
//        Icon(Icons.directions_car),
//        Text('data'),
                        HistoryList(),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}

