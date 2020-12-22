import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/bloc/dummy_bloc.dart';
import 'package:praetorium/config/locator_config.dart';
import 'package:praetorium/services/navigator_service.dart';
import 'package:praetorium/ui/pages/my_home_page.dart';

import 'i18n/localization.dart';

void main() => runApp(initialize());

Widget initialize() {
  initializeLocator();

  return MainWidget();
}

/// Entry point
/// TODO:
/// - custom error handling / reporting
/// - route builder for reducing potential boilerplate between pages if we want to have some common elements (eg. bottom navigation)
class MainWidget extends StatelessWidget {
  final NavigatorService _navigatorService = locator.get<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DummyBloc())
      ],
      child: MaterialApp(
        navigatorKey: _navigatorService.navigatorKey,
        title: 'Praetorium',
        localizationsDelegates: [
          LocalizationDelegate(),
        ],
        supportedLocales: LocalizationDelegate.supportedLocales,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.amber,
            accentColor: Colors.black,
            fontFamily: 'Caslon Antique'),
        home: MyHomePage(),
      ),
    );
  }
}
