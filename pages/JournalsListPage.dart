import 'package:el_journal/pages/JournalConstructorPage.dart';
import 'package:flutter/material.dart';

import '../builders/BuilderLists.dart';
import '../Journal.dart';
import '../builders/PopupMenuBuilder.dart';

//-Шапка. На ней расположены: название приложения(?), панель инструментов
class JournalsListPage extends StatefulWidget {
  const JournalsListPage({Key? key}) : super(key: key);

  @override
  State<JournalsListPage> createState() {return _JournalsListPage();}
}

class _JournalsListPage extends State<JournalsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Электронный журнал'),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(
                  left: 0.0, top: 0.0, right: 5.0, bottom: 0.0),
              icon: const Icon(Icons.add_box),
              tooltip: "Добавить журнал",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) => const JournalConstructorPage()
                ));
              },
            ),
            PopupMenuButton(
              itemBuilder: PopupMenuBuilder.buildPopupMenuItems(),
              tooltip: "Настройки",
            ),
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: buildDataTable(),
                  ),
                ]
            )
        )
    );
  }


  //TODO придумать куда и как перекинуть кусок построения DataTable(проблема в setState())
  List<Journal> journals = JournalList.journals;
  int? sortColumnIndex;
  bool isAscending = false;

  Widget buildDataTable(){
    final columns = ['Дисциплина','Группа'];
    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(journals),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns
        .map((String c) => DataColumn(label: Text(c), onSort: onSort))
        .toList();
  }

  List<DataRow> getRows(List<Journal> journals) {
    return journals
      .map((Journal j) {
        final cells = [j.discipline.toString(), j.group.toString()];
        return DataRow(cells: getCells(cells));
      })
      .toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells
        .map((cl) => DataCell(Text('$cl')))
        .toList();
  }

  void onSort(int columnIndex, bool ascending){
    if(columnIndex == 0){
      journals.sort((a,b)=>compareString(ascending, a.discipline.toString(), b.discipline.toString()));
    } else if (columnIndex == 1){
      journals.sort((a,b)=>compareString(ascending, a.group.toString(), b.group.toString()));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2){
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }
}