import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/config/locator_config.dart';
import 'package:praetorium/services/navigator_service.dart';
import 'package:praetorium/theme.dart';
import 'package:praetorium/ui/pages/my_home_page.dart';
import 'package:praetorium/ui/pages/teams_list_page.dart';

import 'bloc/global_bloc.dart';
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

  MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GlobalBloc())
      ],
      child: MaterialApp(
        navigatorKey: _navigatorService.navigatorKey,
        title: 'Praetorium',
        localizationsDelegates: const [
          LocalizationDelegate(),
        ],
        supportedLocales: LocalizationDelegate.supportedLocales,
        theme: buildTheme(),
        home: TeamsListPage(), //const MyHomePage(),
      ),
    );
  }
}
