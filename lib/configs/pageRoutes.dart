import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passwordmanager/pages/homePage/homePage.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const Homepage();
      },
    ),
  ],
);
