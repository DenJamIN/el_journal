
// ignore_for_file: non_constant_identifier_names

import 'package:el_journal/entities/Discipline.dart';
import 'package:flutter/material.dart';

import '../builders/BuilderLists.dart';
import '../entities/Group.dart';
import '../entities/Journal.dart';

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
  final disciplineCtrl = TextEditingController();
  final groupCtrl = TextEditingController();
  bool disciplineValidate = false;
  bool groupValidate = false;
  String dropdownValue = GroupList.groups.first.toString();

  @override
  void initState() {
    super.initState();
    disciplineCtrl.addListener(() => setState((){}));
    groupCtrl.addListener(() => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Конструктор журнала'),
        ),
        body: Center(
            child: ListView(
              padding: DEFAULT_EDGES_INSETS,
              children: [
                disciplineTextField(),
                const SizedBox(height: 30),
                groupDropDown(),
                const SizedBox(height: 30),
                buildButtonWithDecorationInBox(),
              ],
            ),
        )
    );
  }

  //TODO сделать по логике дропдавнлиста
  Widget disciplineTextField(){
    return TextField(
      controller: disciplineCtrl,
      decoration: InputDecoration(
        label: const Text('Дисциплина'),
        errorText: disciplineValidate ? 'Поле обязательно для заполнение' : null,
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
      maxLines: 2,
    );
  }

  Widget groupTextField(){
    return TextField(
      controller: groupCtrl,
      decoration: InputDecoration(
        label: const Text('Группа'),
        errorText: groupValidate ? 'Поле обязательно для заполнение' : null,
        border: const OutlineInputBorder(),
        icon: const Icon(Icons.group),
        suffixIcon: groupCtrl.text.isEmpty
            ? IconButton(
                icon: const Icon(Icons.list),
                onPressed: () => groupCtrl.clear(),
            )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => groupCtrl.clear(),
            ),
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
    );
  }

  //TODO сделать красиво, возможность добавить новый, поиск существующего параллельно вводу
  Widget groupDropDown(){
    return DropdownButtonFormField(
      decoration: InputDecoration(
        label: const Text('Группа'),
        border: const OutlineInputBorder(),
        icon: IconButton(
          icon: const Icon(Icons.group_add),
          onPressed: () {},
        ),
      ),
      value: dropdownValue,
      items: GroupList.groups
          .map((group) => group.toString())
          .toSet()
          .map((value) => DropdownMenuItem(value: value, child: Text(value)))
          .toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
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
    return ElevatedButton(
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
        setState(() {
          groupCtrl.text.isEmpty ? groupValidate = true : groupValidate = false;
          disciplineCtrl.text.isEmpty ? disciplineValidate = true : disciplineValidate = false;
        });
        if(isFilled()){
          JournalList.journals.add(
              Journal(
                  group: Group(groupCtrl.value.text, 2020, 2),
                  discipline: Discipline(disciplineCtrl.value.text)
              )
          );
          Navigator.pop(context);
        }
      },
    );
  }

  bool isFilled(){
    return groupCtrl.text.isNotEmpty
        && disciplineCtrl.text.isNotEmpty;
  }
}