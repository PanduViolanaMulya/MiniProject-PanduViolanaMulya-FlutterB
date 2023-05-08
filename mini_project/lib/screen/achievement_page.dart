import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/model/achievement_model.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key});

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Achievement'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: achievementModel.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.all(20),
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 198, 198, 198)),
              child: Row(
                children: [
                  Icon(achievementModel[index].achIcon),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(10),
                      child: Table(
                        children: [
                          TableRow(children: [
                            Text(achievementModel[index].achReached),
                            Text(
                              '${achievementModel[index].progress} / ${achievementModel[index].target}',
                              textAlign: TextAlign.end,
                            )
                          ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
