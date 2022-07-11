
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[//TODO сделать генерацию
              Container(
                margin: const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Название журнала',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Дисциплина',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Академическая группа',
                  ),
                ),
              ),
            ]
        )
    );
  }
}