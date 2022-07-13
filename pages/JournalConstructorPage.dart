
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

//TODO заполнить страницу
//-Страница конструктора журнала.
//-Поля имени, группы или возможность сделать пользовательский журнал
class JournalConstructorPage extends StatelessWidget{
  const JournalConstructorPage({Key? key}) : super(key: key);
  final EdgeInsets DEFAULT_EDGES_INSETS = const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Конструктор журнала'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[//TODO заполнить onSubmitted
              Container(
                margin: DEFAULT_EDGES_INSETS,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Название журнала',
                  ),
                  //!onSubmitted пользователь закончил ввод текста
                ),
              ),
              Container(
                margin: DEFAULT_EDGES_INSETS,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Дисциплина',
                  ),
                  //!onSubmitted пользователь закончил ввод текста
                ),
              ),
              Container(
                margin: DEFAULT_EDGES_INSETS,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Академическая группа',
                  ),
                  //!onSubmitted пользователь закончил ввод текста
                ),
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF42A5F5),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {

                      },
                      child: const Text('Добавить журнал'),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
}