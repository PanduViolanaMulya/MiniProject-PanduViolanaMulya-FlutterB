import 'package:flutter/material.dart';
import 'package:mini_project/model/result_model.dart';
import 'package:mini_project/model/soal/sd/sd_aljabar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mini_project/model/soal/sd/sd_geometri.dart';
import 'package:mini_project/model/result_db.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  final int number;
  final int id;

  const QuizPage({
    required this.number,
    required this.id,
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState(number: number, id: id);
}

class _QuizPageState extends State<QuizPage> {
  int number;
  int id;
  late final ResultDb manager;
  List quizList = [];
  List<int> resultDoneIndexList = [];
  List<ResultModel> resultList = [];

  _QuizPageState({
    required this.number,
    required this.id,
  });

  LinearGradient selectedAnswerColor =
      LinearGradient(colors: [Color.fromARGB(255, 215, 255, 96), Colors.white]);
  String isClicked = '';
  bool previousButton = true;

  void checkAnswer(String jawaban) {
    setState(() {
      isClicked = jawaban;
    });
    if (jawaban == aljabarSD[number].benar) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('GG')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Coba Lagi')));
    }
  }

  @override
  void initState() {
    if (id == 0) {
      setState(() {
        quizList = aljabarSD;
      });
    } else {
      setState(() {
        quizList = geometriSD;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SD/ Geometry'),
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
                    width: 70,
                    height: 30,
                    color: Colors.blue,
                    child: Text('<<<'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final quiz = ResultModel(
                        quizGrade: quizList[number].grade,
                        quizSubject: quizList[number].subject,
                        quizYourAnswer: isClicked,
                        quizCorrextAnswer: quizList[number].benar);
                    Provider.of<ResultDb>(context, listen: false)
                        .addResult(quiz);
                    resultList.add(quiz);

                    resultDoneIndexList.add(resultList.length);
                    print(resultDoneIndexList);

                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
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
                            child: ListView.builder(
                                itemBuilder: (context, index) {}),
                          )
                        ],
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 30,
                    color: Colors.orange,
                    child: Text(
                      'Finish',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (number != quizList.length - 1) {
                      final quiz = ResultModel(
                          quizGrade: quizList[number].grade,
                          quizSubject: quizList[number].subject,
                          quizYourAnswer: isClicked,
                          quizCorrextAnswer: quizList[number].benar);
                      Provider.of<ResultDb>(context, listen: false)
                          .addResult(quiz);
                      resultList.add(quiz);
                      resultDoneIndexList.add(resultList.length);
                      print(resultDoneIndexList);

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
                    width: 70,
                    height: 30,
                    color: Color.fromARGB(255, 33, 219, 243),
                    child: Text('>>>'),
                  ),
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
