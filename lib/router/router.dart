import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
      ],
    ),
  ],
);
