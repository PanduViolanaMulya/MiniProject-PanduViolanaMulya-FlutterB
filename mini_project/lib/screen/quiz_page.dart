import 'package:flutter/material.dart';
import 'package:mini_project/model/result_model.dart';
import 'package:mini_project/model/soal/sd/sd_aljabar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mini_project/model/soal/sd/sd_geometri.dart';
import 'package:mini_project/model/result_db.dart';
import 'package:mini_project/model/soal/sma/sma_aljabar.dart';
import 'package:mini_project/model/soal/sma/sma_geometri.dart';
import 'package:mini_project/model/soal/smp/smp_aljabar.dart';
import 'package:mini_project/model/soal/smp/smp_geometri.dart';
import 'package:mini_project/screen/quiz_result.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPage extends StatefulWidget {
  final int number;
  final String grade;
  final String subject;
  final int session;

  const QuizPage({
    required this.number,
    required this.grade,
    required this.subject,
    required this.session,
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState(
      number: number, grade: grade, subject: subject, session: session);
}

class _QuizPageState extends State<QuizPage> {
  int number;
  String grade;
  String subject;
  int session;
  late final ResultDb manager;
  List quizList = [];
  late ResultModel showResult;
  List<int> resultDoneIndexList = [];
  List<ResultModel> resultList = [];
  late SharedPreferences dbIndex;
  int point = 0;
  int dataIndex = 0;

  _QuizPageState({
    required this.number,
    required this.grade,
    required this.subject,
    required this.session,
  });

  LinearGradient selectedAnswerColor =
      LinearGradient(colors: [Color.fromARGB(255, 215, 255, 96), Colors.white]);
  String isClicked = '';
  bool previousButton = true;

  void checkAnswer(String jawaban) {
    setState(() {
      isClicked = jawaban;
    });
    if (jawaban == quizList[number].benar) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('GG')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Coba Lagi')));
    }
  }

  @override
  void initState() {
    resultList.clear();
    if (grade == 'SD' && subject == 'aljabar') {
      quizList = aljabarSD;
    } else if (grade == 'SD' && subject == 'geometri') {
      quizList = geometriSD;
    } else if (grade == 'SMP' && subject == 'aljabar') {
      quizList = aljabarSMP;
    } else if (grade == 'SMP' && subject == 'geometri') {
      quizList = geometriSMP;
    } else if (grade == 'SMA' && subject == 'aljabar') {
      quizList = aljabarSMA;
    } else {
      quizList = geometriSMA;
    }

    initial();
    super.initState();
  }

  void initial() async {
    dbIndex = await SharedPreferences.getInstance();

    setState(() {
      dbIndex.getInt('dbIndex') == null
          ? dataIndex = 0
          : dataIndex = dbIndex.getInt('dbIndex')!;
      dbIndex.getInt('points') == null
          ? point = 0
          : point = dbIndex.getInt('points')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$grade / $subject'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            height: 280,
            width: double.maxFinite,
            child: Text(
              quizList[number].soal,
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(214, 162, 223, 255)),
          ),
          Container(
            // color: Colors.yellow,
            margin: EdgeInsets.all(30),
            height: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        checkAnswer('a');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 95,
                        width: 170,
                        child: Text(quizList[number].jawabA),
                        decoration: BoxDecoration(
                            gradient:
                                isClicked == 'a' ? selectedAnswerColor : null,
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(213, 231, 111, 255)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        checkAnswer('b');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 95,
                        width: 170,
                        child: Text(quizList[number].jawabB),
                        decoration: BoxDecoration(
                            gradient:
                                isClicked == 'b' ? selectedAnswerColor : null,
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(212, 148, 245, 144)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        checkAnswer('c');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 95,
                        width: 170,
                        child: Text(quizList[number].jawabC),
                        decoration: BoxDecoration(
                            gradient:
                                isClicked == 'c' ? selectedAnswerColor : null,
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(212, 246, 252, 178)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(dataIndex);
                        checkAnswer('d');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 95,
                        width: 170,
                        child: Text(quizList[number].jawabD),
                        decoration: BoxDecoration(
                            gradient:
                                isClicked == 'd' ? selectedAnswerColor : null,
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(211, 245, 144, 144)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print(dataIndex);
                    if (number != 0) {
                      setState(() {
                        number = number - 1;
                        isClicked = '';
                      });
                    }
                    ;
                  },
                  child: Container(
                      alignment: Alignment.center,
                      // width: 70,
                      height: 50,
                      // color: Colors.blue,
                      child: Image(
                        image: AssetImage('assets/button_previous.png'),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    point = dbIndex.getInt('points')!;
                    dbIndex.setInt('dbIndex', dataIndex);

                    setState(() {
                      dataIndex = dbIndex.getInt('dbIndex')!;
                    });
                    int thisPoint = 0;
                    if (isClicked == quizList[number].benar) {
                      thisPoint = 20;
                    }

                    final quiz = ResultModel(
                      session: session,
                      quizNumber: number + 1,
                      quizGrade: quizList[number].grade,
                      quizSubject: quizList[number].subject,
                      quizYourAnswer: isClicked,
                      quizCorrextAnswer: quizList[number].benar,
                      id: dataIndex,
                      quizPoint: thisPoint,
                    );
                    Provider.of<ResultDb>(context, listen: false)
                        .addResult(quiz);

                    setState(() {
                      dataIndex = dataIndex + 1;
                    });

                    dbIndex.setInt('dbIndex', dataIndex);
                    point = point + thisPoint;
                    dbIndex.setInt('points', point);

                    dbIndex.setInt('resultSession 0', resultList.length);
                    resultList.add(quiz);

                    showDialog(
                        context: context,
                        builder: (context) {
                          return Consumer<ResultDb>(
                            builder: (context, manager, child) {
                              final resultItems = manager.resultModel;
                              for (int j = 0; j < resultList.length; j++) {
                                int k = j;
                                for (int i = 0; i < resultItems.length; i++) {
                                  if (resultItems[i].session == session) {
                                    if (j == 0) {
                                      resultList[j] = resultItems[i];
                                      break;
                                    } else {
                                      for (k = 0; k == j; k++) {
                                        resultList[k] == resultItems[i]
                                            ? null
                                            : resultList[j] = resultItems[i];
                                      }
                                      break;
                                    }
                                  }
                                }
                              }
                              return QuizResult(resultList: resultList);
                            },
                          );
                        });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 50,
                    child: Stack(
                      children: [
                        Image(image: AssetImage('assets/button_finish.png')),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 90,
                            alignment: Alignment.center,
                            child: Text(
                              'Finish',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (number != quizList.length - 1) {
                      dbIndex.setInt('dbIndex', dataIndex);

                      dataIndex = dbIndex.getInt('dbIndex')!.toInt();
                      point = dbIndex.getInt('points')!;
                      int thisPoint = 0;
                      if (isClicked == quizList[number].benar) {
                        thisPoint = 20;
                      }

                      final quiz = ResultModel(
                        quizNumber: number + 1,
                        session: session,
                        quizGrade: quizList[number].grade,
                        quizSubject: quizList[number].subject,
                        quizYourAnswer: isClicked,
                        quizCorrextAnswer: quizList[number].benar,
                        id: dataIndex,
                        quizPoint: thisPoint,
                      );
                      Provider.of<ResultDb>(context, listen: false)
                          .addResult(quiz);

                      resultList.add(quiz);
                      setState(() {
                        dataIndex = dataIndex + 1;
                      });
                      dbIndex.setInt('dbIndex', dataIndex);
                      point = point + thisPoint;
                      dbIndex.setInt('points', point);

                      resultDoneIndexList.add(resultList.length);
                      setState(() {
                        quizList[number + 1].available = true;

                        number = number + 1;
                        isClicked = '';
                      });
                    }
                    ;
                  },
                  child: Container(
                      alignment: Alignment.center,
                      // width: 70,
                      height: 50,
                      // color: Color.fromARGB(255, 33, 219, 243),
                      child: Image(
                        image: AssetImage('assets/button_next.png'),
                      )),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
        ],
      ),
    );
  }
}
