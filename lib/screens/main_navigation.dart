import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/home_screen.dart';
import 'package:hotel_booking_app/screens/search_screen.dart';

import '../config/constants/app_strings.dart';

class MainNavigation extends StatefulWidget {

  final int initialIndex;

  const MainNavigation({super.key, this.initialIndex = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; 
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    // const ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.bottomNavHome),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: AppStrings.bottomNavSearch),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: AppStrings.bottomNavFavorites),
        ],
      ),
    );
  }
}