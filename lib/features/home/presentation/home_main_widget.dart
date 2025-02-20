import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/home/domain/providers/home_quotes_domain_provider.dart';
import 'package:fitflow/features/home/presentation/avatar_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMainWidget extends ConsumerWidget {
  const HomeMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    final quoteDay = ref.watch(homeQuotesDataProviderAsyncProvider);
    return Scaffold(
        body: Stack(
      children: [
        welcome_widget(user: user),
        Padding(
          padding: const EdgeInsets.only(top: 203),
          child: ListView(
            padding: const EdgeInsets.only(top: 30),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.8)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 39, right: 39, top: 23, bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                                  width: 49,
                                  height: 49,
                                  child: const Icon(
                                    Icons.person,
                                    size: 36,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 37,
                                height: 22,
                                child: FittedBox(
                                  child: Text('${user.weight.toString()} кг',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ),
                              ),
                              SizedBox(
                                width: 28,
                                height: 22,
                                child: FittedBox(
                                  child: Text(
                                    'Вес',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                                  width: 49,
                                  height: 49,
                                  child: const Icon(
                                    Icons.person,
                                    size: 36,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 36,
                                height: 22,
                                child: FittedBox(
                                  child: Text(
                                      '${user.height.toString()} м', // a tochno li 63?
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ),
                              ),
                              SizedBox(
                                width: 36,
                                height: 22,
                                child: FittedBox(
                                  child: Text(
                                    'Рост',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                                  width: 49,
                                  height: 49,
                                  child: const Icon(
                                    Icons.person,
                                    size: 36,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 19,
                                height: 22,
                                child: FittedBox(
                                  child: Text(user.age.toString(),
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ),
                              ),
                              SizedBox(
                                width: 61,
                                height: 22,
                                child: FittedBox(
                                  child: Text(
                                    'Возраст',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 152, left: 17),
          child: SizedBox(
            width: 327,
            height: 58,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                  child: FittedBox(
                    child: Text(
                      'Цитата дня',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                    width: 321,
                    height: 22,
                    child: QuoteNew(
                        tempQuote: quoteDay.hasValue ? quoteDay.value! : []))
              ],
            ),
          ),
        ),

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       const SignOutButton(),
        //       Text(user.name!),
        //       RichText(
        //           textAlign: TextAlign.center,
        //           text: TextSpan(
        //               text: 'Offline mode',
        //               style: GoogleFonts.inter(
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 16,
        //                   color: Theme.of(context).colorScheme.onPrimary),
        //               children: [
        //                 TextSpan(
        //                     text: ' ${user.offlineMode ?? 'false'}',
        //                     style: GoogleFonts.inter(
        //                         fontWeight: FontWeight.w500,
        //                         fontSize: 16,
        //                         color: user.offlineMode == true
        //                             ? Colors.red
        //                             : Colors.green))
        //               ])),
        //       Text(quoteDay.toString())
        //     ],
        //   ),
        // ),
      ],
    ));
  }
}

class QuoteNew extends ConsumerStatefulWidget {
  final List<String> tempQuote;
  const QuoteNew({super.key, required this.tempQuote});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuoteNewState();
}

class _QuoteNewState extends ConsumerState<QuoteNew> {
  @override
  void initState() {
    ref.read(homeQuotesDataProviderAsyncProvider.notifier).getQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
              text: widget.tempQuote.isNotEmpty ? widget.tempQuote.first : '',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimary),
              children: [
            TextSpan(
                text: widget.tempQuote.isNotEmpty ? widget.tempQuote.last : '',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary))
          ])),
    );
  }
}

class welcome_widget extends StatelessWidget {
  const welcome_widget({
    super.key,
    required this.user,
  });

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 37, right: 73),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 14),
            child: AvatarProfile(),
          ),
          SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width * 0.5,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                'С возвращением!\n${user.name}',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class oldHW extends ConsumerWidget {
//   const oldHW({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userState = ref.watch(authStateProvider);
//     final user = userState.value!.user!;
//     final themeApp = ref.watch(themeProvider);
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SignOutButton(),
//             Text(user.name!),
//             RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                     text: 'Offline mode',
//                     style: GoogleFonts.inter(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         color: Theme.of(context).colorScheme.onPrimary),
//                     children: [
//                       TextSpan(
//                           text: ' ${user.offlineMode ?? 'false'}',
//                           style: GoogleFonts.inter(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16,
//                               color: user.offlineMode == true
//                                   ? Colors.red
//                                   : Colors.green))
//                     ])),
//             // Switch(
//             //     value: themeApp == darkTheme,
//             //     onChanged: (newValue) {
//             //       ref.read(themeProvider.notifier).changeTheme();
//             //     })
//           ],
//         ),
//       ),
//     );
//   }
// }
