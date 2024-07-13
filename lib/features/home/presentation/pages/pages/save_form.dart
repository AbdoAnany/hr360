import 'package:flutter/material.dart';

class SaveForm extends StatefulWidget {
  const SaveForm({super.key});

  @override
  State<SaveForm> createState() => _SaveFormState();
}

class _SaveFormState extends State<SaveForm> {
  var object;

  @override
  void initState() {
//     object= sl<SharedPreferences>().get('ketStack') as GlobalKey   ;
//
// print(object);

    GlobalKey(debugLabel: object);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return object == null
        ? CircularProgressIndicator()
        : ListView(
            children: [Center(child: object.currentWidget)],
          );
  }
}
