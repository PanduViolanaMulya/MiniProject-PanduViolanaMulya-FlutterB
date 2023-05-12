import 'package:flutter/material.dart';
import 'package:mini_project/model/shop_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isBought = false;
  late SharedPreferences dbIndex;
  int point = 0;

  void initial() async {
    dbIndex = await SharedPreferences.getInstance();
    setState(() {
      dbIndex.getInt('points') == null
          ? point = 1000
          : point = dbIndex.getInt('points')!;
      dbIndex.setInt('points', point);
    });
  }

  @override
  void initState() {
    initial();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  Container(
                      height: 35,
                      width: 35,
                      child:
                          Image(image: AssetImage('assets/element_point.png'))),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${dbIndex.getInt('points')}')
                ],
              ),
            )
          ],
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(children: [
            Image(image: AssetImage('assets/screen_shop.gif')),
            GridView.builder(
                itemCount: shop.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(isBought);
                      !shop[index].isBought ? shopNav(index) : null;
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      color: shop[index].isBought
                          ? Colors.grey
                          : Color.fromARGB(255, 179, 237, 180),
                      child: Icon(shop[index].shopIcon),
                    ),
                  );
                })
          ]),
        ));
  }

  Future shopNav(int index) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => Container(
        child: ListView(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: CircleAvatar(
                child: Icon(shop[index].shopIcon),
                radius: 50,
                backgroundColor: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Text('Item Name'),
                      Text(': ${shop[index].shopItem}')
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Item Price'),
                      Text(': ${shop[index].shopPrice}')
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Item Description'),
                      Text(': ${shop[index].shopDescription}')
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          shop[index].isBought = true;
                          point = point - shop[index].shopPrice;
                        });
                        dbIndex.setInt('points', point);
                        Navigator.pop(context);
                      },
                      child: Text('Purchase')),
                  Text('Your Charge: 1000')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
