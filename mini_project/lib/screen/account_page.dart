import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/model/achievement_model.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: ListView(
        children: [
          Container(
            // color: Colors.amber,
            width: double.maxFinite,
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                ),
                CircleAvatar(
                  radius: 70,
                  child: Text(':v'),
                  backgroundColor: Color.fromARGB(255, 110, 181, 240),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   width: 160,
                //   height: 20,
                //   decoration: BoxDecoration(
                //       color: Colors.cyan,
                //       borderRadius: BorderRadius.circular(20)),
                // )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text('Name'),
                    Text(': Pandu'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Level'),
                    Text(': ${achievementModel.length}'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
