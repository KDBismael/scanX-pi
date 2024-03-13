import 'dart:convert';

import 'package:scanx/core/utils/network/network.dart';
import 'package:scanx/features/auth/domain/entities/signin_entity.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> signin(SigninEntity credentials);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkRequest req;

  AuthRemoteDataSourceImpl({required this.req});

  @override
  Future<dynamic> signin(SigninEntity credentials) async {
    final res = await req.post("auth/signin", {
      'user': {
        "email": credentials.email,
        "password": credentials.password,
      }
    });
    return res.data;
  }
}
