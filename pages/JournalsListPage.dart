import 'package:el_journal/pages/JournalConstructorPage.dart';
import 'package:flutter/material.dart';

import '../widgets/JournalsListDataTableWidget.dart';
import '../widgets/PopupMenuWidget.dart';

//-Шапка. На ней расположены: название приложения(?), панель инструментов
class JournalsListPage extends StatefulWidget{
  const JournalsListPage({Key? key}) : super(key: key);

  @override
  State<JournalsListPage> createState() {return _JournalsListPage();}
}

class _JournalsListPage extends State<JournalsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Электронный журнал'),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(
                left: 0.0, top: 0.0, right: 5.0, bottom: 0.0),
            icon: const Icon(Icons.add_box),
            tooltip: "Добавить журнал",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) => const JournalConstructorPage()
              ));
            },
          ),
          PopupMenuWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: JournalsListDataTableWidget(),
                  ),
                ]
            )
        ),
      ),
    );
  }
}