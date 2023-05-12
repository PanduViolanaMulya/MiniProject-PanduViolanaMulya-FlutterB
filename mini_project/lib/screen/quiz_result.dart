import 'package:flutter/material.dart';

import 'package:mini_project/model/result_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_page.dart';

import '../model/result_db.dart';

class QuizResult extends StatefulWidget {
  final List<ResultModel> resultList;
  const QuizResult({super.key, required this.resultList});

  @override
  State<QuizResult> createState() => _QuizResultState(resultList: resultList);
}

class _QuizResultState extends State<QuizResult> {
  List<ResultModel> resultList;
  late SharedPreferences dbIndex;
  int session = 0;
  int totalPoint = 0;

  _QuizResultState({required this.resultList});

  @override
  void initState() {
    for (int pointIndex = 0; pointIndex < resultList.length; pointIndex++) {
      setState(() {
        totalPoint = totalPoint + resultList[pointIndex].quizPoint;
      });
    }
    ;

    // totalPoint = resultList[0].quizPoint;
    initial();
    // TODO: implement initState
    super.initState();
  }

  void initial() async {
    dbIndex = await SharedPreferences.getInstance();

    setState(() {
      session = dbIndex.getInt('dbSession')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text('Your Result'),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 500,
            width: 400,
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 30,
                    ),
                itemCount: resultList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text('No'),
                          Text(': ${resultList[index].quizNumber}'),
                        ]),
                        TableRow(children: [
                          Text('Grade'),
                          Text(': ${resultList[index].quizGrade}'),
                        ]),
                        TableRow(children: [
                          Text('Subject'),
                          Text(': ${resultList[index].quizSubject}'),
                        ]),
                        TableRow(children: [
                          Text('Your Answer'),
                          Text(': ${resultList[index].quizYourAnswer}'),
                        ]),
                        TableRow(children: [
                          Text('Correct Answer'),
                          Text(': ${resultList[index].quizCorrextAnswer}'),
                        ]),
                        TableRow(children: [
                          Text('Points'),
                          Text(': ${resultList[index].quizPoint}'),
                        ]),
                      ],
                    ),
                  );
                })
            //   },
            // ),
            ),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Table(
            children: [
              TableRow(children: [
                Text('Total Attempt'),
                Text(': ${resultList.length}'),
              ]),
              TableRow(children: [
                Text('Total Points'),
                Text(': $totalPoint'),
              ]),
              TableRow(children: [
                Text('Result'),
                Text(': ${((totalPoint / 20) / resultList.length) * 100}/100'),
              ]),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                resultList.clear();
                print('resultlength: ${resultList.length}');
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Close')),
        )
      ],
    );
  }
}
