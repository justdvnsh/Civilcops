import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key key,
    this.icon,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            this.icon,
            color: isActive ? Colors.teal[700] : Colors.grey,
            size: !isActive ? 28 : 35,
          ),
          isActive ? Text(
            title,
            style: TextStyle(color: isActive ? Colors.teal[700] : Colors.grey),
          ) : SizedBox(),
        ],
      ),
    );
  }
}