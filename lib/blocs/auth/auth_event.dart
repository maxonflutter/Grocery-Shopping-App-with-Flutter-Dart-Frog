part of 'auth_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLogin extends AuthEvent {
  final String username;
  final String password;

  const AppLogin({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class AppLogout extends AuthEvent {
  const AppLogout();
}

class AuthChanged extends AuthEvent {
  const AuthChanged();
}
