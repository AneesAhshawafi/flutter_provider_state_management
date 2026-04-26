import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/cart.dart';
import 'Model/item.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "Samsung S21 Ultra", price: 1199.99),
    Item(name: "iPhone 12", price: 999.99),
    Item(name: "Xiaomi Mi 11", price: 800.99),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
          Padding(padding:  EdgeInsets.all(2),child: Text(context.watch<Cart>().totalPrice.toStringAsFixed(2)),),
          Padding(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                context.watch<Cart>().itemCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text("\$${items[index].price.toStringAsFixed(2)}"),
              trailing: IconButton(icon: Icon(Icons.add), onPressed: () {
                context.read<Cart>().addItem(items[index]);
              }),
            ),
          );
        },
      ),
    );
  }
}
