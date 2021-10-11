import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firstsun/model/activity.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  // initState เป็น function ที่จะทำงานก่อนการ วาดหน้า
  @override
  void initState() {
    super.initState();
    callActivity();
  }

  Future<void> callActivity() async {
    // กำหนด path
    var url = Uri.parse("https://www.boredapi.com/api/activity");
    // การ call api
    var response = await http.get(url);

    // การแสดง สถานะของโค้ด
    print(response.statusCode);
    // การแสดง ข้อมูล
    print(response.body);

    // การสั่งให้แอปวาดหน้าจอใหม่ โดยการใช้ function setState
    setState(() {
      // การแปลงข้อมูลจาก json >> object
      data = cedFromJson(response.body);
      // การเข้าถึงข้อมูลใน object
      print(data.activity);
      print(data.type);
      print(data.participants);
      print(data.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.api_sharp),
              SizedBox(
                width: 10,
              ),
              Text('Dashboard'),
            ],
          ),
        ),
        body: Column(
          children: [
            Text(data?.activity ?? "กำลังโหลด"),
            Text(data?.type ?? ""),
            // การนำ integer มาแสดง
            Text('${data?.participants ?? ""}'),
            Text('${data?.price ?? ""}'),
          ],
        ),
      ),
    );
  }
}
