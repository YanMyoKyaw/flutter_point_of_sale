import 'package:flutter/material.dart';

typedef OnPress();

class SecondButton extends StatelessWidget {
  SecondButton(
      {@required this.title,
      @required this.width,
      this.onPress,
      this.icon,
      this.margin,
      this.height});
  final String title;
  final IconData icon;
  final double width, height;
  final OnPress onPress;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height != null ? height : 50,
      margin: margin,
      child: OutlineButton(
        textColor: Colors.green,
        borderSide: BorderSide(
          color: Colors.green,
          style: BorderStyle.solid,
          width: 1,
        ),
        onPressed: () {
          onPress();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Icon(icon) : SizedBox(),
            SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
