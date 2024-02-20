import 'package:flutter/material.dart';
class DrawerOption extends StatelessWidget {
  final String lable;
  final VoidCallback onTap;


  const DrawerOption({required this.lable,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(lable),
        ),
      ),
    );
  }
}
