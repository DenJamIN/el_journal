
import 'package:flutter/material.dart';

//TODO заполнить страницу
//-Страница конструктора журнала.
//-Поля имени, группы или возможность сделать пользовательский журнал
class JournalConstructorPage extends StatelessWidget{
  const JournalConstructorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Конструктор журнала'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Форма заполнения',
                icon: Icon(Icons.edit),
              ),
              Tab(
                text: 'Список групп',
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Поля для заполнения журнала"),
            ),
            Center(
              child: Text("Список действующих групп, пока подумать зачем"),
            ),
          ],
        ),
      ),
    );
  }
}