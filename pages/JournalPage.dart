
import 'package:flutter/material.dart';


//TODO заполнить страницу
//-Страница журнала.
//-Операции над студентами(вывод, посещаемость, успеваемость)
//-Занятия: вид занятия, задание
class JournalPage extends StatelessWidget{
  final List<String> name;

  const JournalPage(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.last),
      ),
    );
  }
}