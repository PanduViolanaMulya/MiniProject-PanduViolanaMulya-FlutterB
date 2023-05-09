import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/model/result_db.dart';

class HistoryPageBuilder extends StatelessWidget {
  final ResultDb manager;
  const HistoryPageBuilder({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ResultDb>(
          builder: (context, value, child) {
            final resultItem = manager.resultModel;
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: resultItem.length,
                itemBuilder: (context, index) {
                  final item = resultItem[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          children: [
                            Text(
                              'Your Result',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ListView.separated(
                                itemBuilder: itemBuilder,
                                separatorBuilder: separatorBuilder,
                                itemCount: itemCount),
                            SizedBox(
                              height: 30,
                            ),
                            Text('Total Attempt'),
                            Text('Total Points'),
                            Text('Total Result'),
                            Text('Comment'),
                          ],
                        ),
                      );
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
                          Text('No. $index'),
                          SizedBox(
                            width: 70,
                          ),
                          Text('Subject: ${item.quizGrade}/${item.quizSubject}')
                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
