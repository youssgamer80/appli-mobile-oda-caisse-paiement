import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  CustomAppBar(
      {@required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('$title',
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins")),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Theme.of(context).primaryColorDark,
              onPressed: () => onBackPressed != null
                  ? onBackPressed
                  : Navigator.pop(context))
          : SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(1170, 50);
}
