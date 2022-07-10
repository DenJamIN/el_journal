
import 'package:flutter/material.dart';

//TODO заполнить страницу
//-Страница профиля пользователя.
class PersonProfilePage extends StatelessWidget{
  const PersonProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Профиль'),
        ),
    );
  }
}