import 'package:flutter/material.dart';

/// Central point for navigation logic, allowing for context-independent routing
/// TODO:
/// - make push methods accept wider Route definition-type object
/// - allow handling pop / return callbacks
class NavigatorService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void push(WidgetBuilder pageBuilder) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: pageBuilder));
  }
}