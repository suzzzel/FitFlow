import 'dart:developer';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user_state.dart';
import 'package:fitflow/features/auth/auth_state_new/new_logic/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/sign_in_main_widget.dart';
import 'package:fitflow/navigation/paths.dart';
import 'package:fitflow/features/auth/presentation/auth_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_widget.dart';
import 'package:fitflow/features/loading/presentation/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authStateNew = ref.watch(authStateNEWProvider);

  return GoRouter(
    initialLocation: '/loading',
    redirect: (context, state) {
      return authStateNew.when(data: (stateUser) {
        final status = stateUser.status.name;
        switch (status) {
          case 'auth':
            switch (state.matchedLocation) {
              case RouterPath.LOADING:
                return RouterPath.HOME;
              default:
                return null;
            }
          case 'unauth':
            if (state.matchedLocation == RouterPath.LOADING) {
              return RouterPath.NOTLOGIN;
            } else {
              return null;
            }
          case 'unknown':
            return null;
        }
        return null;
      }, error: (e, st) {
        log('ERROR');
        return null;
      }, loading: () {
        log('loading redirect');
        return null;
      });
    },
    routes: [
      GoRoute(
        path: RouterPath.NOTLOGIN,
        name: RouterPath.NOTLOGIN,
        builder: (context, state) {
          return AuthMainWidget();
        },
        routes: [
          GoRoute(
            path: RouterPath.SIGNIN,
            name: RouterPath.SIGNIN,
            builder: (context, state) {
              return SignInMainWidget();
            },
          ),
          GoRoute(
            path: RouterPath.SIGNUP,
            name: RouterPath.SIGNUP,
            builder: (context, state) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('back to auth\nits register')),
                ),
              );
            },
          )
        ],
      ),
      GoRoute(
        path: RouterPath.HOME,
        name: RouterPath.HOME,
        builder: (context, state) {
          return HomeWidget();
        },
      ),
      GoRoute(
        path: RouterPath.LOADING,
        name: RouterPath.LOADING,
        builder: (context, state) {
          return LoadingWidget();
        },
      ),
    ],
  );
}
