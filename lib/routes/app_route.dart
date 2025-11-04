import 'package:go_router/go_router.dart';
import 'package:pg/screens/name_screen.dart';
import 'package:pg/screens/quizz_screen.dart';
import 'package:pg/screens/result_screen.dart';
import 'package:pg/screens/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/name', builder: (context, state) => const NameScreen()),
      GoRoute(path: '/quiz', builder: (context, state) => const QuizScreen()),
      GoRoute(path: '/result', builder: (context, state) => const ResultScreen()),
    ],
  );
}
