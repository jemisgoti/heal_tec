// To parse this JSON data, do
//
//     final medicalReport = medicalReportFromJson(jsonString);

import 'dart:convert';

import 'package:faker/faker.dart';

MedicalReport medicalReportFromJson(String str) =>
    MedicalReport.fromJson(json.decode(str) as Map<String, dynamic>);

String medicalReportToJson(MedicalReport data) => json.encode(data.toJson());

class MedicalReport {
  MedicalReport({
    required this.type,
    required this.patientName,
    required this.reportLink,
    required this.reportTime,
    required this.userProfile,
  });

  factory MedicalReport.fromJson(Map<String, dynamic> json) => MedicalReport(
        type: json['type'] as String,
        patientName: json['patientName'] as String,
        reportLink: json['reportLink'] as String,
        reportTime: DateTime.parse(json['reportTime'] as String),
        userProfile: json['userProfile'] as String,
      );
  final String type;
  final String patientName;
  final String reportLink;
  final DateTime reportTime;
  final String userProfile;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'patientName': patientName,
        'reportLink': reportLink,
        'reportTime': reportTime.toIso8601String(),
        'userProfile': userProfile,
      };
}

List<MedicalReport> medicalReports = List.generate(15, (int index) {
  final fake = Faker();

  return MedicalReport(
    type: fake.randomGenerator.element(<String>['X-ray', 'MRI', 'Blood Test']),
    patientName: fake.person.name(),
    reportLink: 'https://www.example.com/report$index.pdf',
    reportTime: DateTime.now().subtract(Duration(days: index)),
    userProfile: 'https://i.pravatar.cc/${300 + index}',
  );
});
