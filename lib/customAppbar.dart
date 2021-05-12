import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFEBEAEF),
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      leading: IconButton(
        iconSize: 19,
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios_sharp),
      ),
      title: Text("Cart", style: TextStyle(color: Colors.black, fontSize: 16)),
      centerTitle: true,
      actions: [
        IconButton(
          iconSize: 19,
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
