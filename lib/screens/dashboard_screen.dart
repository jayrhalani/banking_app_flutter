import 'package:banking_app_flutter/screens/home_screen.dart';
import 'package:banking_app_flutter/screens/placeholder_page.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PlaceholderPage(title: 'Map', icon: Icons.map_outlined),
    const PlaceholderPage(title: 'Transfer', icon: Icons.swap_horiz),
    const PlaceholderPage(title: 'Settings', icon: Icons.settings_outlined),
    const PlaceholderPage(title: 'Profile', icon: Icons.person),
    // const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 12, bottom: 20),
          // extra vertical padding
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              // let parent container control color
              elevation: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.swap_horiz),
                  label: 'Transfer',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 16, color: Colors.white),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
