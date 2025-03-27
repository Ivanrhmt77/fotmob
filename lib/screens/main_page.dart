import 'package:flutter/material.dart';
import 'package:fotmob/screens/article_page.dart';
import 'package:fotmob/screens/home_page.dart';
import 'package:fotmob/screens/not_found_page.dart';
import 'package:fotmob/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ArticlePage(),
    NotFoundPage(),
    NotFoundPage(),
    NotFoundPage(),
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
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkGray,
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.gray,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer_outlined),
          activeIcon: Icon(Icons.sports_soccer),
          label: 'Pertandingan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          activeIcon: Icon(Icons.article),
          label: 'Berita',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events_outlined),
          activeIcon: Icon(Icons.emoji_events),
          label: 'Liga',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined),
          activeIcon: Icon(Icons.star),
          label: 'Mengikuti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_outlined),
          activeIcon: Icon(Icons.menu),
          label: 'Lainnya',
        ),
      ],
    );
  }
}
