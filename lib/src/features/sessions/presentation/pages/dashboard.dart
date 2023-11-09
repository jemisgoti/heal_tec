import 'package:flutter/material.dart';
import 'package:heal_tec/src/features/calendar/presentation/pages/dayview.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/home_page.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/profile.dart';
import 'package:heal_tec/src/features/sessions/presentation/pages/reports.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/appbar.dart';
import 'package:heal_tec/src/features/sessions/presentation/widgets/navbar.dart';
import 'package:iconly/iconly.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  static const String routeName = '/dashboard';
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  List<Widget> pages = <Widget>[
    const HomePage(),
    const DayView(),
    const Reports(),
    const ProfilePage(),
  ];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => pages[index],
        ),
        bottomNavigationBar: Navbar(
          onTap: (int value) {
            pageController.jumpToPage(value);
            index = value;
          },
        ),
      );
}
