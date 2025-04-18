import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/theme_config.dart';

canPopScreen(BuildContext context) {
  return context.canPop();
}

popScreen(BuildContext context, {Object? result}) {
  if (canPopScreen(context)) {
    context.pop(result);
  }
}

switchScreen({
  required BuildContext context,
  required String routeName,
  Map<String, String>? pathParameters,
  Map<String, dynamic>? queryParameters,
  Object? extra,
  bool popAndPush = false,
}) {
  popAndPush
      ? context.goNamed(
          routeName,
          pathParameters: pathParameters ?? <String, String>{},
          queryParameters: queryParameters ?? <String, dynamic>{},
          extra: extra,
        )
      : context.pushNamed(
          routeName,
          pathParameters: pathParameters ?? <String, String>{},
          queryParameters: queryParameters ?? <String, dynamic>{},
          extra: extra,
        );
}

class AppRouter extends StatelessWidget {
  final String location;

  AppRouter({
    super.key,
    required this.location,
  }) {
    (context, state) => const MaterialPage(
          key: ValueKey('errorPage'),
          child: Scaffold(
            body: Center(
              child: Text("Error Page."),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeConfig().darkTheme,
      theme: ThemeConfig().lightTheme,
      themeMode: ThemeMode.light,
      title: 'Terra',
      routerConfig: createRoute(),
    );
  }

  GoRouter createRoute() {
    return GoRouter(
      initialLocation: '/$location',
      // initialLocation: '/${AppRoutes.listingDetail}',
      routes: routes,
      // initialExtra: "221aadf9-b3a1-4ff9-b163-361e916a2ab4"
    );
  }
}
