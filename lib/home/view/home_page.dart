// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerCubit>(
      create: (context) => BannerCubit(),
      child: const HomeView(),
    );
  }
}
