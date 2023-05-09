import 'package:flutter/material.dart';
import 'package:mini_project/model/shop_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mini_project/model/soal/sd/sd_aljabar.dart';
import 'package:mini_project/screen/achievement_page.dart';
import 'package:mini_project/screen/collection_page.dart';
import 'package:mini_project/screen/event_page.dart';
import 'package:mini_project/screen/shop_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Color.fromARGB(255, 243, 243, 243),
      child: ListView(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            height: 70,
            margin: EdgeInsets.only(left: 35, right: 35),
            alignment: Alignment.center,
            child: Text('Hello User!! Welcome To Sanshuumaru'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 223, 128),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Color.fromARGB(129, 34, 34, 238),
                  onTap: () {
                    print(' y${shop[0].isBought.toString()}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopPage(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 148, 196, 243),
                        borderRadius: BorderRadius.circular(10)),
                    width: 70,
                    height: 70,
                    child: Stack(
                      children: [
                        Image(image: AssetImage('assets/button_action.png')),
                        Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.shopping_cart_checkout)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollectionPage(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 247, 157, 157),
                        borderRadius: BorderRadius.circular(10)),
                    width: 70,
                    height: 70,
                    child: Stack(
                      children: [
                        Image(image: AssetImage('assets/button_action.png')),
                        Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.collections)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 157, 247, 174),
                        borderRadius: BorderRadius.circular(10)),
                    width: 70,
                    height: 70,
                    child: Stack(
                      children: [
                        Image(image: AssetImage('assets/button_action.png')),
                        Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.hourglass_bottom)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AchievementPage(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 247, 227, 168),
                        borderRadius: BorderRadius.circular(10)),
                    width: 70,
                    height: 70,
                    child: Stack(
                      children: [
                        Image(image: AssetImage('assets/button_action.png')),
                        Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.lock_open)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          CarouselSlider(items: [
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 255, 193, 7),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 154, 244, 161),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 127, 127, 240),
              ),
            ),
          ], options: CarouselOptions(autoPlay: true))
        ],
      ),
    );
  }
}
