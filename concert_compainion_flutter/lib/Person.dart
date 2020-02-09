import 'dart:convert';

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  String name;
  String surname;
  String gender;
  String region;

  Person({
    this.name,
    this.surname,
    this.gender,
    this.region,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    name: json["name"],
    surname: json["surname"],
    gender: json["gender"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "gender": gender,
    "region": region,
  };
}