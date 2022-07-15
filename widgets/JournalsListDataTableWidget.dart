
import 'package:el_journal/pages/JournalPage.dart';

import 'package:flutter/material.dart';

import '../builders/BuilderLists.dart';
import '../entities/Journal.dart';

class JournalsListDataTableWidget extends StatefulWidget {
  @override
  _JournalsListDataTableWidget createState() {return _JournalsListDataTableWidget();}
}

class _JournalsListDataTableWidget extends State<JournalsListDataTableWidget> {
  List<Journal> journals = JournalList.journals;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    return buildDataTable();
  }

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

  //TODO придумать обработку элемента из DataTable
  List<DataCell> getCells(List<String> cells) {
    return cells
        .map((cl) => DataCell(
        onDoubleTap: (){
          Navigator.push(context, MaterialPageRoute<void>(
              builder: (context) => JournalPage(cells)
          ));
        },
        Text(cl)
    ))
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