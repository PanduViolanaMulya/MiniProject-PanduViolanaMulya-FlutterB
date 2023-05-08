import 'package:flutter/material.dart';
import 'package:mini_project/model/soal/sd/sd_aljabar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mini_project/screen/quiz_page.dart';
import 'package:mini_project/model/soal/sd/sd_geometri.dart';

class SdListSoal extends StatefulWidget {
  const SdListSoal({super.key});

  @override
  State<SdListSoal> createState() => _SdListSoalState();
}

class _SdListSoalState extends State<SdListSoal> {
  int sdBidang = 0;
  List soalList = [];

  void listChecker() {
    if (sdBidang == 0) {
      setState(() {
        soalList = aljabarSD;
      });
    } else {
      setState(() {
        soalList = geometriSD;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SD'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      sdBidang = 0;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'Aljabar',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: sdBidang == 0
                            ? Color.fromARGB(255, 184, 55, 46)
                            : Color.fromARGB(255, 255, 156, 148)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      sdBidang = 1;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'Geometri',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: sdBidang == 1
                            ? Color.fromARGB(255, 184, 55, 46)
                            : Color.fromARGB(255, 255, 156, 148)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: sdBidang == 0 ? aljabarSD.length : geometriSD.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      listChecker();
                      print(soalList[index].available);
                      if (soalList[index].available == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(
                                number: index,
                                id: sdBidang,
                              ),
                            ));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: sdBidang == 0
                              ? (aljabarSD[index].available
                                  ? Colors.green
                                  : Colors.grey)
                              : (geometriSD[index].available
                                  ? Colors.blue
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                }),
          )
        ]));
  }
}
