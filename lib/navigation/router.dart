import 'dart:developer';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/send_recovery/send_recovery_code_reset_password_main_widget.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/enter_recovery_code_main_widget.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/update_pass/update_pass_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/sign_in_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/sign_up_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/age/select_age_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/gender/select_gender_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/goal/select_goal_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/height/select_height_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/level/select_level_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/weight/select_weight_main_widget.dart';
import 'package:fitflow/features/home/presentation/indicators/age_changer/change_age_main_home_widget.dart';
import 'package:fitflow/features/home/presentation/indicators/height_changer/change_height_main_home_widget.dart';
import 'package:fitflow/features/home/presentation/indicators/weight_changer/change_weight_main_home_widget.dart';
import 'package:fitflow/features/train/presentation/train_plan/select_train_plan_main_widget.dart';
import 'package:fitflow/navigation/paths.dart';
import 'package:fitflow/features/auth/presentation/auth_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/home_main_widget.dart';
import 'package:fitflow/features/loading/presentation/loading_widget.dart';
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
        log(status);
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
                      return const SendRecoveryCodeResetPasswordMainWidget();
                    },
                    routes: [
                      GoRoute(
                          path: RouterPath.ENTERRECOVERYCODETOUPDATEPASS,
                          name: RouterPath.ENTERRECOVERYCODETOUPDATEPASS,
                          builder: (context, state) {
                            return EnterRecoveryCodeMainWidget(
                                email: state.extra.toString());
                          },
                          routes: [
                            GoRoute(
                              path: RouterPath.UPDATEPASS,
                              name: RouterPath.UPDATEPASS,
                              builder: (context, state) {
                                return UpdatePassMainWidget(
                                    email: state.extra.toString());
                              },
                            )
                          ])
                    ])
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
                                  return const SelectAgeMainWidget();
                                },
                                routes: [
                                  GoRoute(
                                      path: RouterPath.GOAL,
                                      name: RouterPath.GOAL,
                                      builder: (context, state) {
                                        return const SelectGoalMainWidget();
                                      },
                                      routes: [
                                        GoRoute(
                                            path: RouterPath.LEVEL,
                                            name: RouterPath.LEVEL,
                                            builder: (context, state) {
                                              return const SelectLevelMainWidget();
                                            },
                                            routes: [
                                              GoRoute(
                                                path: RouterPath.SIGNUP,
                                                name: RouterPath.SIGNUP,
                                                builder: (context, state) {
                                                  return const SignUpMainWidget();
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
            return const HomeMainWidget();
          },
          routes: [
            GoRoute(
              path: RouterPath.UPDATEAGE,
              name: RouterPath.UPDATEAGE,
              builder: (context, state) {
                return const ChangeAgeMainHomeWidget();
              },
            ),
            GoRoute(
              path: RouterPath.UPDATEHEIGHT,
              name: RouterPath.UPDATEHEIGHT,
              builder: (context, state) {
                return ChangeHeightMainHomeWidget();
              },
            ),
            GoRoute(
              path: RouterPath.UPDATEWEIGHT,
              name: RouterPath.UPDATEWEIGHT,
              builder: (context, state) {
                return ChangeWeightMainHomeWidget();
              },
            ),
            GoRoute(
              path: RouterPath.SELECTTRAININGPLAN,
              name: RouterPath.SELECTTRAININGPLAN,
              builder: (context, state) {
                return SelectTrainPlanMainWidget();
              },
            )
          ]),
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
