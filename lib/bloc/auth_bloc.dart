import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_profile_app/bloc/auth_event.dart';
import 'package:social_profile_app/bloc/auth_state.dart';
import 'package:social_profile_app/services/authentication.dart';
import 'package:social_profile_app/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService = AuthService();

  AuthBloc(FirebaseAuth instance) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthLodingState(isLoadign: true));
      try {
        final UserModel? user = await authService.signUpUser(
          event.email,
          event.password,
        );
        if (user != null) {
          emit(AuthSuccessSate(user: user));
        } else {
          emit(AuthFailureState(errormsg: 'Create user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(AuthLodingState(isLoadign: false));
    });

    on<SignOutUser>((event, emit) async {
      emit(AuthLodingState(isLoadign: true));

      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(AuthLodingState(isLoadign: false));
    });
  }
}
