import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final Color? color;

  const DividerWidget({Key? key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color == null
          ? Theme.of(context).hintColor.withOpacity(.2)
          : Theme.of(context).primaryColorLight,
    );
  }
}

class DividerVertical extends StatelessWidget {
  final Color? color;

  const DividerVertical({Key? key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: color == null
          ? Theme.of(context).hintColor.withOpacity(.2)
          : Theme.of(context).primaryColorLight,
    );
  }
}
