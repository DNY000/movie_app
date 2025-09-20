import 'package:go_router/go_router.dart';
import 'package:loadmore/data/datasources/local/shared_pref.dart';
import 'package:loadmore/presentation/pages/authentication/screens/login.dart';
import 'package:loadmore/presentation/pages/home/detail_movie_screen.dart';
import 'package:loadmore/presentation/pages/home/home.dart';
import 'package:loadmore/presentation/pages/home/setup_account_screen.dart';
import 'package:loadmore/presentation/pages/movie/seats_screen.dart';
import 'package:loadmore/presentation/pages/navigator_bar.dart';
import 'package:loadmore/presentation/pages/onboarding/onboarding.dart';
import 'package:loadmore/presentation/pages/splash.dart';
import 'package:loadmore/presentation/routes/name_router.dart';

class AppRouter {
  //  final AuthState authState;

  // AppRouter(this.authState);
  GoRouter get appRouter => router;

  static final router = GoRouter(
    initialLocation: NameRouter.splash,
    redirect: (context, state) {
      final bool isOnboarded =
          AppPreferences.instance.get<bool>('isOnboarded') ?? false;
      final bool isLoggedIn =
          AppPreferences.instance.get<bool>('isLogin') ?? false;

      final String current = state.fullPath ?? state.matchedLocation;

      // Allow splash to decide next, but still protect direct deep links
      final bool goingToSplash = current == NameRouter.splash;
      final bool goingToLogin = current == NameRouter.login;
      final bool goingToOnboarding = current == NameRouter.onboarding;

      if (!isOnboarded && !goingToOnboarding && !goingToSplash) {
        return NameRouter.onboarding;
      }

      if (isOnboarded && !isLoggedIn && !goingToLogin && !goingToSplash) {
        return NameRouter.login;
      }

      if (isLoggedIn && (goingToLogin || goingToOnboarding)) {
        return NameRouter.setupAccount;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: NameRouter.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NameRouter.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: NameRouter.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: NameRouter.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: NameRouter.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: NameRouter.setupAccount,
        builder: (context, state) => const SetupAccountScreen(),
      ),
      GoRoute(
        path: NameRouter.detailMovie,
        builder: (context, state) => const DetailMovieScreen(),
      ),
      GoRoute(
        path: NameRouter.seats,
        builder: (context, state) => const SeatsScreen(),
      ),
    ],
  );
}
