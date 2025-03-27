import 'package:flutter/material.dart';
import 'package:fotmob/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Scaffold(),
    Scaffold(body: Text("data", style: TextStyle(color: AppColors.lightGray))),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type:
          BottomNavigationBarType
              .fixed, // Agar backgroundColor tidak transparan
      backgroundColor: AppColors.darkGray,
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.gray,
      selectedLabelStyle: const TextStyle(fontSize: 12), // Ukuran tetap
      unselectedLabelStyle: const TextStyle(fontSize: 12), // Ukuran tetap
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer_outlined),
          activeIcon: Icon(Icons.sports_soccer),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          activeIcon: Icon(Icons.article),
          label: 'Tes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard_outlined),
          activeIcon: Icon(Icons.leaderboard),
          label: 'Tes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard_outlined),
          activeIcon: Icon(Icons.leaderboard),
          label: 'Tes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard_outlined),
          activeIcon: Icon(Icons.leaderboard),
          label: 'Tes',
        ),
      ],
    );
  }
}
