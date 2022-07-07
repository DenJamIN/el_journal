

import 'package:flutter/material.dart';

import 'Journal.dart';

class SortTable extends StatefulWidget{
  const SortTable({Key? key}) : super(key: key);

  @override
  State<SortTable> createState() => _SortTableState();
}

class _SortTableState extends State<SortTable> {
  late List<Journal> journals;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: buildDataTable(),
  );

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
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2){
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }
}