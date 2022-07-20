

import 'package:el_journal/entities/Discipline.dart';

import 'Group.dart';

class Journal{
  late String name;
  late Group group;
  late Discipline discipline;

  Journal({required this.group, required this.discipline}){
    String groupName = group.toString();
    String disciplineName = discipline.toString();
    name = '$disciplineName\t$groupName';
  }

  @override
  String toString() {
    return name;
  }
}