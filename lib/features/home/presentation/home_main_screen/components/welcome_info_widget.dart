import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/avatar_profile.dart';
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
      padding: const EdgeInsets.only(
        top: 70,
        left: 37,
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 14),
            child: AvatarProfile(),
          ),
          SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              'С возвращением!\n${user.name}',
              overflow: TextOverflow.ellipsis,
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
            child: SizedBox(
              width: 20,
              height: 20,
              child: FittedBox(
                child: user.offlineMode != null
                    ? const Icon(
                        Icons.network_check,
                        color: Colors.red,
                      )
                    : const SizedBox(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
