import 'package:flutter/material.dart';
import 'package:heal_tec/src/core/theme/colors.dart';
import 'package:iconly/iconly.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    required this.onTap,
    this.index = 0,
    super.key,
  });
  final void Function(int index) onTap;
  final int index;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        onTap: (int value) {
          index = value;
          setState(() {});
          widget.onTap(index);
        },
        currentIndex: index,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          fill: 1,
        ),
        unselectedItemColor: const Color(0xFF878787),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: 'Dashboard',
            tooltip: 'Dashboard',
            activeIcon: ActiveIcon(
              icon: IconlyBold.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.calendar),
            label: 'Calendar',
            tooltip: 'Calendar',
            activeIcon: ActiveIcon(
              icon: IconlyBold.calendar,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.document),
            label: 'Documents',
            tooltip: 'Documents',
            activeIcon: ActiveIcon(
              icon: IconlyBold.document,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: 'Profiles',
            tooltip: 'Profiles',
            activeIcon: ActiveIcon(
              icon: IconlyBold.profile,
            ),
          ),
        ],
      );
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({required this.icon, super.key});
  final IconData icon;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor.withOpacity(0.1),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 24,
          ),
        ),
      );
}
