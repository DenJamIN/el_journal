import 'package:flutter/material.dart';

import 'JournalsListPage.dart';

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
      home: const JournalsListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}