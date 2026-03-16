import 'package:social_profile_app/user.dart';

abstract class AuthState {
  AuthState();
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLodingState extends AuthState {
  final bool isLoadign;
  AuthLodingState({required this.isLoadign});
}

class AuthSuccessSate extends AuthState {
  final UserModel user;

  AuthSuccessSate({required this.user});
  @override
  List<Object> get props => [user];
}

class AuthFailureState extends AuthState {
  final String errormsg;

  AuthFailureState({required this.errormsg});
  @override
  List<Object> get props => [errormsg];
}
