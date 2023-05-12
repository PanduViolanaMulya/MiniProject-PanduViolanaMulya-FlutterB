import 'package:flutter/material.dart';
import 'package:mini_project/screen/history_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list_soal.dart';
import 'package:mini_project/screen/home_page.dart';
import 'package:mini_project/screen/account_page.dart';
import 'package:mini_project/model/result_db.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavigatorIndex = 0;
  var pageBody;
  int point = 1000;
  int session = 0;
  late SharedPreferences dbIndex;

  void initial() async {
    dbIndex = await SharedPreferences.getInstance();
    setState(() {
      dbIndex.getInt('points') == null
          ? point = 1000
          : point = dbIndex.getInt('points')!;
      dbIndex.setInt('points', point);
      dbIndex.getInt('dbSession') == null
          ? session = 0
          : session = dbIndex.getInt('dbSession')!;
      dbIndex.setInt('dbSession', session);
    });
  }

  @override
  void initState() {
    initial();
    // TODO: implement initState
    super.initState();
  }

  void _onSelectedItem(int index) {
    setState(() {
      _bottomNavigatorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sansuumaru'),
        centerTitle: true,
      ),
      body: body(),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              width: double.maxFinite,
              color: Color.fromARGB(0, 236, 236, 236),
              child: ListView(
                children: [
                  Table(
                    children: [
                      TableRow(children: [
                        Text('My Qoints'),
                        Text(': ${dbIndex.getInt('points')}'),
                      ]),
                      TableRow(children: [
                        Text('My Session'),
                        Text(': ${dbIndex.getInt('dbSession')}'),
                      ]),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color.fromARGB(255, 96, 81, 170),
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListSoal(
                        grade: 'SD',
                      ),
                    ),
                  );
                },
                splashColor: Color.fromARGB(104, 33, 33, 33),
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text(
                      'SD',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 96, 81, 170),
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListSoal(
                        grade: 'SMP',
                      ),
                    ),
                  );
                },
                splashColor: Color.fromARGB(104, 33, 33, 33),
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text('SMP', style: TextStyle(color: Colors.white))),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 96, 81, 170),
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListSoal(
                        grade: 'SMA',
                      ),
                    ),
                  );
                },
                splashColor: Color.fromARGB(104, 33, 33, 33),
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text('SMA', style: TextStyle(color: Colors.white))),
              ),
            ),
            Card(
                color: Color.fromARGB(255, 96, 81, 170),
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ));
                  },
                  splashColor: Color.fromARGB(104, 33, 33, 33),
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text('History',
                          style: TextStyle(color: Colors.white))),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: _bottomNavigatorIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        onTap: _onSelectedItem,
      ),
    );
  }

  Widget body() {
    if (_bottomNavigatorIndex == 0) {
      return Home();
    } else {
      return Account();
    }
  }
}
