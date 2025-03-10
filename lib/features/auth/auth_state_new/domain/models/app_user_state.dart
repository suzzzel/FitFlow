// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';

enum AppUserStateStatus { auth, unauth, unknown }

class AppUserState extends Equatable {
  final AppUserStateStatus status;
  final AppUser? user;

  const AppUserState._({
    this.status = AppUserStateStatus.unknown,
    this.user,
  });

  const AppUserState.unknown() : this._();

  const AppUserState.auth(AppUser user)
      : this._(status: AppUserStateStatus.auth, user: user);

  const AppUserState.unauth() : this._(status: AppUserStateStatus.unauth);

  @override
  List<Object?> get props => [status, user];
}
