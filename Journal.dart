

import 'package:el_journal/Discipline.dart';
import 'package:el_journal/Group.dart';

class Journal{
  late String name;
  late Group group;
  late Discipline discipline;

  Journal(this.group, this.discipline){
    String groupName = group.toString();
    String disciplineName = discipline.toString();
    name = '$disciplineName\t$groupName';
  }

  @override
  String toString() {
    return name;
  }
}