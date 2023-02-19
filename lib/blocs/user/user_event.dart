part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserGetByUsername extends UserEvent {
  final String username;

  const UserGetByUsername(this.username);

  @override
  List<Object> get props => [username];
}

class UserGetRecent extends UserEvent {}
