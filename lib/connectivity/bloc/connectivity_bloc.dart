// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:equatable/equatable.dart';
// part 'connectivity_event.dart';
// part 'connectivity_state.dart';
// part 'connectivity_helper.dart';

// class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
//   ConnectivityBloc._() : super(ConnectivityInitial()) {
//     on<ConnectivityMonitored>(_monitor);
//     on<ConnectivityInformed>(_informStatus);
//   }

//   static final ConnectivityBloc _instance = ConnectivityBloc._();

//   factory ConnectivityBloc() => _instance;

//   void _monitor(
//     ConnectivityMonitored event,
//     Emitter<ConnectivityState> emit,
//   ) {
//     ConnectivityHelper.monitorNetwork();
//   }

//   void _informStatus(
//     ConnectivityInformed event,
//     Emitter<ConnectivityState> emit,
//   ) {
//     event.hasConnectivity
//         ? emit(ConnectivitySuccess())
//         : emit(ConnectivityFailure());
//   }
// }
