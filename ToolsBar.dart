import 'package:flutter/material.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Настройки',
            onPressed: () {
              //TODO handle the press
            },
          ),
        ],
      ),
    );
  }
}