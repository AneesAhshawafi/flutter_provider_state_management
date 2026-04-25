import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetChild extends StatelessWidget {
  const WidgetChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context, listen: false);
    return Column(
      children: [
        SizedBox(height: 100),

        ChangeNotifierProvider(
          create: (context) => Model(),
          // child: Center(child: Text(model.text)),
          // child: Center(child: Text(context.read<Model>().text)), = listen: false
          // child: Center(child: Text(context.watch<Model>().text)), = listen: true
          child: Center(child: Text(context.watch<Model>().text)),
        ),
        SizedBox(height: 20),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            model.changeName();
          },
          child: Text("Press Me"),
        ),
      ],
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
