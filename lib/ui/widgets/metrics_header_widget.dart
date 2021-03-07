import 'package:flutter/material.dart';
import 'package:praetorium/ui/widgets/metric_widget.dart';

class MetricsHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<MapEntry<String, String>> metrics;

  const MetricsHeaderWidget({Key key, @required this.title, @required this.subtitle, this.metrics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.account_circle,
                        size: 56.0,
                        color: Colors.black87,
                      ),
                      radius: 32.0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.headline5,
                  ),
                  Text(
                    subtitle,
                    style: textTheme.subtitle2,
                  )
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              icon: Icon(Icons.edit),
              onPressed: () => {},
            ),
          ],
        ),
        SizedBox(
          height: 32.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: metricWidgets(),
        )
      ],
    );
  }

  List<Widget> metricWidgets() {
    List<MetricWidget> widgets = [];

    if (metrics != null && metrics.isNotEmpty) {
      Color baseColor = Colors.black;
      double minOpacity = 25.0, maxOpacity = 45.0;
      double opacityStep =
      metrics.length > 1 ? (maxOpacity - minOpacity) / (metrics.length - 1) : maxOpacity - minOpacity;
      double currentOpacity = minOpacity;
      for (MapEntry<String, String> me in metrics) {
        widgets.add(MetricWidget(
          type: me.key,
          value: me.value,
          color: baseColor.withOpacity(currentOpacity / 100.0),
        ));
        currentOpacity += opacityStep;
      }
    }

    return widgets;
  }
}