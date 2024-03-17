import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scanx/core/presentation/provider/global_provider.dart';
import 'package:scanx/core/presentation/screens/main_screen.dart';
import 'package:scanx/features/auth/data/model/signin_model.dart';
import 'package:scanx/features/auth/domain/usecase/signin_usecase.dart';
import 'package:scanx/main.dart';

class AuthProvider extends ChangeNotifier {
  AuthState state = EmptyState();

  final SigninUsecase signIn;

  AuthProvider({required this.signIn});

  Future<void> signInOrFailure(String email, String password,
      {required BuildContext context}) async {
    state = LoadingState();
    notifyListeners();
    if (email == "" && password == "") {
      state = AuthError(message: "Please email or password is required");
      notifyListeners();
      return;
    }
    final result = await signIn(SigninModel(email: email, password: password));
    // print(globalhProvider.bottonNavigatorIndex);
    result.fold((failure) {
      state = AuthError(message: "An error occur");
      notifyListeners();
    }, (response) {
      if (response["access_token"] != "") {
        storage.write(key: "token", value: response["access_token"]);
        state = AuthSucceed(jwt: response["access_token"]);
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(
              key: Key("mainScren"),
            ),
          ),
        );
      }
    });
  }
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyState extends AuthState {}

class LoadingState extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}

class AuthSucceed extends AuthState {
  final String jwt;
  AuthSucceed({required this.jwt});
}
