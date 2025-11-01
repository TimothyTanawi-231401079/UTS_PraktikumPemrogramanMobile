import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/ready_count_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/finish_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String ready = '/ready';
  static const String quiz = '/quiz';
  static const String finish = '/finish';
}

GoRouter createRouter() {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.ready,
        name: 'ready',
        builder: (context, state) => ReadyCountScreen(),
      ),
      GoRoute(
          path: '${AppRoutes.quiz}/:id',
          name: 'quiz',
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return QuizScreen(id: id);
          }
      ),
      GoRoute(
          path: '${AppRoutes.finish}/:nama',
          name: 'finish',
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) {
            final nama = state.pathParameters['nama'] ?? '';
            return FinishScreen(nama: nama);
          }
      ),

    ],
    // errorBuilder: (context, state) => Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Icon(Icons.error, size: 64, color: Colors.red),
    //         const SizedBox(height: 16),
    //         Text(
    //           '404 - Page Not Found',
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //         const SizedBox(height: 8),
    //         Text('Path: ${state.uri.path}'),
    //         const SizedBox(height: 16),
    //         ElevatedButton(
    //           onPressed: () => context.go(AppRoutes.home),
    //           child: const Text('Go Home'),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  );
}