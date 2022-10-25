import 'package:flutter/material.dart';
import 'package:praetorium/ui/widgets/metric_widget.dart';

/// TODO:
/// - parametrize actions and icon
class MetricsHeaderWidget extends StatelessWidget {
  /// Minimal opacity that will be applied to [baseMetricColor] when building a row with metrics.
  final double minMetricColorOpacity;

  /// Minimal opacity that will be applied to [baseMetricColor] when building a row with metrics.
  final double maxMetricColorOpacity;

  /// Base color that will be used to build gradient-like background colors for metric tiles.
  /// First and last will use [minMetricColorOpacity] and [maxMetricColorOpacity] respectively,
  /// while for those between value of opacity will be calculated in linear way.
  final Color baseMetricColor;
  final String title;
  final String subtitle;
  final List<MapEntry<String, String>>? metrics;

  const MetricsHeaderWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.metrics,
    this.minMetricColorOpacity = 25.0,
    this.maxMetricColorOpacity = 45.0,
    this.baseMetricColor = Colors.black,
  }) : super(key: key);

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
              icon: const Icon(Icons.chevron_left),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      radius: 32.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.account_circle,
                        size: 56.0,
                        color: Colors.black87,
                      ),
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
              icon: const Icon(Icons.edit),
              onPressed: () => {},
            ),
          ],
        ),
        const SizedBox(
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

    if (metrics != null && metrics!.isNotEmpty) {
      double opacityStep = metrics!.length > 1
          ? (maxMetricColorOpacity - minMetricColorOpacity) / (metrics!.length - 1)
          : maxMetricColorOpacity - minMetricColorOpacity;
      double currentOpacity = minMetricColorOpacity;
      for (MapEntry<String, String> me in metrics!) {
        widgets.add(MetricWidget(
          type: me.key,
          value: me.value,
          color: baseMetricColor.withOpacity(currentOpacity / 100.0),
        ));
        currentOpacity += opacityStep;
      }
    }

    return widgets;
  }
}
