import 'package:flutter/material.dart';

typedef OnPress();

class MainButton extends StatelessWidget {
  MainButton(
      {@required this.width,
      @required this.title,
      this.margin,
      this.onPress,
      this.icon});
  final double width;
  final String title;
  final OnPress onPress;
  final EdgeInsetsGeometry margin;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      margin: margin,
      child: RaisedButton(
        onPressed: () {
          onPress();
        },
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : SizedBox(),
            SizedBox(
              width: 10,
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
