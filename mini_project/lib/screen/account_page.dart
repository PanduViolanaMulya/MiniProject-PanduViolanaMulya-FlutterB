import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/model/achievement_model.dart';
import 'package:mini_project/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late SharedPreferences loginData;
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
    });
  }

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
                  child: Image(image: AssetImage('assets/profile.png')),
                  backgroundColor: Color.fromARGB(255, 110, 181, 240),
                ),
                SizedBox(
                  height: 10,
                ),
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
                    Text(': $username'),
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
          Container(
              height: 200,
              width: 200,
              child: Image(image: AssetImage('assets/bubble_ornaments.png'))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  loginData.setBool('login', true);
                  loginData.remove('username');
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 3),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.elasticIn);
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                            alignment: Alignment.center,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return LoginScreen();
                        }),
                  );
                },
                child: Text('Logout')),
          )
        ],
      ),
    );
  }
}
