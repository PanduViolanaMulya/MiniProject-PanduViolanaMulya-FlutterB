import 'package:flutter/material.dart';
import 'package:mini_project/model/shop_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Collections'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: shop.length,
        itemBuilder: ((context, index) {
          return shop[index].isBought
              ? Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 215, 237, 149)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(shop[index].shopIcon),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${shop[index].shopItem}'),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
              : Container();
        }),
      ),
    );
  }
}
