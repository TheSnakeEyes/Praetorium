import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:praetorium/model/model.dart';

final List<Model> models = [
  Model('Dorox-0.4343', 'Vanguard Alpha', 10),
  Model('Actus-1111', 'Skitarii Vanguard', 9),
  Model('Gryphone-Reductus-089', 'Skitarii Ranger', 10),
  Model('Sek-XXVII', 'Vanguard Gunner', 13),
  Model('Tov-66.75/mk98', 'Ranger Gunner', 13),
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
            DetailedHeader(),
            Expanded(
              child: ListView.separated(
                itemCount: models.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(models[index].name, style: textTheme.headline6, overflow: TextOverflow.ellipsis,),
                  subtitle: Text(models[index].type, style: textTheme.caption,),
                  leading: CircleAvatar(
                    radius: 16.0,
                    backgroundColor: Colors.amber,
                    child: SizedBox.shrink(),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(models[index].pointValue.toString(), style: textTheme.headline5,),
                      Text('pts', style: textTheme.caption,),
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

class DetailedHeader extends StatelessWidget {
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
                        Icons.account_circle_outlined,
                        size: 48.0,
                        color: Colors.black,
                      ),
                      radius: 32.0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Text(
                    'Gamma-Zhul-881',
                    style: textTheme.headline5,
                  ),
                  Text(
                    'Skitarii Kill Team',
                    style: textTheme.subtitle2,
                  )
                ],
              ),
            ),
            IconButton(
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
          children: [
            MetricWidget(
              type: 'Models',
              value: '15',
              color: Colors.black12,
            ),
            MetricWidget(type: 'Detachment', value: '1', color: Colors.black26),
            MetricWidget(type: 'Points', value: '150', color: Colors.black38),
          ],
        )
      ],
    );
  }
}

class MetricWidget extends StatelessWidget {
  final String type;
  final String value;
  final Color color;

  const MetricWidget({@required this.type, @required this.value, this.color = Colors.transparent, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: textTheme.headline4),
            Text(type, style: textTheme.bodyText2),
          ],
        ),
      ),
    );
  }
}
