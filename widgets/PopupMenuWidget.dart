
import 'package:flutter/material.dart';

import '../builders/BuilderLists.dart';

class PopupMenuWidget extends StatelessWidget{
  List<String> tools = SettingsTools.toolsTitles;

  //TODO сделать обработку элемента
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return tools
            .map((String tool) => PopupMenuItem<String>(value: tool, child: Text(tool)))
            .toList();
      },
    );
  }
}
