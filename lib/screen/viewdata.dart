import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Viewdata extends StatefulWidget {
  const Viewdata({Key? key}) : super(key: key);

  @override
  _viewdataState createState() => _viewdataState();
}

class _viewdataState extends State<Viewdata> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('ke');

  Future<void> updata(String key) async {
    await dbfirebase.child(key).update({
      'staus': 'ขายแล้ว',
    }).then((response) {
      print('Success');
    }).catchError((onError) {
      print(onError.code);
      print(onError.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.flatware),
                  ),
                  title: Text('${snapshot.value['name']}'),
                  subtitle: Row(
                    children: [
                      Text("ราคา" + '${snapshot.value['price']}'),
                      Text("สถานะ" + '${snapshot.value['staus']}'),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            print(snapshot.key);
                            //ลบ ข้อมูลใน  db
                            dbfirebase.child(snapshot.key!).remove();
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.update),
                          onPressed: () {
                            updata(snapshot.key!);
                            print('snapshot.key');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
