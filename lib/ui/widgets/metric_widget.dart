import 'package:flutter/material.dart';

class MetricWidget extends StatelessWidget {
  final String type;
  final String value;
  final Color color;

  const MetricWidget({required this.type, required this.value, this.color = Colors.transparent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: textTheme.headline5),
            Text(type, style: textTheme.caption),
          ],
        ),
      ),
    );
  }
}