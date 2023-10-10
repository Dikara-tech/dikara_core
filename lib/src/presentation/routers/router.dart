import 'package:auto_route/auto_route.dart';
import 'package:dikara_core/src/presentation/features/features.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Router')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/success',
      page: SuccessRouter.page,
    ),
  ];
}
