import 'package:flutter/material.dart';
import 'package:netflix/views/home_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<Widget> _screen = [
    HomeView(),
    const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home_rounded,
    'Games': Icons.videogame_asset_off_outlined,
    'Hot': Icons.local_fire_department,
    'profile': Icons.person,
  };
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(170, 20, 20, 20),
          items: _icons
              .map(
                (label, icon) => MapEntry(
                  label,
                  BottomNavigationBarItem(
                      icon: Icon(icon, size: 33), label: label),
                ),
              )
              .values
              .toList(),
          currentIndex: _currentindex,
          selectedItemColor: Color.fromARGB(255, 56, 228, 241),
          unselectedItemColor: Colors.white,
          onTap: (index) => setState(() => _currentindex = index),
        ),
      ),
      body: _screen[_currentindex],
    );
  }
}
