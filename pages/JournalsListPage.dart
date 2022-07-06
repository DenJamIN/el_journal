import 'package:el_journal/pages/JournalConstructorPage.dart';
import 'package:flutter/material.dart';

import '../BuilderLists.dart';

//-Шапка. На ней расположены: название приложения(?), панель инструментов
class ToolsBar extends StatefulWidget {
  const ToolsBar({Key? key}) : super(key: key);
  @override
  State<ToolsBar> createState() => ToolsBarWidget();
}
class ToolsBarWidget extends State<ToolsBar> {
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
            itemBuilder: (BuildContext contex){
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
                    child: DataTable(
                      border: const TableBorder(
                          horizontalInside: BorderSide(
                            width: 1,
                            color: Colors.amberAccent,
                            style: BorderStyle.solid
                          ),
                          verticalInside: BorderSide(
                              width: 1,
                              color: Colors.amberAccent,
                              style: BorderStyle.solid
                          ),
                      ),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Дисциплина',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Группа',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          JournalList.journals.length,
                          (index) => DataRow(
                            cells: <DataCell>[
                              //+Дисциплина
                              DataCell(
                                Text(
                                  JournalList.journals[index].discipline.toString(),
                                  style: const TextStyle(
                                    fontSize: 16
                                  ),
                                )
                              ),
                              //+Группа
                              DataCell(
                                  Text(
                                    JournalList.journals[index].group.toString(),
                                    style: const TextStyle(
                                        fontSize: 16
                                    ),
                                  )
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}