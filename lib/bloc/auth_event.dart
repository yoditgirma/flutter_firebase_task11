abstract class AuthEvent {
  AuthEvent();
  List<Object> get props => [];
}

class SignUpUser extends AuthEvent {
  final String email, password;

  SignUpUser({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutUser extends AuthEvent {}

class LogInUser extends AuthEvent {
  final String email, password;

  LogInUser({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
