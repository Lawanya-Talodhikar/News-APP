import 'package:flutter/material.dart';
import 'package:techie/Utils/colors.dart';

import '../Utils/text.dart';
class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Appcolors.black,
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'Tech', size: 20, color: Colors.purple),
              boldText(text: 'Newz', size: 20, color: Appcolors.lightwhiteColor)
            ],
          )),
      centerTitle: true,
    );
  }
}