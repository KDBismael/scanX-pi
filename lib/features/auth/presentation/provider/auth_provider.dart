import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scanx/features/auth/data/model/signin_model.dart';
import 'package:scanx/features/auth/domain/usecase/signin_usecase.dart';

class AuthProvider extends ChangeNotifier {
  AuthState state = EmptyState();
  String email = "";
  String password = "";

  final SigninUsecase signIn;

  AuthProvider({required this.signIn});

  void signInOrFailure() async {
    state = LoadingState();
    notifyListeners();
    if (email != "" && password != "") {
      state = AuthError(message: "Please email or password is required");
      notifyListeners();
      return;
    }
    final result = await signIn(SigninModel(email: email, password: password));
    result.fold((failure) {
      state = AuthError(message: "An error occur");
      notifyListeners();
    }, (dynamic) {
      state = AuthSucceed(jwt: "my jwt is here");
      notifyListeners();
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
