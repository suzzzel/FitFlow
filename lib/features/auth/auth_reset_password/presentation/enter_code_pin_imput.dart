import 'package:fitflow/features/auth/auth_reset_password/domain/models/reset_pass_enums.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_otp_code.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_code_to_reset_password_controller.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/snackbars/network_error_reset_pass_snacknar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class EnterCodePinImput extends ConsumerStatefulWidget {
  const EnterCodePinImput({super.key, required this.email});
  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnterCodePinImputState();
}

class _EnterCodePinImputState extends ConsumerState<EnterCodePinImput> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final otpImput = ref.watch(otpResetPasswordProvider.notifier);
    final enterCodeProv =
        ref.watch(enterCodeToResetPasswordControllerProvider.notifier);
    final needAnimation = ref.watch(enterCodeToResetPasswordControllerProvider);
    return ShakeError(
      needAnimation: needAnimation.value == false,
      child: Align(
        alignment: const Alignment(0, -0.245),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 39,
            right: 39,
          ),
          child: SizedBox(
            height: 40,
            child: Pinput(
              defaultPinTheme: defaultPinTheme.copyWith(
                width: 40,
                height: 40,
              ),
              autofocus: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onTap: () {
                if (otpController.text.length == 6) {
                  otpController.text = '';
                }
                otpImput.state = '';
                enterCodeProv.enterNewCode();
              },
              onChanged: (value) {
                otpImput.state = value;
              },
              onCompleted: (value) async {
                final enterCodeIsCorrect = await enterCodeProv.enterCode(
                    code: value, email: widget.email);
                switch (enterCodeIsCorrect) {
                  case EnterRecoveryCodeStatus.success:
                    // ignore: use_build_context_synchronously
                    context.goNamed('updatepass', extra: widget.email);
                  case EnterRecoveryCodeStatus.failure:
                    break;
                  case EnterRecoveryCodeStatus.networkError:
                    // ignore: use_build_context_synchronously
                    showNetworkError(context);
                }
              },
              showCursor: false,
              controller: otpController,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 6,
            ),
          ),
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: GoogleFonts.inter(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
  decoration: BoxDecoration(
    color: const Color.fromRGBO(217, 217, 217, 1),
    border: Border.all(color: const Color.fromRGBO(204, 143, 237, 1), width: 2),
    borderRadius: BorderRadius.circular(10),
  ),
);

class ShakeError extends StatefulWidget {
  const ShakeError(
      {super.key,
      required this.child,
      this.controller,
      this.duration = const Duration(milliseconds: 1500),
      this.deltaX = 20,
      this.curve = Curves.bounceOut,
      required this.needAnimation});
  final Widget child;
  final Duration duration;
  final double deltaX;
  final Curve curve;
  final bool needAnimation;
  final Function(AnimationController)? controller;

  @override
  State<ShakeError> createState() => _ShakeErrorState();
}

class _ShakeErrorState extends State<ShakeError>
    with SingleTickerProviderStateMixin<ShakeError> {
  late AnimationController controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    offsetAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: widget.curve))
        .animate(controller);
    if (widget.controller is Function) {
      widget.controller!(controller);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - widget.curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (BuildContext context, Widget? child) {
        if (widget.needAnimation) {
          controller.forward();
          if (controller.status == AnimationStatus.completed) {
            controller.reset();
          }
        }
        return Transform.translate(
          offset: Offset(widget.deltaX * shake(offsetAnimation.value), 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
