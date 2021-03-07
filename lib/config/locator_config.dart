import 'package:get_it/get_it.dart';
import 'package:praetorium/services/navigator_service.dart';

final GetIt locator = GetIt.instance;

/// Initialization logic for DI Container
/// Retrieval: T objectInstance = locator.get<T>();
void initializeLocator() {
  locator.registerSingleton<NavigatorService>(NavigatorService());
}