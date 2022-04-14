import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/checkbox_dropdown_controller.dart';
import '../../model/model.dart';


final CheckBoxDropDownController controller =
Get.put(CheckBoxDropDownController());

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register screen"),
      ),
      body: ListView.builder(
        itemCount: controller.filteredList.length,
          itemBuilder: (_,index){
          Model item = controller.filteredList[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            trailing: Text(item.currentPermission),
          );
          },
      ),
    );
  }
}
