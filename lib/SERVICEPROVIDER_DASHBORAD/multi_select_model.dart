class MultiSelectModel {
  String? title;
  int? id;
  bool? isChecked;

  MultiSelectModel({this.title, this.id, this.isChecked,});

  factory MultiSelectModel.fromJson(Map<String, dynamic> json) {
    String title = json['name'];
    int id = json['id'];
    bool isChecked = json['is_checked'];
    return MultiSelectModel(title: title, id: id, isChecked: isChecked);
  }
}