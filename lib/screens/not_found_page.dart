import 'package:flutter/material.dart';
import 'package:fotmob/utils/colors.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(
        child: Text(
          '404 Halaman Ini Belum Tersedia!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return Navigator.canPop(context)
        ? AppBar(
          backgroundColor: AppColors.darkGray,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        )
        : null;
  }
}
