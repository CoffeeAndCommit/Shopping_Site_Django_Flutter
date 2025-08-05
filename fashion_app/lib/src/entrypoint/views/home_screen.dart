
import 'package:flutter/material.dart';

import '../../home/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          appBar: PreferredSize(
          preferredSize: Size.fromHeight(110), child: CustomAppBar()),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}