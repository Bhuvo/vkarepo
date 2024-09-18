class SpecialityModel {
  int? subCategoryId;
  String? subCategoryName;

  SpecialityModel({this.subCategoryId, this.subCategoryName});

  SpecialityModel.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['SubCategory_id'];
    subCategoryName = json['SubCategory_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubCategory_id'] = this.subCategoryId;
    data['SubCategory_Name'] = this.subCategoryName;
    return data;
  }

  @override
  String toString() {
    return '$subCategoryName';
  }
}
