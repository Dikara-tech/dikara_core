import 'package:dikara_core/dikara_core.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InternalModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();
}
