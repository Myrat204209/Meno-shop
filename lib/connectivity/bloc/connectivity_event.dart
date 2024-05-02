part of 'connectivity_bloc.dart';

/// Events related to the connection state.
sealed class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

/// Event emitted when the connection state has been *monitored*.
class ConnectivityMonitored extends ConnectivityEvent {}

/// Event emitted when the connection state has been *informed*.
class ConnectivityInformed extends ConnectivityEvent {
  final bool hasConnectivity;

  const ConnectivityInformed({this.hasConnectivity = false});
}
