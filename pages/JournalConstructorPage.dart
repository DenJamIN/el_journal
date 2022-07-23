
// ignore_for_file: non_constant_identifier_names

import 'package:el_journal/entities/Discipline.dart';
import 'package:el_journal/widgets/DropdownPanelTextFieldWidget.dart';
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
  final disciplineCtrl = TextEditingController();
  final groupCtrl = TextEditingController();
  bool disciplineValidate = false;
  bool disciplinePanel = false;
  bool disciplineValuePresent = true;
  bool groupValidate = false;
  String dropdownValue = GroupList.groups.first.toString();
  //TODO определить размеры смартфона и расположение элементов
  late double phoneWidth;
  late double phoneHeight;

  Set<Discipline> disciplines = DisciplineList.disciplines.toSet();
  final Set<Discipline> disciplinesFilters = DisciplineList.disciplines.toSet();

  @override
  void initState() {
    super.initState();
    disciplineCtrl.addListener(() => setState((){}));
    groupCtrl.addListener(() => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    phoneWidth = MediaQuery.of(context).size.width;
    phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Конструктор журнала'),
        ),
        body: Center(
            child: ListView(
              padding: EdgeInsets.all(phoneWidth/12.5),
              children: [
                DropdownPanelTextFieldWidget(
                    ctrl: disciplineCtrl,
                    label: const Text('Дисциплина'),
                    border: const OutlineInputBorder(),
                    iconSuffix: const Icon(Icons.add_box),
                    items: DisciplineList.disciplines.toSet()
                ),
                const SizedBox(height: 30),
                DropdownPanelTextFieldWidget(
                    ctrl: groupCtrl,
                    label: const Text('Группа'),
                    border: const OutlineInputBorder(),
                    iconSuffix: const Icon(Icons.add_box),
                    items: GroupList.groups.toSet()
                ),
                const SizedBox(height: 30),
                buildButtonBoxDecoration()
              ],
            ),
        )
    );
  }

  Widget buildButtonBoxDecoration(){
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
                  group: GroupList.groups.firstWhere((g) => g.toString().contains(groupCtrl.value.text)),
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