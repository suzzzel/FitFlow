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
import 'package:fitflow/features/profile/presentation/profile_main_widget.dart';
import 'package:fitflow/features/progress/presentation/main_progress_main_widget.dart';
import 'package:fitflow/features/search/presentation/search_ex_main_widget.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/select_weekday_to_train/select_weekday_to_train_widget.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/view_custom_plan/view_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/ready_plan_way/select_ready_plan_main_widget.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/select_way_of_creating_train_plan_main_widget.dart';
import 'package:fitflow/features/home/home_main_widget.dart';
import 'package:fitflow/features/profile/presentation/indicators_view/age_changer/change_age_main_home_widget.dart';
import 'package:fitflow/features/profile/presentation/indicators_view/height_changer/change_height_main_home_widget.dart';
import 'package:fitflow/features/profile/presentation/indicators_view/weight_changer/change_weight_main_home_widget.dart';
import 'package:fitflow/features/loading/presentation/loading_main_widget.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/edit_day_in_plan_main_widget.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/view_done_plan_main_widget.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/do_the_train_main_widget.dart';
import 'package:fitflow/features/train/do_the_train/presentation/exit_train_before_end/exit_the_train.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/bad_result/view_bad_result.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/view_good_result.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/view_temp_progress.dart';
import 'package:fitflow/navigation/home_navigation_bar/navbar.dart';
import 'package:fitflow/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
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
            if (stateUser.user!.isTrainGo == true &&
                state.fullPath != '/trainnow/tempprogress' &&
                state.fullPath != '/trainnow/emptycompletetrain' &&
                state.fullPath != '/trainnow/completetrain') {
              log('redirect this');
              return RouterPath.TRAININGNOW;
            } else {
              switch (state.matchedLocation) {
                case RouterPath.LOADING:
                  return RouterPath.HOME;
                default:
                  return null;
              }
            }
          case 'userUpdate':
            if (state.fullPath == '/loading') {
              return RouterPath.PROFILEHOME;
            } else {
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
                                        recoveryCodeText:
                                            'Если к этому адресу электронной почты\nпривязана учетная запись,\nмы отправили на него 6-значный код\nдля подтверждения.',
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
              case '/progresshome':
                name = 'Прогресс';
                fontSize = 24;
                fontWeight = FontWeight.w700;
              case '/searchhome':
                name = 'Поиск';
                fontSize = 24;
                fontWeight = FontWeight.w700;
              case '/profilehome':
                name = 'Мой профиль';
                fontSize = 20;
                fontWeight = FontWeight.w500;
              case '/home/newtrainplan':
                name = 'Выберите существующий план\nили составьте личный';
                fontSize = 20;
                fontWeight = FontWeight.w500;
              case '/home/newtrainplan/readytrainplan':
                name = 'FIT FLOW';
                fontSize = 36;
                fontWeight = FontWeight.w700;
              case '/home/newtrainplan/readytrainplan/viewselectedplan':
                name = 'FIT FLOW';
                fontSize = 36;
                fontWeight = FontWeight.w700;
              case '/home/newtrainplan/readytrainplan/viewselectedplan/editdayinplan':
                name = 'Редкатировать план\nтренировки';
                fontSize = 20;
                fontWeight = FontWeight.w700;
              case '/home/newtrainplan/readytrainplan/viewselectedplan/editdayinplan/findnewexercisewheneditplan':
                name = 'Найти упражнение';
                fontSize = 20;
                fontWeight = FontWeight.w700;
              case '/home/newtrainplan/customtrainplan':
                name = 'Выберите дни\nтренировок';
                fontSize = 20;
                fontWeight = FontWeight.w700;
              default:
                name = ' ';
                break;
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                forceMaterialTransparency: true,
                backgroundColor: Colors.transparent,
                leadingWidth: 35,
                title: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryFixed,
                    Theme.of(context).colorScheme.secondaryFixed,
                  ]).createShader(bounds),
                  child: SizedBox(
                    child: FittedBox(
                      child: Text(
                        name,
                        textScaler: const TextScaler.linear(1),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontWeight: fontWeight,
                            fontSize: fontSize,
                            shadows: state.fullPath == '/home' ||
                                    state.fullPath ==
                                        '/home/newtrainplan/readytrainplan' ||
                                    state.fullPath ==
                                        '/home/newtrainplan/readytrainplan/viewselectedplan'
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
                            case '/home/newtrainplan/readytrainplan/viewselectedplan/editdayinplan':
                              context.goNamed('viewselectedplan', extra: {
                                'isPlanBeenChanged': true,
                              });
                            case '/home/newtrainplan/customtrainplan/viewcustomplan':
                              ref.read(tempTrainPlanProvider.notifier).reset();
                              ref
                                  .read(
                                      selectWeekdayCustomPlanProvider.notifier)
                                  .reset();
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
                  state.fullPath == RouterPath.HOME ||
                          state.fullPath == RouterPath.SEARCHHOME ||
                          state.fullPath == RouterPath.PROGRESSHOME ||
                          state.fullPath == RouterPath.PROFILEHOME
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: NavBar(
                              onItemChanged: (int newPosition) {
                                _onNavItemTapped(newPosition, context);
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
                              currentIndex:
                                  _getCurrentIndex(state.fullPath.toString())))
                      : const SizedBox()
                ],
              ),
            );
          },
          routes: [
            GoRoute(
                path: RouterPath.HOME,
                name: RouterPath.HOME,
                pageBuilder: (context, state) => CustomTransitionPage(
                      child: const HomeMainWidget(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                routes: [
                  GoRoute(
                      path: RouterPath.SELECTTRAININGPLAN,
                      name: RouterPath.SELECTTRAININGPLAN,
                      pageBuilder: (context, state) => CustomTransitionPage(
                            child:
                                const SelectWayOfCreatingTrainPlanMainWidget(),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          ),
                      routes: [
                        GoRoute(
                            path: RouterPath.SELECTREADYTRAININGPLAN,
                            name: RouterPath.SELECTREADYTRAININGPLAN,
                            pageBuilder: (context, state) =>
                                CustomTransitionPage(
                                  child: const SelectReadyPlanMainWidget(),
                                  transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                ),
                            routes: [
                              GoRoute(
                                  path: RouterPath.VIEWSELECTEDPLAN,
                                  name: RouterPath.VIEWSELECTEDPLAN,
                                  pageBuilder: (context, state) {
                                    final Map<String, dynamic> param =
                                        state.extra as Map<String, dynamic>;
                                    return CustomTransitionPage(
                                      child: ViewDonePlanMainWidget(
                                        isPlanBeenChanged:
                                            param['isPlanBeenChanged'],
                                        listOfDaysReadyPlan:
                                            param['listOfTrainDays'],
                                      ),
                                      transitionsBuilder: (context, animation,
                                              secondaryAnimation, child) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  routes: [
                                    GoRoute(
                                        path: RouterPath.EDITDAYINPLAN,
                                        name: RouterPath.EDITDAYINPLAN,
                                        pageBuilder: (context, state) {
                                          final Map<String, dynamic> param =
                                              state.extra
                                                  as Map<String, dynamic>;
                                          return CustomTransitionPage(
                                            child: EditDayInPlanMainWidget(
                                              weekday: param['weekday'],
                                              dir: param['dir'],
                                            ),
                                            transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) =>
                                                FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            ),
                                          );
                                        },
                                        routes: [
                                          GoRoute(
                                            path: RouterPath
                                                .FINDNEWEXERCISEWHENEDITPLAN,
                                            name: RouterPath
                                                .FINDNEWEXERCISEWHENEDITPLAN,
                                            pageBuilder: (context, state) {
                                              final Map<String, dynamic> param =
                                                  state.extra
                                                      as Map<String, dynamic>;
                                              return NoTransitionPage(
                                                  child: SearchExMainWidget(
                                                isPlanEdit: true,
                                                weekday: param['weekday'],
                                                exerciseToDelete:
                                                    param['exToDelete'],
                                              ));
                                            },
                                          ),
                                        ]),
                                  ]),
                            ]),
                        GoRoute(
                            path: RouterPath.SELECTCUSTOMTRAININGPLAN,
                            name: RouterPath.SELECTCUSTOMTRAININGPLAN,
                            pageBuilder: (context, state) {
                              return const NoTransitionPage(
                                  child: SelectWeekdayToTrainWidget());
                            },
                            routes: [
                              GoRoute(
                                  path: RouterPath.VIEWCUSTOMPLAN,
                                  name: RouterPath.VIEWCUSTOMPLAN,
                                  pageBuilder: (context, state) {
                                    // ignore: prefer_const_constructors
                                    return NoTransitionPage(
                                        // ignore: prefer_const_constructors
                                        child: ViewCustomPlan());
                                  },
                                  routes: [
                                    GoRoute(
                                      path: RouterPath
                                          .FINDNEWEXERCISEINCUSTOMPLAN,
                                      name: RouterPath
                                          .FINDNEWEXERCISEINCUSTOMPLAN,
                                      pageBuilder: (context, state) {
                                        final Map<String, dynamic> param =
                                            state.extra as Map<String, dynamic>;
                                        return NoTransitionPage(
                                            child: SearchExMainWidget(
                                          isPlanEdit: true,
                                          weekday: param['weekday'],
                                          exerciseToDelete: param['exToDelete'],
                                        ));
                                      },
                                    ),
                                    GoRoute(
                                      path: RouterPath.EDITDAYINCUSTOMPLAN,
                                      name: RouterPath.EDITDAYINCUSTOMPLAN,
                                      pageBuilder: (context, state) {
                                        final Map<String, dynamic> param =
                                            state.extra as Map<String, dynamic>;
                                        return CustomTransitionPage(
                                          child: EditDayInPlanMainWidget(
                                            weekday: param['weekday'],
                                            dir: param['dir'],
                                          ),
                                          transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) =>
                                              FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                        );
                                      },
                                    ),
                                  ]),
                            ])
                      ])
                ]),
            GoRoute(
              path: RouterPath.PROGRESSHOME,
              name: RouterPath.PROGRESSHOME,
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const MainProgressMainWidget(),
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
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                      child: const SearchExMainWidget(
                        isPlanEdit: false,
                        weekday: null,
                        exerciseToDelete: null,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              ));
                }),
            GoRoute(
                path: RouterPath.PROFILEHOME,
                name: RouterPath.PROFILEHOME,
                pageBuilder: (context, state) => CustomTransitionPage(
                    // ignore: prefer_const_constructors
                    child: ProfileMainWidget(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(
                              opacity: animation,
                              child: child,
                            )),
                routes: [
                  GoRoute(
                      path: RouterPath.UPDATEAGE,
                      name: RouterPath.UPDATEAGE,
                      pageBuilder: (context, state) => const NoTransitionPage(
                          child: ChangeAgeMainHomeWidget())),
                  GoRoute(
                    path: RouterPath.UPDATEHEIGHT,
                    name: RouterPath.UPDATEHEIGHT,
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child: ChangeHeightMainHomeWidget()),
                  ),
                  GoRoute(
                    path: RouterPath.UPDATEWEIGHT,
                    name: RouterPath.UPDATEWEIGHT,
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child: ChangeWeightMainHomeWidget()),
                  ),
                  GoRoute(
                      path: RouterPath.ENTERRECOVERYCODEINPROFILE,
                      name: RouterPath.ENTERRECOVERYCODEINPROFILE,
                      pageBuilder: (context, state) => NoTransitionPage(
                              child: EnterRecoveryCodeMainWidget(
                            email: state.extra.toString(),
                            recoveryCodeText:
                                'На ваш адрес электронной почты,\nк которой привязана учетная запись,\nотправлен 6 - значный код\nдля подтверждения смены пароля.',
                          )),
                      routes: [
                        GoRoute(
                          path: RouterPath.UPDATEPASSINPROFILE,
                          name: RouterPath.UPDATEPASSINPROFILE,
                          pageBuilder: (context, state) => CustomTransitionPage(
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
      ShellRoute(
          builder: (context, state, child) {
            String name;
            double fontSize = 20;
            FontWeight fontWeight = FontWeight.w500;
            switch (state.fullPath) {
              case '/trainnow/tempprogress':
                name = 'Тренировка';
              case '/trainnow/emptycompletetrain':
                name = 'Тренировка пропущена';
              case '/trainnow/completetrain':
                name = 'Поздравляем!';
              default:
                name = 'Тренировка';
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                forceMaterialTransparency: true,
                backgroundColor: Colors.transparent,
                leadingWidth: 35,
                leading: state.fullPath == RouterPath.TRAININGNOW
                    ? IconButton(
                        onPressed: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) => const ExitTheTrainButton(),
                          );
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ))
                    : null,
                actions: state.fullPath == RouterPath.TRAININGNOW
                    ? [
                        IconButton(
                            onPressed: () {
                              showAdaptiveDialog(
                                  context: context,
                                  builder: (context) =>
                                      const ViewTempProgressMainWidget());
                            },
                            icon: const Icon(
                              Icons.visibility_outlined,
                              color: Colors.purple,
                            ))
                      ]
                    : [],
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
                        shadows: [
                          Shadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryFixed
                                  .withOpacity(0.67))
                        ]),
                  ),
                ),
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
                path: RouterPath.TRAININGNOW,
                name: RouterPath.TRAININGNOW,
                pageBuilder: (context, state) => CustomTransitionPage(
                    // ignore: prefer_const_constructors
                    child: DoTheTrainMainWidget(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(
                              opacity: animation,
                              child: child,
                            )),
                routes: [
                  GoRoute(
                    path: RouterPath.COMPLETETRAIN,
                    name: RouterPath.COMPLETETRAIN,
                    pageBuilder: (context, state) => CustomTransitionPage(
                        child: const ViewGoodResultWidget(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                )),
                  ),
                  GoRoute(
                    path: RouterPath.EMPTYCOMPLETETRAIN,
                    name: RouterPath.EMPTYCOMPLETETRAIN,
                    pageBuilder: (context, state) => CustomTransitionPage(
                        child: const ViewBadResultWidget(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                )),
                  )
                ])
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

// Для навигационного бара
int _getCurrentIndex(String location) {
  switch (location) {
    case '/home':
      return 0;
    case '/progresshome':
      return 1;
    case '/searchhome':
      return 2;
    case '/profilehome':
      return 3;
    default:
      return 0;
  }
}

// Для навигационного бара
void _onNavItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      context.goNamed('/home');
    case 1:
      context.goNamed('/progresshome');
    case 2:
      context.goNamed('/searchhome');
    case 3:
      context.goNamed('/profilehome');
  }
}
