import 'package:flutter/material.dart';
import 'package:mini_project/model/result_db.dart';
import 'package:mini_project/model/soal/sd/sd_aljabar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/model/soal/sma/sma_aljabar.dart';
import 'package:mini_project/model/soal/sma/sma_geometri.dart';
import 'package:mini_project/model/soal/smp/smp_aljabar.dart';
import 'package:mini_project/model/soal/smp/smp_geometri.dart';
import 'package:mini_project/screen/quiz_page.dart';
import 'package:random_string/random_string.dart';
import 'package:mini_project/model/soal/sd/sd_geometri.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListSoal extends StatefulWidget {
  final String grade;
  const ListSoal({required this.grade, super.key});

  @override
  State<ListSoal> createState() => _ListSoalState(grade: grade);
}

class _ListSoalState extends State<ListSoal> {
  String bidang = 'aljabar';
  List soalList = [];
  String grade;
  late SharedPreferences dbIndex;
  int sessionId = 0;
  late final ResultDb manager;

  _ListSoalState({required this.grade});

  @override
  void initState() {
    initial();

    if (grade == 'SD') {
      soalList = aljabarSD;
    } else if (grade == 'SMP') {
      soalList = aljabarSMP;
    } else {
      soalList = aljabarSMA;
    }
    super.initState();
  }

  void initial() async {
    dbIndex = await SharedPreferences.getInstance();

    setState(() {
      dbIndex.getInt('dbSession') == null
          ? sessionId = 0
          : sessionId = dbIndex.getInt('dbSession')!;
    });
  }

  void listChecker() {
    if (grade == 'SD' && bidang == 'aljabar') {
      setState(() {
        soalList = aljabarSD;
      });
    } else if (grade == 'SD' && bidang == 'geometri') {
      setState(() {
        soalList = geometriSD;
      });
    } else if (grade == 'SMP' && bidang == 'aljabar') {
      setState(() {
        soalList = aljabarSMP;
      });
    } else if (grade == 'SMP' && bidang == 'geometri') {
      setState(() {
        soalList = geometriSMP;
      });
    } else if (grade == 'SMA' && bidang == 'aljabar') {
      setState(() {
        soalList = aljabarSMA;
      });
    } else {
      setState(() {
        soalList = geometriSMA;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(grade),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Image(image: AssetImage('assets/screen_list_soal.gif')),
              Column(children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bidang = 'aljabar';
                          });
                          listChecker();
                          print(grade);
                          print(bidang);
                          print(soalList);
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          child: Text(
                            'Aljabar',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bidang == 'aljabar'
                                  ? Color.fromARGB(255, 184, 55, 46)
                                  : Color.fromARGB(255, 255, 156, 148)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bidang = 'geometri';
                          });
                          listChecker();
                          print(grade);
                          print(bidang);
                          // print(manager.resultModel.length);
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          child: Text(
                            'Geometri',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bidang == 'geometri'
                                  ? Color.fromARGB(255, 184, 55, 46)
                                  : Color.fromARGB(255, 255, 156, 148)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: soalList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            listChecker();
                            print(soalList[index].available);
                            print(soalList[index].subject);
                            print(soalList[index].grade);
                            if (soalList[index].available == true) {
                              print('session: $sessionId');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizPage(
                                      number: index,
                                      grade: grade,
                                      subject: soalList[index].subject,
                                      session: sessionId,
                                    ),
                                  ));
                              setState(() {
                                sessionId = sessionId + 1;
                              });

                              dbIndex.setInt('dbSession', sessionId);
                            }
                          },
                          child: Stack(
                            children: [
                              soalList[index].available == true
                                  ? Image(
                                      image:
                                          soalList[index].subject == 'aljabar'
                                              ? AssetImage(
                                                  'assets/button_aljabar.png')
                                              : AssetImage(
                                                  'assets/button_geometri.png'))
                                  : Image(
                                      image: AssetImage(
                                          'assets/button_unavailable.png')),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16),
                                ),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    // color:
                                    // bidang == 'aljabar'
                                    //     ? (soalList[index].available
                                    //         ? Colors.green
                                    //         : Colors.grey)
                                    //     : (soalList[index].available
                                    //         ? Colors.blue
                                    //         : Colors.grey),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ]),
            ],
          ),
        ));
  }
}
