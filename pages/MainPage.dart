import 'package:el_journal/pages/PersonProfilePage.dart';
import 'package:flutter/material.dart';

import 'JournalsListPage.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() {return _MainPage();}
}

class _MainPage extends State<MainPage> {
  int tabIndex = 1;
  late List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      const PersonProfilePage(),
      const JournalsListPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Электронный журнал',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: buildPageContent(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildPageContent(){
    return Scaffold(
      body: listScreens[tabIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget buildBottomNavigationBar(){
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: tabIndex,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: getTabs()
    );
  }

  List<BottomNavigationBarItem> getTabs(){
    return [
      const BottomNavigationBarItem(label: 'Профиль', icon: Icon(Icons.person)),
      const BottomNavigationBarItem(label: 'Журналы', icon: Icon(Icons.menu_book))
    ];
  }
}