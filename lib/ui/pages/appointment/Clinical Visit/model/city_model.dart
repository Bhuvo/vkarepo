class CityModel {
  int? cityId;
  String? cityName;

  CityModel({this.cityId, this.cityName});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    return data;
  }

  @override
  String toString() {
    return '$cityName';
  }
}
