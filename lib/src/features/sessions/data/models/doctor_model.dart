import 'dart:convert';

Doctor doctorFromJson(String str) =>
    Doctor.fromJson(json.decode(str) as Map<String, dynamic>);

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    required this.name,
    required this.specialist,
    required this.image,
    required this.star,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        name: json['name'] as String,
        specialist: json['specialist'] as String,
        image: json['hospital'] as String,
        star: json['star'] as double,
      );
  final String name;
  final String specialist;
  final String image;
  final double star;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'specialist': specialist,
        'hospital': image,
        'star': star,
      };
}
