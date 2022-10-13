import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlfliteapp/sql_data.dart';

import 'home_screen.dart';

SqlDb sqlDb = SqlDb();

Future<List<Map>> readData() async {
  List<Map> respons = await sqlDb.readData(
      "SELECT * FROM data"); //'INSERT INTO "sqldata"(word) VALUES("hi")'
  return respons;
}

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Data"),
        ),
        body: Container(
          child: ListView(children: [
            FutureBuilder(
                future: readData(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                                child: ListTile(
                              title: Row(
                                children: [
                                  Text("Name: ${snapshot.data![i]['note']}"),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text("number: ${snapshot.data![i]['num']}")
                                ],
                              ),
                              subtitle:
                                  Text("status: ${snapshot.data![i]['chek']}"),
                            )),
                          );
                        }));
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ]),
        ));
  }
}
//  ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: dbsql.list.length,
//         itemBuilder: ((context, index) {
//         return  ListTile(title: Text("Word:${dbsql.list[index]['word']}"),leading: Text("Numbe:${dbsql.list[index]['value']}"),subtitle: Text("True"),);
//       })),