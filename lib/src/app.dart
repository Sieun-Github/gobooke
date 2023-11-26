import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gobooke/src/imsi/detail.dart';
import 'package:gobooke/src/imsi/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: '/detail',
          builder: (context, state) => const Detail(),
        ),
      ],
      initialLocation: '/',
    );
    //route
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
