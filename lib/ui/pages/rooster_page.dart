import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:praetorium/i18n/locale_bundle.dart';
import 'package:praetorium/i18n/localization.dart';
import 'package:praetorium/model/model.dart';
import 'package:praetorium/ui/widgets/metrics_header_widget.dart';

final List<Model> models = [
  Model('Dorox-0.4343', 'Vanguard Alpha', 10),
  Model('Actus-1111', 'Skitarii Vanguard', 9),
  Model('Gryphone-Reductus-089', 'Skitarii Ranger', 10),
  Model('Sek-XXVII', 'Vanguard Gunner', 13),
  Model('Tov-66.75/mk98', 'Ranger Gunner', 13),
  Model('Decima-110', 'Skitarii Ranger', 9),
  Model('Mu-575', 'Skitarii Vanguard', 9),
];

final List<MapEntry<String, String>> metricList = [
  const MapEntry('Models', '15'),
  const MapEntry('Detachment', '1'),
  const MapEntry('Points', '150')
];

class RoosterPage extends StatelessWidget {
  const RoosterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
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
                itemBuilder: buildListItem,
                separatorBuilder: (_, __) => const Padding(
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

  Widget buildListItem(BuildContext context, int index) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final LocaleBundle localeBundle = Localization.of(context).bundle;

    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: localeBundle.edit,
            backgroundColor: Colors.green,
            icon: Icons.edit,
            onPressed: (_) => {},
          ),
          SlidableAction(
            label: localeBundle.delete,
            backgroundColor: Colors.redAccent,
            icon: Icons.delete_outline,
            onPressed: (_) => {},
          )
        ],
      ),
      child: ListTile(
        title: Text(
          models[index].name,
          style: textTheme.headline6,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          models[index].type,
          style: textTheme.caption,
        ),
        leading: const CircleAvatar(
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
              localeBundle.pointsShortcut,
              style: textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
