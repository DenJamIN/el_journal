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