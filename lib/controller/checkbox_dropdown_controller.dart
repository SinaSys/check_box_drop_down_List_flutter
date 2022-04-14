import 'package:get/get.dart';

import '../model/model.dart';

class CheckBoxDropDownController extends GetxController {
  final RxList<Model> items = modelList.obs;
  final RxBool headerCheckBoxIsSelected = false.obs;
  List<Model> filteredList = [];

  void selectOrUnSelectAllCheckBoxes(bool? value) {
    headerCheckBoxIsSelected.value = value!;
    for (var item in items) {
      if (headerCheckBoxIsSelected.value) {
        item.isChecked = true;
      } else {
        item.isChecked = false;
      }
    }
    items.refresh();
  }

  get getPermissionList => items[0].permissionList!;

  void selectOrUnselectAllDropDowns(String? headerDropDownItem) {
    for (int i = 0; i < items.length; i++) {
      changeBodyDropDownItem(headerDropDownItem, i);
    }
  }

  void _whetherAnyCheckboxesChecked() {
    bool isAnyCheckBoxesChecked =
        items.any((element) => element.isChecked == false ? true : false);
    if (isAnyCheckBoxesChecked) headerCheckBoxIsSelected.value = false;
  }

  void toggleBodyCheckbox(int index, bool? value) {
    items[index].isChecked = value!;
    items.refresh();
    _whetherAnyCheckboxesChecked();
  }

  int _getDropDownIndexByValue(String item) {
    Map<int, String> dropDownMap;
    dropDownMap = items[0]
        .permissionList!
        .asMap()
        .map((int key, String value) => MapEntry<int, String>(key, value));
    var key = dropDownMap.keys.firstWhere((k) => dropDownMap[k] == item);
    return key;
  }

  void changeBodyDropDownItem(String? currentItem, int index) {
    items[index].currentPermission =
        items[index].permissionList![_getDropDownIndexByValue(currentItem!)];
    items.refresh();
  }

  void filteredItems() {
    filteredList = [];
    for (var item in items) {
      if (item.isChecked) filteredList.add(item);
    }
  }
}
