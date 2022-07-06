

import 'package:el_journal/Discipline.dart';
import 'package:el_journal/Group.dart';
import 'package:el_journal/Journal.dart';

mixin SettingsTools {
  static const List<String> toolsTitles = <String>[
    'Поиск',
  ];
}

mixin JournalList{
  static List<Journal> journals = <Journal>[
    Journal(Group('Б-ИСиТ-ИБ', 2019, 4), Discipline('Базы данных')),
    Journal(Group('Б-ИСиТ', 2019, 4), Discipline('Управление данными')),
    Journal(Group('Б-ИСиТ-ИБ', 2020, 2), Discipline('Базы данных')),
    Journal(Group('Б-ГиМУ', 2021, 2), Discipline('Экономика')),
    Journal(Group('С-ЛД', 2018, 5), Discipline('Фармакология')),
    Journal(Group('Б-ИСиТ-ИБ', 2019, 4), Discipline('Протоколы и интерфейсы')),
    Journal(Group('Б-ИСиТ-ИБ', 2019, 4), Discipline('Защита систем'))
  ];
}