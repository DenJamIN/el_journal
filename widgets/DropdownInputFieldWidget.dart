
import 'package:flutter/material.dart';

//TODO доработать.
//Представляет из себя комбинацию из выпадающего списка и текстового поля
// ignore: must_be_immutable
class DropdownInputFieldWidget extends StatefulWidget{
  TextEditingController ctrl;
  Set items;
  Widget? label;
  InputBorder? border;
  Widget? iconOut;
  Icon iconSuffix;

  DropdownInputFieldWidget({
    Key? key,
    required this.ctrl,
    required this.items,
    required this.iconSuffix,
    this.label,
    this.border,
    this.iconOut,
  }) : super(key: key);

  @override
  State<DropdownInputFieldWidget> createState() {
    // ignore: no_logic_in_create_state
    return _DropdownInputFieldWidget(
        ctrl: ctrl,
        label: label,
        border: border,
        iconOut: iconOut,
        iconSuffix: iconSuffix,
        items: items
    );
  }
}

class _DropdownInputFieldWidget extends State<DropdownInputFieldWidget>{
  bool panelVisibility = false;
  bool panelValuesPresent = true;
  TextEditingController ctrl;
  late Set itemsFiltered;
  Set items;
  Widget? label;
  InputBorder? border;
  Widget? iconOut;
  Icon iconSuffix;

  _DropdownInputFieldWidget({
    required this.ctrl,
    required this.items,
    required this.iconSuffix,
    this.label,
    this.border,
    this.iconOut,
  }){
    itemsFiltered = items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        disciplineTextField(),
        panelVisibility
            ? disciplineSearchPanel()
            : const SizedBox(height: 30),
      ],
    );
  }

  //TODO сделать по логике дропдавнлиста
  Widget disciplineTextField(){
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(
        label: label,
        border: border,
        icon: iconOut,
        suffixIcon: panelValuesPresent
            ? Container(width: 0)
            : IconButton(
          icon: iconSuffix,
          onPressed: () {
            //TODO добавить создание
            panelVisibility = true;
          },
        ),
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
      onTap: () => ctrl.value.text.isEmpty ? panelVisibility = true : null,
      onChanged: (text) {
        itemsFiltered = items.where((element) => element.toString().toLowerCase().contains(text.toLowerCase())).toSet();
        itemsFiltered.isEmpty ? panelVisibility = false : panelVisibility = true;
        itemsFiltered.isEmpty ? panelValuesPresent = false : panelValuesPresent = true;
      },
    );
  }

  Widget disciplineSearchPanel(){
    return Center(
      //TODO Поменять Column на другой материал виджет. Сделать панельку КРАСИВОЙ!
        child: Column(
          children: itemsFiltered
              .map((d) => d.toString())
              .toSet()
              .map((value) {
                return ElevatedButton(
                    child: Text(value),
                    onPressed: () {
                      panelVisibility = false;
                      ctrl.text = value;
                    });
              }).toList(),
        )
    );
  }
}