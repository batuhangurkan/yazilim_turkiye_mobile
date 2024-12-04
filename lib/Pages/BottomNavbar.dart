import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yazilim_turkiye_mobile/Pages/HomePage.dart';
import 'package:yazilim_turkiye_mobile/Pages/LoginPage.dart';
import 'package:yazilim_turkiye_mobile/Pages/Settings.dart';
import 'package:yazilim_turkiye_mobile/Pages/Users.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  final screens = [
    // Sayfa İsimleri Gelicek
    HomePage(),
    Users(),
    SettingsPage()
  ];



  final PageController _pageController = PageController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildPageView(),
          buildBottomNav(),
        ],
      ),
    );
  }

  Widget buildPageView() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: screens,
      ),
    );
  }

  Widget buildBottomNav() {
    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: SnakeShape.rectangle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      padding: EdgeInsets.all(5),
      shadowColor: Colors.black,

      ///configuration for SnakeNavigationBar.color
      snakeViewColor: Colors.red[400],
      selectedItemColor:
      Colors.red[400] == SnakeShape.indicator
          ? Colors.red[400]
          : null,
      unselectedItemColor: Colors.grey.shade400,

      ///configuration for SnakeNavigationBar.gradient
      //snakeViewGradient: selectedGradient,
      //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
      //unselectedItemGradient: unselectedGradient,

      showUnselectedLabels: true,
      showSelectedLabels: true,

      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.home),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.users), label: 'Kullanıcılar'),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.gears),
          label: 'Ayarlar',
        ),
      ],
    );
    // return BottomNavigationBar(
    //   selectedItemColor: Colors.blueGrey,
    //   unselectedItemColor: Colors.red,
    //   iconSize: 35,
    //   currentIndex: currentIndex,
    //   onTap: (index) {
    //     setState(() {
    //       currentIndex = index;
    //       _pageController.animateToPage(
    //         index,
    //         duration: const Duration(milliseconds: 300),
    //         curve: Curves.easeInOut,
    //       );
    //     });
    //   },
    //   items: <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       backgroundColor: Colors.blueGrey,
    //       icon: Icon(Icons.home),
    //       label: "Ana Sayfa",
    //     ),
    //     BottomNavigationBarItem(
    //       backgroundColor: Colors.blueGrey,
    //       icon: Icon(FontAwesomeIcons.circleInfo),
    //       label: "",
    //     ),
    //     BottomNavigationBarItem(
    //       backgroundColor: Colors.blueGrey,
    //       icon: Icon(FontAwesomeIcons.plus),
    //       label: "",
    //     ),
    //   ],
    // );
  }
}