import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, this.title, this.actions});

  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: title != null ? title! : null,
      actions: actions,
      centerTitle: true,
    );
    
  }
}
