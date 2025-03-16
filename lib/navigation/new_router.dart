import 'dart:developer';

import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_email_provider.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_otp_code.dart';
import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_gender_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/auth_main_widget.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/enter_recovery_code_main_widget.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/send_recovery/send_recovery_code_reset_password_main_widget.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/update_pass/update_pass_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/sign_in_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/sign_up_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/age/select_age_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/gender/select_gender_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/goal/select_goal_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/height/select_height_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/level/select_level_main_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/weight/select_weight_main_widget.dart';
import 'package:fitflow/features/background/background_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/home_main_widget.dart';
import 'package:fitflow/features/home/presentation/indicators/age_changer/change_age_main_home_widget.dart';
import 'package:fitflow/features/home/presentation/indicators/height_changer/change_height_main_home_widget.dart';
import 'package:fitflow/features/home/presentation/indicators/weight_changer/change_weight_main_home_widget.dart';
import 'package:fitflow/features/loading/presentation/loading_main_widget.dart';
import 'package:fitflow/features/train/presentation/train_plan/select_train_plan_main_widget.dart';
import 'package:fitflow/navigation/home_navigation_bar/navbar.dart';
import 'package:fitflow/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

@riverpod
GoRouter newRouter(Ref ref) {
  final authStateNew = ref.watch(authStateProvider);
  return GoRouter(
    initialLocation: '/loading',
    redirect: (context, state) {
      return authStateNew.when(data: (stateUser) {
        final status = stateUser.status.name;
        log(status);
        log(state.matchedLocation);
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
      ShellRoute(
          builder: (context, state, child) {
            String name;
            switch (state.fullPath) {
              case '/auth/signin':
                name = 'Авторизация';
                break;
              case '/auth/signin/resetpass' ||
                    '/auth/signin/resetpass/enterrecoverycode' ||
                    '/auth/signin/resetpass/enterrecoverycode/updatepass':
                name = 'Восстановление\nпароля';
                break;
              case '/auth/gender':
                name = 'Выберите пол';
                break;
              case '/auth/gender/weight':
                name = 'Укажите вес';
                break;
              case '/auth/gender/weight/height':
                name = 'Укажите рост';
                break;
              case '/auth/gender/weight/height/age':
                name = 'Укажите возраст';
                break;
              case '/auth/gender/weight/height/age/goal':
                name = 'Какая у вас цель?';
                break;
              case '/auth/gender/weight/height/age/goal/level':
                name = 'Выберите уровень\nподготовки';
                break;
              case '/auth/gender/weight/height/age/goal/level/signup':
                name = 'Создаем ваш аккаунт';
                break;
              default:
                name = '';
                break;
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                forceMaterialTransparency: true,
                backgroundColor: Colors.transparent,
                title: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryFixed,
                    Theme.of(context).colorScheme.secondaryFixed,
                  ]).createShader(bounds),
                  child: Text(
                    name,
                    textScaler: const TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                leading: state.fullPath == RouterPath.NOTLOGIN
                    ? null
                    : IconButton(
                        onPressed: () {
                          switch (state.fullPath) {
                            case '/auth/signin':
                              ref.read(firstImputProvider.notifier).state =
                                  true;
                              ref
                                  .read(isDataSignInValidProvider.notifier)
                                  .state = false;
                              ref.read(emailOrNameProvider.notifier).state = '';
                              ref.read(passwordProvider.notifier).state = '';
                              context.pop();
                            case '/auth/signin/resetpass':
                              ref
                                  .read(emailResetPasswordProvider.notifier)
                                  .state = '';
                              context.pop();
                            case '/auth/signin/resetpass/enterrecoverycode':
                              ref
                                  .read(otpResetPasswordProvider.notifier)
                                  .state = '';
                              context.pop();
                            case '/auth/gender':
                              ref.read(selectGenderProvider.notifier).state = 0;
                              context.pop();
                            case ' /auth/gender/weight/height/age/goal/level/signup':
                              ref.read(emailSignUpProvider.notifier).state = '';
                              ref.read(nameSignUpProvider.notifier).state = '';
                              ref.read(passwordSignUpProvider.notifier).state =
                                  '';
                              ref
                                  .read(passwordRepeatSignUpProvider.notifier)
                                  .state = '';
                              context.pop();
                            default:
                              context.pop();
                          }
                        },
                        icon: ShaderMask(
                            blendMode: BlendMode.srcATop,
                            shaderCallback: (bounds) => LinearGradient(colors: [
                                  Theme.of(context).colorScheme.primaryFixed,
                                  Theme.of(context).colorScheme.secondaryFixed,
                                ]).createShader(bounds),
                            child: Image.asset('assets/leading/arrow.png'))),
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromRGBO(24, 29, 37, 1),
                          Color.fromRGBO(42, 52, 112, 1)
                        ])),
                  ),
                  const BackgroundWidget(),
                  child,
                ],
              ),
            );
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
                    pageBuilder: (context, state) => CustomTransitionPage(
                          child: const SignInMainWidget(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                    routes: [
                      GoRoute(
                          path: RouterPath.RESETPASSWORD,
                          name: RouterPath.RESETPASSWORD,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(
                                  child:
                                      SendRecoveryCodeResetPasswordMainWidget()),
                          routes: [
                            GoRoute(
                                path: RouterPath.ENTERRECOVERYCODETOUPDATEPASS,
                                name: RouterPath.ENTERRECOVERYCODETOUPDATEPASS,
                                pageBuilder: (context, state) =>
                                    CustomTransitionPage(
                                      child: EnterRecoveryCodeMainWidget(
                                        email: state.extra.toString(),
                                      ),
                                      transitionsBuilder: (context, animation,
                                              secondaryAnimation, child) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    ),
                                routes: [
                                  GoRoute(
                                    path: RouterPath.UPDATEPASS,
                                    name: RouterPath.UPDATEPASS,
                                    pageBuilder: (context, state) =>
                                        CustomTransitionPage(
                                      child: UpdatePassMainWidget(
                                        email: state.extra.toString(),
                                      ),
                                      transitionsBuilder: (context, animation,
                                              secondaryAnimation, child) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    ),
                                  )
                                ])
                          ])
                    ]),
                GoRoute(
                    path: RouterPath.GENDER,
                    name: RouterPath.GENDER,
                    pageBuilder: (context, state) => CustomTransitionPage(
                          child: const SelectGenderMainWidget(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                    routes: [
                      GoRoute(
                          path: RouterPath.WEIGHT,
                          name: RouterPath.WEIGHT,
                          pageBuilder: (context, state) => CustomTransitionPage(
                                child: const SelectWeightMainWidget(),
                                transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              ),
                          routes: [
                            GoRoute(
                                path: RouterPath.HEIGHT,
                                name: RouterPath.HEIGHT,
                                pageBuilder: (context, state) =>
                                    CustomTransitionPage(
                                      child: const SelectHeightMainWidget(),
                                      transitionsBuilder: (context, animation,
                                              secondaryAnimation, child) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    ),
                                routes: [
                                  GoRoute(
                                      path: RouterPath.AGE,
                                      name: RouterPath.AGE,
                                      pageBuilder: (context, state) =>
                                          CustomTransitionPage(
                                            child: const SelectAgeMainWidget(),
                                            transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) =>
                                                FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            ),
                                          ),
                                      routes: [
                                        GoRoute(
                                            path: RouterPath.GOAL,
                                            name: RouterPath.GOAL,
                                            pageBuilder: (context, state) =>
                                                CustomTransitionPage(
                                                  child:
                                                      const SelectGoalMainWidget(),
                                                  transitionsBuilder: (context,
                                                          animation,
                                                          secondaryAnimation,
                                                          child) =>
                                                      FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  ),
                                                ),
                                            routes: [
                                              GoRoute(
                                                  path: RouterPath.LEVEL,
                                                  name: RouterPath.LEVEL,
                                                  pageBuilder: (context,
                                                          state) =>
                                                      CustomTransitionPage(
                                                        child:
                                                            const SelectLevelMainWidget(),
                                                        transitionsBuilder:
                                                            (context,
                                                                    animation,
                                                                    secondaryAnimation,
                                                                    child) =>
                                                                FadeTransition(
                                                          opacity: animation,
                                                          child: child,
                                                        ),
                                                      ),
                                                  routes: [
                                                    GoRoute(
                                                      path: RouterPath.SIGNUP,
                                                      name: RouterPath.SIGNUP,
                                                      pageBuilder: (context,
                                                              state) =>
                                                          CustomTransitionPage(
                                                        child:
                                                            const SignUpMainWidget(),
                                                        transitionsBuilder:
                                                            (context,
                                                                    animation,
                                                                    secondaryAnimation,
                                                                    child) =>
                                                                FadeTransition(
                                                          opacity: animation,
                                                          child: child,
                                                        ),
                                                      ),
                                                    )
                                                  ])
                                            ])
                                      ])
                                ])
                          ])
                    ])
              ],
            ),
          ]),
      ShellRoute(
          builder: (context, state, child) {
            String name;
            double fontSize = 20;
            FontWeight fontWeight = FontWeight.w500;
            switch (state.fullPath) {
              case '/home':
                name = 'FIT FLOW';
                fontSize = 36;
                fontWeight = FontWeight.w700;
              default:
                name = '';
                break;
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                forceMaterialTransparency: true,
                backgroundColor: Colors.transparent,
                title: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryFixed,
                    Theme.of(context).colorScheme.secondaryFixed,
                  ]).createShader(bounds),
                  child: Text(
                    name,
                    textScaler: const TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontWeight: fontWeight,
                        fontSize: fontSize,
                        shadows: state.fullPath == '/home'
                            ? [
                                Shadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryFixed
                                        .withOpacity(0.67))
                              ]
                            : null),
                  ),
                ),
                leading: state.fullPath == RouterPath.HOME ||
                        state.fullPath == RouterPath.SEARCHHOME ||
                        state.fullPath == RouterPath.PROGRESSHOME ||
                        state.fullPath == RouterPath.PROFILEHOME
                    ? null
                    : IconButton(
                        onPressed: () {
                          switch (state.fullPath) {
                            default:
                              context.pop();
                          }
                        },
                        icon: ShaderMask(
                            blendMode: BlendMode.srcATop,
                            shaderCallback: (bounds) => LinearGradient(colors: [
                                  Theme.of(context).colorScheme.primaryFixed,
                                  Theme.of(context).colorScheme.secondaryFixed,
                                ]).createShader(bounds),
                            child: Image.asset('assets/leading/arrow.png'))),
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromRGBO(24, 29, 37, 1),
                          Color.fromRGBO(42, 52, 112, 1)
                        ])),
                  ),
                  const BackgroundWidget(),
                  child,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Navbar(
                      onItemChanged: (int newPosition) {
                        switch (newPosition) {
                          case 0:
                            context.goNamed('/home');
                          case 1:
                            context.goNamed('/progresshome');
                          case 2:
                            context.goNamed('/searchhome');
                          case 3:
                            context.goNamed('/profilehome');
                        }
                      },
                      navBarItems: [
                        NavBarData(
                            text: 'Главная',
                            iconPath: 'assets/navbar/home.png'),
                        NavBarData(
                            text: 'Прогресс',
                            iconPath: 'assets/navbar/progress.png'),
                        NavBarData(
                            text: 'Поиск',
                            iconPath: 'assets/navbar/search.png'),
                        NavBarData(
                            text: 'Профиль',
                            iconPath: 'assets/navbar/profile.png')
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          routes: [
            GoRoute(
                path: RouterPath.HOME,
                name: RouterPath.HOME,
                pageBuilder: (context, state) => CustomTransitionPage(
                      child: HomeMainWidget(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
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
              path: RouterPath.PROGRESSHOME,
              name: RouterPath.PROGRESSHOME,
              pageBuilder: (context, state) => CustomTransitionPage(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Text('test1'),
                      ),
                    )
                  ],
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            ),
            GoRoute(
              path: RouterPath.SEARCHHOME,
              name: RouterPath.SEARCHHOME,
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                          child: Text('test2'),
                        ),
                      )
                    ],
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                            opacity: animation,
                            child: child,
                          )),
            ),
            GoRoute(
              path: RouterPath.PROFILEHOME,
              name: RouterPath.PROFILEHOME,
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                          child: Text('test3'),
                        ),
                      )
                    ],
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                            opacity: animation,
                            child: child,
                          )),
            ),
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
