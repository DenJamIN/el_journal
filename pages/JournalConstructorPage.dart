
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

//TODO заполнить страницу
//-Страница конструктора журнала.
//-Поля имени, группы или возможность сделать пользовательский журнал
class JournalConstructorPage extends StatefulWidget{
  const JournalConstructorPage({Key? key}) : super(key: key);

  @override
  State<JournalConstructorPage> createState() {return _JournalConstructorPage();}
}

class _JournalConstructorPage extends State<JournalConstructorPage>{
  final EdgeInsets DEFAULT_EDGES_INSETS = const EdgeInsets.all(32);
  final journalCtrl = TextEditingController();
  final disciplineCtrl = TextEditingController();
  final groupCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    journalCtrl.addListener(() => setState((){}));
    disciplineCtrl.addListener(() => setState((){}));
    groupCtrl.addListener(() => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Конструктор журнала'),
        ),
        body: Center(
            child: ListView(
              padding: DEFAULT_EDGES_INSETS,
              children: [
                journalTextField(),
                const SizedBox(height: 30),
                disciplineTextField(),
                const SizedBox(height: 30),
                groupTextField(),
                const SizedBox(height: 30),
                buildButtonWithDecorationInBox(),
              ],
            ),
        )
    );
  }

  Widget journalTextField(){
    return TextField(
      controller: journalCtrl,
      decoration: InputDecoration(
        label: const Text('Название журнала'),
        border: const OutlineInputBorder(),
        icon: const Icon(Icons.library_books),
        suffixIcon: journalCtrl.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => journalCtrl.clear(),
            ),

      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
      maxLines: 2,
    );
  }

  Widget disciplineTextField(){
    return TextField(
      controller: disciplineCtrl,
      decoration: InputDecoration(
        label: const Text('Дисциплина'),
        border: const OutlineInputBorder(),
        icon: const Icon(Icons.lightbulb),
        suffixIcon: disciplineCtrl.text.isEmpty
            ? Container(width: 0)
            : IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => disciplineCtrl.clear(),
        ),

      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
      maxLines: 3,
    );
  }

  Widget groupTextField(){
    return TextField(
      controller: groupCtrl,
      decoration: InputDecoration(
        label: const Text('Группа'),
        border: const OutlineInputBorder(),
        icon: const Icon(Icons.group),
        suffixIcon: groupCtrl.text.isEmpty
            ? Container(width: 0)
            : IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => groupCtrl.clear(),
        ),

      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildButtonWithDecorationInBox(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: <Widget>[
          buildBoxDecoration(),
          buildTextButton()
        ],
      ),
    );
  }

  Widget buildBoxDecoration(){
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF42A5F5),
        ),
      ),
    );
  }

  Widget buildTextButton(){
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(32.0),
        primary: Colors.white,
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
            "Добавить журнал",
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center
        ),
      ),
      onPressed: () {
        //TODO добавить обработку
      },
    );
  }

}