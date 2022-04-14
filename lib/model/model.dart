class Model{
  String title;
  String subtitle;
  bool isChecked;
  List<String>? permissionList;
  String currentPermission;

  Model(this.title, this.subtitle, this.isChecked, this.permissionList,
      this.currentPermission);
}

final List<Model> modelList = [
  Model('Marketing manager', 'subtitle', false, ["Read","Write","manage"],"Read"),
  Model('Product manager', 'subtitle', false, ["Read","Write","manage"],"Read"),
  Model('Project manager', 'subtitle', false, ["Read","Write","manage"],"Read"),
  Model('Finance manager', 'subtitle', false, ["Read","Write","manage"],"Read"),
  Model('Human resources manager', 'subtitle', false, ["Read","Write","manage"],"Read"),
];