import 'dart:developer';
import 'package:fitflow/features/auth/auth_state_new/data/repo/auth_state/authstate.dart';
import 'package:fitflow/features/auth/auth_state_new/data/repo/user_state/userstate.dart';
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
  final userState = ref.watch(userStateProvider);
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/loading',
    redirect: (context, state) {
      return userState.when(data: (user) {
        final user = userState.value != null;
        final authStateFromSupabase = authState.value?.event;
        log(authStateFromSupabase.toString());
        switch (state.matchedLocation) {
          case RouterPath.LOADING:
            if (user) {
              return RouterPath.HOME;
            } else {
              return RouterPath.NOTLOGIN;
            }
          case RouterPath.HOME:
            if (user) {
              return null;
            } else {
              return RouterPath.NOTLOGIN;
            }
          default:
            return null;
        }
      }, error: (e, st) {
        log('error redirect');
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
