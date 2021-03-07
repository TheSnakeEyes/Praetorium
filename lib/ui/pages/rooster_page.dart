import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:praetorium/model/model.dart';
import 'package:praetorium/ui/widgets/metrics_header_widget.dart';

final List<Model> models = [
  Model('Dorox-0.4343', 'Vanguard Alpha', 10),
  Model('Actus-1111', 'Skitarii Vanguard', 9),
  Model('Gryphone-Reductus-089', 'Skitarii Ranger', 10),
  Model('Sek-XXVII', 'Vanguard Gunner', 13),
  Model('Tov-66.75/mk98', 'Ranger Gunner', 13),
];

final List<MapEntry<String, String>> metricList = [
  MapEntry('Models', '15'),
  MapEntry('Detachment', '1'),
  MapEntry('Points', '150')
];

class RoosterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            MetricsHeaderWidget(
              title: 'Gamma-Zhul-881',
              subtitle: 'Skitarii Kill Team',
              metrics: metricList,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: models.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(
                    models[index].name,
                    style: textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    models[index].type,
                    style: textTheme.caption,
                  ),
                  leading: CircleAvatar(
                    radius: 16.0,
                    backgroundColor: Colors.amber,
                    child: SizedBox.shrink(),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        models[index].pointValue.toString(),
                        style: textTheme.headline5,
                      ),
                      Text(
                        'pts',
                        style: textTheme.caption,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
