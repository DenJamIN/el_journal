

import 'package:el_journal/entities/Discipline.dart';
import 'package:el_journal/entities/Journal.dart';

import '../entities/Group.dart';

mixin SettingsTools {
  static const List<String> toolsTitles = <String>[
    'Поиск',
  ];
}

mixin JournalList{
  static List<Journal> journals = <Journal>[
    Journal(group: Group('Б-ИСиТ-ИБ', 2019, 4), discipline: Discipline('Базы данных')),
    Journal(group: Group('Б-ИСиТ', 2019, 4), discipline: Discipline('Управление данными')),
    Journal(group: Group('Б-ИСиТ-ИБ', 2020, 2), discipline: Discipline('Базы данных')),
    Journal(group: Group('Б-ГиМУ', 2021, 2), discipline: Discipline('Экономика')),
    Journal(group: Group('С-ЛД', 2018, 5), discipline: Discipline('Фармакология')),
    Journal(group: Group('Б-ИСиТ-ИБ', 2019, 4), discipline: Discipline('Протоколы и интерфейсы')),
    Journal(group: Group('Б-ИСиТ-ИБ', 2019, 4), discipline: Discipline('Защита систем'))
  ];
}

mixin GroupList{
  static List<Group> groups = <Group>[
    Group('Б-ИСиТ-ИБ', 2019, 4),
    Group('Б-ИСиТ', 2019, 4),
    Group('Б-ИСиТ-ИБ', 2020, 2),
    Group('Б-ГиМУ', 2021, 2),
    Group('С-ЛД', 2018, 5),
    Group('Б-ИСиТ-ИБ', 2019, 4),
    Group('Б-ИСиТ-ИБ', 2019, 4),
  ];
}