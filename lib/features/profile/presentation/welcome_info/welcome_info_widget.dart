import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/home/components/avatar_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeInformationWidget extends StatelessWidget {
  const WelcomeInformationWidget({
    super.key,
    required this.user,
  });

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const AvatarProfile(),
              Padding(
                padding: const EdgeInsets.only(top: 21, left: 20, right: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                    child: Text(
                      textAlign: TextAlign.center,
                      'С возвращением, ${user.name}!',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: FittedBox(
                      child: user.offlineMode == true
                          ? const Icon(
                              Icons.network_check,
                              color: Colors.red,
                            )
                          : const SizedBox()),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
