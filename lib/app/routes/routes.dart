import 'package:flutter/material.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/home/home.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
    case AuthStatus.unauthenticated:
    case AuthStatus.initial:
      return [HomePage.page()];
  }
}
