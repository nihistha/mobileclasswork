import 'package:flutter/material.dart';
import 'package:mobileclass/screen/about_screen.dart';
import 'package:mobileclass/screen/bottom_screen.dart';
import 'package:mobileclass/screen/home_screen.dart';
import 'package:mobileclass/screen/profile_screen.dart';

class DashboardScreem extends StatefulWidget {
  const DashboardScreem({super.key});

  @override
  State<DashboardScreem> createState() => _DashboardScreemState();
}

class _DashboardScreemState extends State<DashboardScreem> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const ProfileScreen(),
    const AboutScreen(),
    const BottomScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Screen"),
        backgroundColor: Colors.blue,
      ),
      body:lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_outlined),
            label: 'About'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

