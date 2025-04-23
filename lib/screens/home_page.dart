import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotmob/screens/matches/all_matches_page.dart';
import 'package:fotmob/screens/not_found_page.dart';
import 'package:fotmob/utils/colors.dart';
import 'package:fotmob/utils/slide_page_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: const TabBarView(
          children: [AllMatchesPage(), AllMatchesPage(), AllMatchesPage()],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlackGray,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/fotmob-seeklogo.svg', height: 18),
            Row(
              children: [
                _buildIconButton(context, Icons.access_time),
                _buildIconButton(context, Icons.calendar_today),
                _buildIconButton(context, Icons.search),
                _buildMoreOptionsButton(context),
              ],
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Theme(
          data: Theme.of(context).copyWith(
            tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TabBar(
              indicatorColor: AppColors.green,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.lightGray,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              unselectedLabelColor: AppColors.gray,
              tabs: const [
                Tab(text: "Min 23 Mar"),
                Tab(text: "Sen 24 Mar"),
                Tab(text: "Sel 25 Mar"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: IconButton(
        icon: Icon(icon),
        onPressed: () => _navigateToNotFound(context),
        iconSize: 18,
      ),
    );
  }

  Widget _buildMoreOptionsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {},
        onExit: (_) {},
        child: GestureDetector(
          onTapDown: (details) => _showPopupMenu(context, details),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(Icons.more_vert, size: 18),
          ),
        ),
      ),
    );
  }

  void _navigateToNotFound(BuildContext context) async {
    await Future.delayed(Duration.zero);
    if (!context.mounted) return;

    Navigator.push(
      context,
      SlidePageRoute(
        page: const NotFoundPage(),
        direction: AxisDirection.right,
      ),
    );
  }

  void _showPopupMenu(BuildContext context, TapDownDetails details) async {
    final overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;

    if (overlay == null) return;

    final selectedValue = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: [
        _buildPopupMenuItem(context, 'settings', Icons.settings, "Pengaturan"),
        _buildPopupMenuItem(context, 'about', Icons.info, "Tentang Aplikasi"),
      ],
    );

    if (!context.mounted) return;

    if (selectedValue == 'settings' || selectedValue == 'about') {
      _navigateToNotFound(context);
    }
  }

  PopupMenuItem<String> _buildPopupMenuItem(
    BuildContext context,
    String value,
    IconData icon,
    String text,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).iconTheme.color),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
