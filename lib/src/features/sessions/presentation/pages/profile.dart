import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';
import 'package:heal_tec/src/features/sessions/data/models/medical_report.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/onboarding.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/splash_screen.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/setting_tile.dart';
import 'package:iconly/iconly.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<MedicalReport> reports = medicalReports;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          elevation: 0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                context.go(OnboardingScreen.routeName);
              },
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  CupertinoIcons.power,
                  size: 20,
                  color: black,
                ),
              ),
            ),
            const Gap(subMargin),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(mainMargin),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(subMargin),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading:
                    ClipOval(child: Image.network('https://i.pravatar.cc/300')),
                title: const Text(
                  'Michale Cost',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //   '01/01/1971',
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    Text(
                      'michal.costa@mail.com',
                      style: TextStyle(
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
                        Icons.edit,
                        size: 20,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(subMargin),
            const SettingTile(
              icon: Icons.settings,
              title: 'Settings',
            ),
            const Gap(subMargin),
            const SettingTile(
              icon: Icons.language,
              title: 'Language',
            ),
            const Gap(subMargin),
            const SettingTile(
              icon: Icons.color_lens,
              title: 'Theme Mode',
            ),
            const Gap(subMargin),
            const SettingTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
            ),
            const Gap(subMargin),
            const SettingTile(
              icon: IconlyBold.document,
              title: 'Terms & Conditions',
            ),
            const Gap(subMargin),
            const SettingTile(
              icon: Icons.support,
              title: 'Contact Support',
            ),
            const Gap(24),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder:
                  (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                String text = '';
                if (snapshot.hasData) {
                  final PackageInfo packageInfo = snapshot.data!;
                  text = '${packageInfo.version}(${packageInfo.buildNumber})';
                }
                return Center(
                  child: Text(
                    text,
                    style: const TextStyle(color: black),
                  ),
                );
              },
            ),
            const Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Made With '),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                const Gap(8),
                const Text('In'),
                const Gap(8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1599px-Flag_of_India.svg.png',
                    width: 36,
                  ),
                ),
              ],
            ),
          ],
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
