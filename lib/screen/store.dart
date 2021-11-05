import 'package:firstsun/config/constant.dart';
import 'package:firstsun/screen/viewdata.dart';
import 'package:flutter/material.dart';

import 'Add Data.dart';

class store extends StatefulWidget {
  const store({Key? key}) : super(key: key);

  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Store"),
        ),
        body: TabBarView(
          children: [
            AddData(),
            Viewdata(),
          ],
        ),
        bottomNavigationBar: Container(
          color: pColor,
          child: TabBar(
            indicatorColor: Colors.redAccent,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "Add Data",
              ),
              Tab(
                text: "View Data",
              )
            ],
          ),
        ),
      ),
    );
  }
}
