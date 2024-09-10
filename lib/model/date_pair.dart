import 'dart:core';

class DatePair{
  late DateTime from, to;

  late String name, id;

  DatePair(this.name, this.from, this.to) {
    id = this.name;
  }

  DatePair.fromJson(Map<String, dynamic> json){
    this.from = DateTime.parse(json['from']);
    this.to = DateTime.parse(json['to']);
    this.name = json['name'];
    this.id = json['id'];
  }
}