import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/city_model.dart';
import '../model/location_model.dart';
import '../model/speciality_model.dart';
import '../model/state_model.dart';

class ClinicalVisitController {

  List<StateModel> stateData = [];
  List<CityModel> cityData = [];
  List<LocationModel> locationData = [];
  List<SpecialityModel> specialityData = [];

  StateModel selectedState = StateModel();
  CityModel selectedCity = CityModel();
  LocationModel selectedLocation = LocationModel();
  SpecialityModel selectedSpeciality = SpecialityModel();

   Future<void> getStateList() async {
    var response = await http.get(Uri.parse('https://api.timesmed.com/Master_Data/Get_State_List?country_id=1'));
    if(response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        stateData.add(StateModel.fromJson(element));
      });
    }else{
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> getCityList(int stateId) async {
    cityData.clear();
    var response = await http.get(Uri.parse('https://api.timesmed.com/Master_Data/Get_City_List?country_id=1&state_id=$stateId'));
    if(response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        cityData.add(CityModel.fromJson(element));
      });
    }else{
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> getLocationList(int stateId ,int cityId) async {
    var response = await http.get(Uri.parse('https://api.timesmed.com/Master_Data/Get_location_List?country_id=1&state_id=$stateId&city_id=$cityId'));
    if(response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        locationData.add(LocationModel.fromJson(element));
      });
    }else{
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  Future<void> getSpecialityList(String specialitName) async {
    specialityData.clear();
    var response = await http.get(Uri.parse('https://api.timesmed.com/Master_Data/SubCatList?search=$specialitName'));
    if(response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        specialityData.add(SpecialityModel.fromJson(element));
      });
    }else{
      print('Request failed with status: ${response.statusCode}.');
    }
  }


}