// import 'dart:async';

// import 'package:data_provider/data_provider.dart';

// import '../data.dart';

// abstract class UserException implements Exception {
//   const UserException(this.error);
//   final Object error;
// }

// /// {@template log_in_failure}
// /// Thrown during the sign in a process occurs failure.
// /// {@endtemplate}
// class LogInFailure extends UserException {
//   /// {@macro log_in_failure}
//   const LogInFailure(super.error);
// }

// /// {@template log_in_cancelled}
// /// Thrown during  before the sign in a process started.
// /// {@endtemplate}
// class LogInCancelled extends UserException {
//   /// {@macro log_in_cancelled}
//   const LogInCancelled(super.error);
// }

// /// {@template log_out_failure}
// /// Thrown during the sign in a process occurs failure.
// /// {@endtemplate}
// class LogOutFailure extends UserException {
//   /// {@macro log_out_failure}
//   const LogOutFailure(super.error);
// }

// /// Firebase Token Provider
// typedef FcmTokenProvider = Future<String?> Function();

// /// Repository which manages the user domain.
// class UserRepository {
//   /// {@macro user_repository}
//   UserRepository({
//     required FcmTokenProvider fcmTokenProvider,
//     required AuthClient authClient,
//     required ProfileClient profileClient,
//     required UserStorage storage,
//   })  : _fcmTokenProvider = fcmTokenProvider,
//         _authClient = authClient,
//         _profileClient = profileClient,
//         _storage = storage;

//   final FcmTokenProvider _fcmTokenProvider;
//   final AuthClient _authClient;
//   final ProfileClient _profileClient;
//   final StreamController<User> _userStream = StreamController();
//   final UserStorage _storage;

//   /// Stream of [User] which will emit the current user
//   Stream<User> get user => _userStream.stream;
// }
