part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserModel user;
  final UserEditFormModel data;

  const AuthUpdateUser(this.user, this.data);

  @override
  List<Object> get props => [data, user];
}

class AuthUpdatePin extends AuthEvent {
  final UserModel user;
  final String oldPin;
  final String newPin;

  const AuthUpdatePin(
    this.user,
    this.oldPin,
    this.newPin,
  );

  @override
  List<Object> get props => [user, oldPin, newPin];
}

class AuthLogout extends AuthEvent {}

class AuthUpdateBalance extends AuthEvent {
  final int amount;

  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}
