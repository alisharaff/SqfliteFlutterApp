import 'package:flutter/material.dart';
import 'package:sqlfliteapp/sql_data.dart';

SqlDb sqlDb = SqlDb();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// My Choose Data
var num;
var word;
var check;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Text("Add"),
        onPressed: () {
          setState(() async {
            await sqlDb.insertData(
                "INSERT INTO 'data' ('note','chek','num') VALUES ('$word','$check',$num)");
            await Navigator.of(context).pushNamed("showData");
          });
        },
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(14, 175, 174, 238),
            height: 330.0,
            child: Center(child: Text("Choose Your Data",style: TextStyle(fontSize: 25.0),),),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Choose number"),
                    ElevatedButton(
                        onPressed: () async {
                          num = await showMenu(
                              context: context,
                              position:
                                  RelativeRect.fromLTRB(0.0, 480.0, 0.0, 0.0),
                              items: <PopupMenuItem<int>>[
                                new PopupMenuItem<int>(
                                    child: const Text(' 1'), value: 1),
                                new PopupMenuItem<int>(
                                    child: const Text(' 2'), value: 2),
                                new PopupMenuItem<int>(
                                    child: const Text(' 3'), value: 3),
                                new PopupMenuItem<int>(
                                    child: const Text(' 4'), value: 4),
                              ]);
                        },
                        child: Text("add"))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Choose a word"),
                    ElevatedButton(
                        onPressed: () async {
                          word = await showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                  150.0, 480.0, 150.0, 0.0),
                              items: <PopupMenuItem<String>>[
                                new PopupMenuItem<String>(
                                    child: const Text('word 1'),
                                    value: "word 1"),
                                new PopupMenuItem<String>(
                                    child: const Text('word 2'),
                                    value: "word 2"),
                                new PopupMenuItem<String>(
                                    child: const Text('word 3'),
                                    value: "word 3"),
                                new PopupMenuItem<String>(
                                    child: const Text('word 4'),
                                    value: "word 4"),
                              ]);
                        },
                        child: Text("add"))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("choose bool"),
                    ElevatedButton(
                        onPressed: () async {
                          check = await showMenu(
                              context: context,
                              position:
                                  RelativeRect.fromLTRB(150.0, 480.0, 0.0, 0.0),
                              items: <PopupMenuItem<bool>>[
                                new PopupMenuItem<bool>(
                                    child: const Text('True'), value: true),
                                new PopupMenuItem<bool>(
                                    child: const Text('False'), value: false),
                              ]);
                        },
                        child: Text("add")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
