import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/model/result_db.dart';
import 'package:mini_project/screen/quiz_result.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/model/result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late SharedPreferences dbIndex;
  List<ResultModel> historyList = [];
  List<ResultModel> resultHistory = [];
  int session = 0;
  int historyLength = 0;

  @override
  void initState() {
    initial();
    // TODO: implement initState
    super.initState();
  }

  void initial() async {
    dbIndex = await SharedPreferences.getInstance();

    setState(() {
      dbIndex.getInt('dbSession') == null
          ? session = 0
          : session = dbIndex.getInt('dbSession')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Quiz History'),
      ),
      body: Stack(children: [
        Image(image: AssetImage('assets/screen_history.gif')),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer<ResultDb>(
              builder: (context, manager, child) {
                final resultItem = manager.resultModel;

                for (int i = 0; i < session; i++) {
                  if (i == 0) {
                    historyList.add(resultItem[0]);
                    continue;
                  }
                  ;
                  for (int j = 0; j < resultItem.length; j++) {
                    if (resultItem[j].session == i + 1) {
                      historyList.add(resultItem[j]);
                      break;
                    }
                  }
                }
                for (int i = 0; i < session; i++) {
                  if (i == 0) {
                    resultHistory.add(resultItem[0]);
                    continue;
                  }
                  ;
                  for (int j = 0; j < resultItem.length; j++) {
                    if (resultItem[j].session == i + 1) {
                      resultHistory.add(resultItem[j]);
                      break;
                    }
                  }
                }

                // print(session);
                // print(resultList.length);

                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: session,
                    itemBuilder: (context, index) {
                      final item = historyList[index];
                      return GestureDetector(
                        onTap: () {
                          print('index: $index');
                          historyLength = 0;
                          for (int i = 0; i < resultItem.length; i++) {
                            if (resultItem[i].session == index) {
                              historyLength = historyLength + 1;
                              print('historylength= $historyLength at $i');
                            }
                          }
                          print('historylength= $historyLength');

                          resultHistory.clear();
                          resultHistory.add(resultItem[index]);
                          print(resultHistory.length);

                          // for (int j = 0; j < historyList.length; j++) {
                          //   int k = j;
                          //   for (int i = 0; i < resultItem.length; i++) {
                          //     if (resultItem[i].session == index) {
                          //       if (j == 0) {
                          //         resultList[j] = resultItem[i];
                          //         break;
                          //       } else {
                          //         for (k = 0; k == j; k++) {
                          //           resultList[k] == resultItem[i]
                          //               ? null
                          //               : resultList[j] = resultItem[i];
                          //         }
                          //         break;
                          //       }
                          //     }
                          //   }
                          // }
                          showDialog(
                              context: context,
                              builder: (context) => QuizResult(
                                    resultList: resultHistory,
                                  ));
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          height: 70,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber),
                          child: Row(
                            children: [
                              Text('No. ${index + 1}'),
                              SizedBox(
                                width: 70,
                              ),
                              Text(
                                  'Subject: ${item.quizGrade}/${item.quizSubject}')
                            ],
                          ),
                        ),
                      );
                    });
              },
            ))
      ]),
    );
  }

  // Widget buildHistoryScreen() {
  //   return Consumer<ResultDb>(
  //     builder: (context, manager, child) {
  //       return HistoryPageBuilder(
  //         manager: manager,
  //         session: session,
  //       );
  //     },
  //   );
  // }
}
