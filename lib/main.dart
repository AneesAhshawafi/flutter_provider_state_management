import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgetchild.dart';
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

// //lesson 5 : Provider.of is a method provided by the Provider package in Flutter that allows you to access the nearest instance of a provider in the widget tree.
// //It is used to retrieve the current value of a provider and listen for changes to that value.
// //When you call Provider.of<T>(context), it looks up the widget tree for the nearest ancestor that provides an instance of type T and returns it.
// //If no such provider is found, it throws an error.
// //This method is commonly used to access the state or functionality provided by a provider within a widget.
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           children: [
//             SizedBox(height: 100),

//             ChangeNotifierProvider(
//               create: (context) => Model(),
//               child: Center(child: Text("Hello, Provider!")),
//             ),
//             SizedBox(height: 20),
//             // //Consumer widget must be used inside the provider widget
//             // Consumer<Model>(
//             //   builder: (context, model, child) {
//             //     return Text(model.text);
//             //   },
//             // ),
//             MaterialButton(
//               color: Colors.blue,
//               textColor: Colors.white,
//               onPressed: () {},
//               child: Text("Press Me"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Model extends ChangeNotifier {
//   String text = 'Hello World';
//   changeName() {
//     text = 'Hello Flutter';
//     notifyListeners();
//   }
// }

// // Lesson 5 (scope providers),6(Provider.of(context))  , 7(context.watch() and context.read()): 
////scope providers are a way to limit the visibility of a provider to a specific part of the widget tree. This is useful when you want to provide different instances of a provider for different sections of your app or when you want to avoid unnecessary rebuilds of widgets that do not depend on a particular provider.
// // By using scope providers, you can ensure that only the widgets that need access to a specific provider will rebuild when that provider's state changes, improving the performance of your Flutter application.
// // Provider.of(context) is a method provided by the Provider package in Flutter that allows you to access the nearest instance of a provider in the widget tree. It is used to retrieve the current value of a provider and listen for changes to that value. When you call Provider.of<T>(context), it looks up the widget tree for the nearest ancestor that provides an instance of type T and returns it. If no such provider is found, it throws an error. This method is commonly used to access the state or functionality provided by a provider within a widget.
// // context.watch() and context.read() are methods provided by the Provider package in Flutter that
// // allow you to access the nearest instance of a provider in the widget tree. context.watch() is used to listen for changes to the provider's value and rebuild the widget when it changes, while context.read() is used to access the provider's value without listening for changes. When you call context.watch<T>(), it looks up the widget tree for the nearest ancestor that provides an instance of type T and returns it, and rebuilds the widget whenever that value changes. When you call context.read<T>(), it also looks up the widget tree for the nearest ancestor that provides an instance of type T and returns it, but does not rebuild the widget when that value changes. These methods are commonly used to access the state or functionality provided by a provider within a widget, with context.watch() being used when you want to react to changes in the provider's value, and context.read() being used when you only need to access the value without reacting to changes.
//Provider.of is a method provided by the Provider package in Flutter that allows you to access the nearest instance of a provider in the widget tree.
// // It is used to retrieve the current value of a provider and listen for changes to that value.
// // When you call Provider.of<T>(context), it looks up the widget tree for the nearest ancestor that provides an instance of type T and returns it.
// // If no such provider is found, it throws an error.
// // This method is commonly used to access the state or functionality provided by a provider within a widget.
// // 
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     // var model = Provider.of<Model>(context);
//     return ChangeNotifierProvider(create:   (context) => Model(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: WidgetChild(),
//       ),
//     ),);
//   }
// }

// // Lesson 8 : Provider vs ChangeNotifierProvider :
// // Provider is a more general-purpose widget that can be used to provide any type of value, while ChangeNotifierProvider is specifically designed to work with ChangeNotifier classes. 
// //ChangeNotifierProvider automatically listens for changes in the provided ChangeNotifier and rebuilds the dependent widgets when a change occurs, while Provider does not have this built-in functionality and requires manual handling of state changes. 
// //In summary, ChangeNotifierProvider is a convenient wrapper around Provider that simplifies the process of working with ChangeNotifier classes and provides automatic updates to dependent widgets when the state changes.
// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<MyModel>(
//       create: (context) => MyModel(),
//       child:
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:  Scaffold(
//           body:
//               ListView(
//               children:
//                <Widget>[
//                 Consumer<MyModel>(
//                   builder:   (context, myModel, child){
//                   print("Selector1 is building");
//                   return Text(myModel.showSomething);
//                 }),
//                 Consumer<MyModel>(
//                   builder: (context,myModel,child){
//                   print("Selector2 is building");
//                   return Text(myModel.showSomething2);
//                 }),
//                 Consumer<MyModel>(builder: (context,myModel,child){
//                   // print("Consumerbutton is building");
//                   return ElevatedButton(onPressed:(){
//                   print(myModel.showSomething);
//                     myModel.dosomething();
//                   },child: Text("Do Something : "+ myModel.showSomething));
//                 }),
//                 Consumer<MyModel>(builder: (context,myModel,child){
//                   // print("Consumerbutton is building");
//                   return ElevatedButton(onPressed:(){
//                   print(  myModel.showSomething2);
//                     myModel.dosomething2();
//                   },child: Text("Do Something : "+ myModel.showSomething2));
//                 }),
//                ],

//             )
//           ),
//         ),
//       );

//   }
// }

// class MyModel extends ChangeNotifier {
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



class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyModel()),

      ],
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          body:
              ListView(
              children:
               <Widget>[
                Consumer<MyModel>(
                  builder:   (context, myModel, child){
                  print("Selector1 is building");
                  return Text(myModel.showSomething);
                }),
                Consumer<MyModel>(
                  builder: (context,myModel,child){
                  print("Selector2 is building");
                  return Text(myModel.showSomething2);
                }),
                Consumer<MyModel>(builder: (context,myModel,child){
                  // print("Consumerbutton is building");
                  return ElevatedButton(onPressed:(){
                  print(myModel.showSomething);
                    myModel.dosomething();
                  },child: Text("Do Something : "+ myModel.showSomething));
                }),
                Consumer<MyModel>(builder: (context,myModel,child){
                  // print("Consumerbutton is building");
                  return ElevatedButton(onPressed:(){
                  print(  myModel.showSomething2);
                    myModel.dosomething2();
                  },child: Text("Do Something : "+ myModel.showSomething2));
                }),
               ],

            )
          ),
        ),
      );

  }
}

class MyModel with ChangeNotifier {
  String showSomething = 'show something';
  String showSomething2 = 'show something 2';
get showone => showSomething;
get showtow => showSomething2;

  dosomething(){
    showSomething = "yes provider is working";
    notifyListeners();
  }
  dosomething2(){
    showSomething2 = "yes provider2 is working";
    notifyListeners();
  }
}