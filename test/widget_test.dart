import 'package:flutter_test/flutter_test.dart';

import 'package:praetorium/main.dart';

void main() {
  testWidgets('Widget build test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MainWidget());
  });
}
