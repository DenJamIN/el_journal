import 'package:flutter/material.dart';

import '../ToolsBar.dart';

void main() {
  runApp(const JournalsList());
}

class JournalsList extends StatelessWidget {
  const JournalsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Электронный журнал',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ToolsBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}