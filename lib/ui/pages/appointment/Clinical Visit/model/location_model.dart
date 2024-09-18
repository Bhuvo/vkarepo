class LocationModel {
  String? locationTmp;
  int? locationId;
  String? locationName;
  int? lat;
  int? long;
  int? subCategoryId;
  String? subCategoryName;

  LocationModel(
      {this.locationTmp,
        this.locationId,
        this.locationName,
        this.lat,
        this.long,
        this.subCategoryId,
        this.subCategoryName,
      });

  LocationModel.fromJson(Map<String, dynamic> json) {
    locationTmp = json['LocationTmp'];
    locationId = json['Location_id'];
    locationName = json['Location_Name'];
    lat = json['Lat'];
    long = json['Long'];
    subCategoryId = json['SubCategory_id'];
    subCategoryName = json['SubCategory_Name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LocationTmp'] = this.locationTmp;
    data['Location_id'] = this.locationId;
    data['Location_Name'] = this.locationName;
    data['Lat'] = this.lat;
    data['Long'] = this.long;
    data['SubCategory_id'] = this.subCategoryId;
    data['SubCategory_Name'] = this.subCategoryName;
    return data;
  }

  @override
  String toString() {
    return '$locationName';
  }
}
