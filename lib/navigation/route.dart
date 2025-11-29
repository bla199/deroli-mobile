/*
This file manages routes of the app

we're using go_router to manage app navigation

from this file we maintain all of the app routes
*/

import 'package:deroli_mobile/navigation/routes.dart';
import 'package:deroli_mobile/navigation/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // Constructor with app state manager and user type manager

  // routes key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // define route variable to hold GoRouter instance
  // this route has configs and list of all routes
  late final GoRouter router = GoRouter(
    // configs
    debugLogDiagnostics: false, // false in production
    // todo: add state manager that the route will listen to
    // refreshListenable: appStateManager,
    initialLocation: '/bottom_navigation',
    navigatorKey: _rootNavigatorKey,

    // pages error handle, this page is used when specified url is unvailable
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
              // style: Styles.normalText(context),
            ),
          ),
        ),
      );
    },

    // list of app routes
    routes: routes,

    // navigation redirection
    redirect: (context, state) {
      // check if user is loggedin
      // final loggedIn = appStateManager.isLoggedIn;

      // // check location of user, see if user is in login stage or otp stage
      // final loggingIn =
      //     state.fullPath == '/welcome' ||
      //     state.fullPath == "/code-verification" ||
      //     state.fullPath == '/login';

      // // redirect user to login page if not loggedin
      // if (!loggedIn) return loggingIn ? null : '/welcome';

      // Check user type for redirection
      // Note: We don't redirect here because we handle it in the code_verification.dart file
      // This is because we need to navigate to different screens based on user type
      // after login, and the navigation is handled there.

      // return null to stop redirect
      return null;
    },
  );
}
