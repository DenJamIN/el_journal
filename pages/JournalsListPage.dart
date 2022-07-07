import 'package:el_journal/pages/JournalConstructorPage.dart';
import 'package:flutter/material.dart';

import '../BuilderLists.dart';
import '../Journal.dart';

//-Шапка. На ней расположены: название приложения(?), панель инструментов
class JournalsListPage extends StatefulWidget {
  const JournalsListPage({Key? key}) : super(key: key);
  @override
  State<JournalsListPage> createState() => _JournalsListPage();
}
//TODO переписать все вызовы и построения
class _JournalsListPage extends State<JournalsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Электронный журнал'),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(left: 0.0,top: 0.0, right: 5.0, bottom: 0.0),
            icon: const Icon(Icons.add_box),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (context) => const JournalConstructorPage()
              ));
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context){
              return SettingsTools.toolsTitles.map((String tool){
                return PopupMenuItem<String>(
                  value: tool,
                  child: Text(tool),
                );
              }).toList();
            },
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

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) =>
          DataColumn(
              label: Text(column),
              onSort: onSort
          )
      ).toList();

  List<DataRow> getRows(List<Journal> journals) => journals
      .map((Journal journal) {
    final cells = [journal.discipline.toString(), journal.group.toString()];
    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((cell) => DataCell(Text('$cell')
  )).toList();

  void onSort(int columnIndex, bool ascending){
    if(columnIndex == 0){
      journals.sort((a,b)=>compareString(ascending, a.discipline.toString(), b.discipline.toString()));
    } else if (columnIndex == 1){
      journals.sort((a,b)=>compareString(ascending, a.group.toString(), b.group.toString()));
    }
    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2){
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }
}