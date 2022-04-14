import 'package:check_box_drop_down/view/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/checkbox_dropdown_controller.dart';
import '../../model/model.dart';
import '../widget/checkbox_dropdown.dart';

final CheckBoxDropDownController controller =
    Get.put(CheckBoxDropDownController());

class CheckBoxDropDownScreen extends StatelessWidget {
  const CheckBoxDropDownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckboxDropDown"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2),
              ),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Group selection",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Obx(() {
                    return CheckBoxDropDown(
                        checkBoxOnChanged:
                            controller.selectOrUnSelectAllCheckBoxes,
                        checkBoxTitle: const Text("Select all"),
                        checkBoxValue:
                            controller.headerCheckBoxIsSelected.value,
                        dropDownOnChanged:
                            controller.selectOrUnselectAllDropDowns,
                        dropDownValue: controller.items[0].permissionList![0],
                        dropDownListItem: controller.getPermissionList);
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (_, index) {
                Model item = controller.items[index];
                return Obx(
                  () {
                    return CheckBoxDropDown(
                        checkBoxSubtitle: Text(item.subtitle),
                        checkBoxOnChanged: (bool? value) {
                          controller.toggleBodyCheckbox(index, value);
                        },
                        checkBoxTitle: Text(item.title),
                        checkBoxValue: controller.items[index].isChecked,
                        dropDownOnChanged: (String? currentItem) {
                          controller.changeBodyDropDownItem(
                              currentItem!, index);
                        },
                        dropDownValue:
                            controller.items[index].currentPermission,
                        dropDownListItem: controller.getPermissionList);
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    controller.filteredItems();
                    return const RegisterScreen();
                  },
                ),
              );
            },
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
