import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_profile_app/bloc/auth_bloc.dart';
import 'package:social_profile_app/bloc/auth_event.dart';
import 'package:social_profile_app/bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_screen';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello User', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLodingState) {
                  const CircularProgressIndicator();
                } else if (state is AuthFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(content: Text('error'));
                    },
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(SignOutUser());
                  },
                  child: const Text('logOut'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
