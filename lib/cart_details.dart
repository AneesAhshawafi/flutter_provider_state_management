import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/cart.dart';
import 'Model/item.dart';

class CartDetails extends StatefulWidget {
  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    // var cart = Provider.of<Cart>(context);
    var cart = context.watch<Cart>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(2),
            child: Text(context.watch<Cart>().totalPrice.toStringAsFixed(2)),
          ),
          Padding(
            padding: EdgeInsets.all(5),
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
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(cart.items[index].name),
              subtitle: Text("\$${cart.items[index].price.toStringAsFixed(2)}"),
              trailing: IconButton(
                onPressed: () {
                  context.read<Cart>().delete(index);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class _CartDetailsState extends State<CartDetails> {
//   @override
//   Widget build(BuildContext context) {
//     var cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text("Cart Details"), backgroundColor: Colors.blue),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           Text(
//             "Total Price: \$${cart.totalPrice.toStringAsFixed(2)}",
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.items.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(cart.items[index].name),
//                   subtitle: Text(
//                     "\$${cart.items[index].price.toStringAsFixed(2)}",
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
