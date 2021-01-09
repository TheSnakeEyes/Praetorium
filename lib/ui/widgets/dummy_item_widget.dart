import 'package:flutter/widgets.dart';

class DummyItemWidget extends StatelessWidget {
  final int index;
  final String text;

  DummyItemWidget({Key key, @required this.index, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text('Item $index $text');

}