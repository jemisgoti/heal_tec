import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/features/sessions/data/models/medical_report.dart';
import 'package:iconly/iconly.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<MedicalReport> reports = medicalReports;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: const Text(
            'Medical Reports',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(subMargin),
          itemBuilder: (BuildContext context, int index) =>
              _MedicalReport(medicalReport: reports[index]),
          separatorBuilder: (BuildContext context, int index) =>
              const Gap(subMargin),
          itemCount: 15,
        ),
      );
}

class _MedicalReport extends StatelessWidget {
  const _MedicalReport({required this.medicalReport});
  final MedicalReport medicalReport;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipOval(child: Image.network(medicalReport.userProfile)),
          title: Text(
            medicalReport.type,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                medicalReport.patientName,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                medicalReport.reportTime.toString().substring(0, 19),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff878787),
                  height: 18 / 12,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF5F5FF),
                ),
                child: const Icon(
                  Icons.download,
                  size: 20,
                  color: Colors.teal,
                ),
              ),
              const Gap(8),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF5F5FF),
                ),
                child: const Icon(
                  IconlyBold.document,
                  size: 20,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
}
