import 'package:flutter/material.dart';
import 'package:meno_shop/authentication/authentication.dart';
import 'package:meno_shop/home/home.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthenticationStatus.authenticated:
    case AuthenticationStatus.unauthenticated:
    case AuthenticationStatus.initial:
      return [HomePage.page()];
  }
}
