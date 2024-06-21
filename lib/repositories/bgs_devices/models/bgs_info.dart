// class BgsInfo {
//   const BgsInfo({
//     required this.uid,
//     required this.name
//   });
//
//   final String uid;
//   final String name;
// }

import 'dart:core';

class BgsInfo {
  String? id;
  String? name;
  String? description;
  int? startPower;
  int? power;
  int? frequency;
  bool? am;
  int? amMode;
  int? intensity;
  bool? fm;

  BgsInfo({
    this.id,
    this.name,
    this.description = '',
    this.startPower = 1,
    this.power = 20,
    this.frequency = 120,
    this.am = false,
    this.amMode = 1,
    this.intensity = 1,
    this.fm = false,
  });

  BgsInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startPower = json['start_power'];
    power = json['power'];
    frequency = json['frequency'];
    am = json['am'];
    amMode = json['am_mode'];
    intensity = json['intensity'];
    fm = json['fm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['start_power'] = startPower;
    data['power'] = power;
    data['frequency'] = frequency;
    data['am'] = am;
    data['am_mode'] = amMode;
    data['intensity'] = intensity;
    data['fm'] = fm;

    return data;
  }
}