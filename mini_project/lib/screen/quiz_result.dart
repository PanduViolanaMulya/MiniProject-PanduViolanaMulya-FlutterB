import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
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
        SizedBox(
          height: 20,
        ),
        Container(
          height: 500,
          width: 400,
          child: ListView.separated(
              itemCount: 1,
              separatorBuilder: (context, index) => SizedBox(
                    height: 70,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  child: Table(
                    children: [
                      TableRow(children: [Text('')])
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
