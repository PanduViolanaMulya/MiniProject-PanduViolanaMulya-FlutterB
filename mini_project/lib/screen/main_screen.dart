import 'package:flutter/material.dart';
import 'package:mini_project/screen/history_page.dart';
import 'package:mini_project/screen/history_page_builder.dart';
import 'sd_list_soal.dart';
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
  int dropDownValue = 0;
  var pageBody;

  void _onSelectedItem(int index) {
    setState(() {
      _bottomNavigatorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanshuumaru'),
        centerTitle: true,
      ),
      body: body(),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              color: Colors.amber,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
                color: Colors.cyan,
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SdListSoal(),
                        ));
                  },
                  splashColor: Color.fromARGB(104, 33, 33, 33),
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text('SD')),
                )),
            Card(
                color: Colors.cyan,
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(104, 33, 33, 33),
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text('SMP')),
                )),
            Card(
                color: Colors.cyan,
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(104, 33, 33, 33),
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text('SMA')),
                )),
            Card(
                color: Colors.cyan,
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
                      child: Text('History')),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: _bottomNavigatorIndex,
        selectedItemColor: Colors.blue,
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
