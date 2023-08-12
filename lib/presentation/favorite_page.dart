import 'package:flutter/material.dart';

import '../theme elements/appbar_text_theme.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorite',
          style: appBarTextStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 98, 95, 95),
      ),
    );
  }
}
