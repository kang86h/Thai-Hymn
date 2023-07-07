import 'package:flutter/material.dart';
import 'package:thai_hymn/models/font_size_model.dart';


class QnAPageAppBar extends StatelessWidget {
  const QnAPageAppBar({
    Key? key,
    required this.onPressedBack,
    required this.onPressedMenu,
    required this.fontSize,
  }) : super(key: key);

  final VoidCallback? onPressedBack;
  final VoidCallback? onPressedMenu;

  final FontSizeModel fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1CACE3),
      child: Row(
        children: [
          IconButton(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: onPressedBack,
            padding: const EdgeInsets.only(left: 16),
            icon: Icon(
              Icons.arrow_back,
              size: 32,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              'Q & A',
              style: TextStyle(fontFamily: 'angsana', fontSize: fontSize.appBarTitle, color: Colors.white),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: onPressedMenu,
            padding: const EdgeInsets.only(right: 16),
            icon: Icon(
              Icons.menu,
              size: 32,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
