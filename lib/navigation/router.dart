import 'dart:developer';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/reset_password_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/sign_in_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/sign_up_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/age/select_age_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/gender/select_gender_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/goal/select_goal_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/height/select_height_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/level/select_level_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/weight/select_weight_main_widget.dart';
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
  final authStateNew = ref.watch(authStateProvider);

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
          return const AuthMainWidget();
        },
        routes: [
          GoRoute(
              path: RouterPath.SIGNIN,
              name: RouterPath.SIGNIN,
              builder: (context, state) {
                return const SignInMainWidget();
              },
              routes: [
                GoRoute(
                  path: RouterPath.RESETPASSWORD,
                  name: RouterPath.RESETPASSWORD,
                  builder: (context, state) {
                    return ResetPasswordMainWidget();
                  },
                )
              ]),
          GoRoute(
              path: RouterPath.GENDER,
              name: RouterPath.GENDER,
              builder: (context, state) {
                return const SelectGenderMainWidget();
              },
              routes: [
                GoRoute(
                    path: RouterPath.WEIGHT,
                    name: RouterPath.WEIGHT,
                    builder: (context, state) {
                      return const SelectWeightMainWidget();
                    },
                    routes: [
                      GoRoute(
                          path: RouterPath.HEIGHT,
                          name: RouterPath.HEIGHT,
                          builder: (context, state) {
                            return const SelectHeightMainWidget();
                          },
                          routes: [
                            GoRoute(
                                path: RouterPath.AGE,
                                name: RouterPath.AGE,
                                builder: (context, state) {
                                  return SelectAgeMainWidget();
                                },
                                routes: [
                                  GoRoute(
                                      path: RouterPath.GOAL,
                                      name: RouterPath.GOAL,
                                      builder: (context, state) {
                                        return SelectGoalMainWidget();
                                      },
                                      routes: [
                                        GoRoute(
                                            path: RouterPath.LEVEL,
                                            name: RouterPath.LEVEL,
                                            builder: (context, state) {
                                              return SelectLevelMainWidget();
                                            },
                                            routes: [
                                              GoRoute(
                                                path: RouterPath.SIGNUP,
                                                name: RouterPath.SIGNUP,
                                                builder: (context, state) {
                                                  return SignUpMainWidget();
                                                },
                                              )
                                            ])
                                      ])
                                ])
                          ])
                    ])
              ])
        ],
      ),
      GoRoute(
        path: RouterPath.HOME,
        name: RouterPath.HOME,
        builder: (context, state) {
          return const HomeWidget();
        },
      ),
      GoRoute(
        path: RouterPath.LOADING,
        name: RouterPath.LOADING,
        builder: (context, state) {
          return const LoadingWidget();
        },
      ),
    ],
  );
}
