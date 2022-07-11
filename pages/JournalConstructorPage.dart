
import 'package:flutter/material.dart';

//TODO заполнить страницу
//-Страница конструктора журнала.
//-Поля имени, группы или возможность сделать пользовательский журнал
class JournalConstructorPage extends StatelessWidget{
  const JournalConstructorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Конструктор журнала'),
        ),
        body: const Center(
              child: Text("Поля для заполнения журнала"),
            ),
    );
  }
}