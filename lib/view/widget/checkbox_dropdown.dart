import 'package:flutter/material.dart';

class CheckBoxDropDown extends StatelessWidget {
  //Create field for checkBox
  final ValueChanged<bool?>? checkBoxOnChanged;
  final Widget checkBoxTitle;
  final Widget? checkBoxSubtitle;
  final bool? checkBoxValue;

  //Create field for Dropdown
  final ValueChanged<String?>? dropDownOnChanged;
  final String? dropDownValue;
  final List<String> dropDownListItem;

  const CheckBoxDropDown(
      {Key? key,
      this.checkBoxSubtitle,
      required this.checkBoxOnChanged,
      required this.checkBoxTitle,
      required this.checkBoxValue,
      required this.dropDownOnChanged,
      required this.dropDownValue,
      required this.dropDownListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: checkBoxTitle,
      subtitle: checkBoxSubtitle,
      value: checkBoxValue,
      onChanged: checkBoxOnChanged,
      secondary: SizedBox(
        width: 120,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: dropDownValue,
          onChanged: dropDownOnChanged,
          items: dropDownListItem
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: FittedBox(
                    child: Text(item),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
