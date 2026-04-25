import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}
// // Lesson1: Provider is a state management solution in Flutter that allows you to manage and share state across your application efficiently. It is built on top of the InheritedWidget and provides a simple and reactive way to access and update state.
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Model(),
//       child:
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:  Scaffold(
//           body: Center(
//             child: Consumer<Model>(builder:(context, model, child){
//               return ListView(
//               children: [
//                 SizedBox(height: 100,),
//                 Text(model.text),
//                 ElevatedButton(
//                   onPressed: () {
//                     model.changeName();
//                   },
//                   child: const Text('Press Me'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//             })
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Model extends ChangeNotifier {
//   String text = 'Hello World';
//   changeName(){
//     text = 'Hello Flutter';
//     notifyListeners();

//   }
// }
// // Lesson 2 and 3
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProvOne(),
//       child:
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:  Scaffold(
//           body: Center(
//             child: Consumer<ProvOne>(builder:(context, model, child){
//               return ListView(
//               children:
//                <Widget>[
//                 Consumer<ProvOne>(builder:   (context, provOne, child){
//                   print("Text1 is building");
//                   return Text(provOne.showSomething);
//                 }),
//                 Consumer<ProvOne>(builder: (context,provOne,child){
//                   print("Text2 is building");
//                   return Text(provOne.showSomething2);
//                 }),
//                 Consumer<ProvOne>(builder: (context,provOne,child){
//                   print("Consumerbutton is building");
//                   return ElevatedButton(onPressed:(){
//                     provOne.dosomething();
//                   },child: Text("Do Something : "+ provOne.showSomething));
//                 }),
//                 Consumer<ProvOne>(builder: (context,provOne,child){
//                   print("Consumerbutton is building");
//                   return ElevatedButton(onPressed:(){
//                     provOne.dosomething2();
//                   },child: Text("Do Something : "+ provOne.showSomething2));
//                 }),
//                ],

//             );
//             })
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProvOne extends ChangeNotifier {
//   String showSomething = 'show something';
//   String showSomething2 = 'show something 2';

//   dosomething(){
//     showSomething = "yes provider is working";
//     notifyListeners();
//   }
//   dosomething2(){
//     showSomething2 = "yes provider2 is working";
//     notifyListeners();
//   }
// }

// // lesson 4 : Selector is a widget provided by the Provider package in Flutter that allows you to listen to specific parts of the state and rebuild only when those parts change.
// //It is used to optimize performance by preventing unnecessary rebuilds of widgets that depend on the state.
// //Selector takes a selector function that extracts the desired part of the state and a builder function that builds the widget based on that extracted value.
// // When the selected part of the state changes, only the widgets that depend on it will be rebuilt, improving efficiency in your Flutter application.
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProvOne(),
//       child:
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:  Scaffold(
//           body:
//               ListView(
//               children:
//                <Widget>[
//                 Selector<ProvOne,String>(
//                   selector: (context,provSelector1) => provSelector1.showone,
//                   builder:   (context, provOne, child){
//                   print("Selector1 is building");
//                   return Text(provOne);
//                 }),
//                 Selector<ProvOne,String>(
//                   selector: (context,provselector2) => provselector2.showtow,
//                   builder: (context,provOne,child){
//                   print("Selector2 is building");
//                   return Text(provOne);
//                 }),
//                 Consumer<ProvOne>(builder: (context,provOne,child){
//                   // print("Consumerbutton is building");
//                   return ElevatedButton(onPressed:(){
//                     provOne.dosomething();
//                   },child: Text("Do Something : "+ provOne.showSomething));
//                 }),
//                 Consumer<ProvOne>(builder: (context,provOne,child){
//                   // print("Consumerbutton is building");
//                   return ElevatedButton(onPressed:(){
//                     provOne.dosomething2();
//                   },child: Text("Do Something : "+ provOne.showSomething2));
//                 }),
//                ],

//             )
//           ),
//         ),
//       );

//   }
// }

// class ProvOne extends ChangeNotifier {
//   String showSomething = 'show something';
//   String showSomething2 = 'show something 2';
// get showone => showSomething;
// get showtow => showSomething2;

//   dosomething(){
//     showSomething = "yes provider is working";
//     notifyListeners();
//   }
//   dosomething2(){
//     showSomething2 = "yes provider2 is working";
//     notifyListeners();
//   }
// }

//lesson 5 : Provider.of is a method provided by the Provider package in Flutter that allows you to access the nearest instance of a provider in the widget tree.
//It is used to retrieve the current value of a provider and listen for changes to that value.
//When you call Provider.of<T>(context), it looks up the widget tree for the nearest ancestor that provides an instance of type T and returns it.
//If no such provider is found, it throws an error.
//This method is commonly used to access the state or functionality provided by a provider within a widget.
class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100),

            ChangeNotifierProvider(
              create: (context) => Model(),
              child: Center(child: Text("Hello, Provider!")),
            ),
            SizedBox(height: 20),
            // //Consumer widget must be used inside the provider widget
            // Consumer<Model>(
            //   builder: (context, model, child) {
            //     return Text(model.text);
            //   },
            // ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String text = 'Hello World';
  changeName() {
    text = 'Hello Flutter';
    notifyListeners();
  }
}
