import 'package:flutter/material.dart';
import 'package:mini_project/model/shop_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isBought = false;

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
                  Icon(Icons.money),
                  SizedBox(
                    width: 10,
                  ),
                  Text('1000')
                ],
              ),
            )
          ],
        ),
        body: GridView.builder(
            itemCount: shop.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
            }));
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
                        });
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
