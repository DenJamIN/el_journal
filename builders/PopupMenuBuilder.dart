
import 'package:flutter/material.dart';

import 'BuilderLists.dart';

class PopupMenuBuilder{
  List<String> tools = SettingsTools.toolsTitles;

  static List<PopupMenuEntry<String>> Function(BuildContext context) buildPopupMenuItems(){
    return (BuildContext context){
      return getEntries(SettingsTools.toolsTitles);
    };
  }

  static List<PopupMenuEntry<String>> getEntries(List<String> tools) => tools
      .map((String tool) => PopupMenuItem<String>(value: tool, child: Text(tool)))
      .toList();

}
