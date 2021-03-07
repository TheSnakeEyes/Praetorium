import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:praetorium/config/locator_config.dart';
import 'package:praetorium/i18n/localization.dart';
import 'package:praetorium/services/navigator_service.dart';
import 'package:praetorium/ui/pages/dummy_page.dart';
import 'package:praetorium/ui/pages/global_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Faker _faker = Faker();
  final NavigatorService _navigatorService = locator.get<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.of(context).bundle.homePageTitle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_faker.lorem.sentence()),
            Text(
              _faker.lorem.sentences(2).join('\n'),
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(_faker.lorem.sentences(3).join('\n'), style: TextStyle(fontWeight: FontWeight.bold)),
            // TODO: discuss whether we want to expose navigation or rather define it with page-specific BLoC that exposes more abstract (business specific) method
            TextButton(
              onPressed: () => _navigatorService.push((_) => DummyPage()),
              child: Text('Press me...'),
            ),
            TextButton(
              onPressed: () => _navigatorService.push((_) => GlobalPage()),
              child: Text('.. or press me'),
            ),
          ],
        ),
      ),
    );
  }
}
