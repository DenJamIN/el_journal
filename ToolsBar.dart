import 'package:flutter/material.dart';

import 'SettingsTools.dart';

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
              //TODO вынести в отдельный файл
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return DefaultTabController(
                    initialIndex: 1,
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text('Конструктор журнала'),
                        bottom: const TabBar(
                          tabs: <Widget>[
                            Tab(
                              text: 'Форма заполнения',
                              icon: Icon(Icons.edit),
                            ),
                            Tab(
                              text: 'Список групп',
                              icon: Icon(Icons.list),
                            ),
                          ],
                        ),
                      ),
                      body: const TabBarView(
                        children: <Widget>[
                          Center(
                            child: Text("Поля для заполнения журнала"),
                          ),
                          Center(
                            child: Text("Список действующих групп, пока подумать зачем"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
          )
        ],
      ),
    );
  }
}