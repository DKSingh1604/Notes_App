import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
      child: ListTile(
        title: Text(title),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
