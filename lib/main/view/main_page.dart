import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/connectivity/bloc/connectivity_bloc.dart';
import 'package:meno_shop/home/cubit/home_cubit.dart';
import 'package:meno_shop/main/view/main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (_) => ConnectivityBloc()..add(ConnectivityMonitored()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
          BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: (context, state) {},
          ),
        ],
        child: const MainView(),
      ),
    );
  }
}
