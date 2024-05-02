part of 'profile_bloc.dart';

enum ProfileStatus {
  initial,
  loading,
  populated,
  failure,
}

class ProfileState extends Equatable {
  final ProfileStatus status;
  final User user;

  const ProfileState({
    required this.status,
    this.user = User.anonymous,
  });
  const ProfileState.initial() : this(status: ProfileStatus.initial);
  const ProfileState.populated(User user)
      : this(
          status: ProfileStatus.populated,
          user: user,
        );
  ProfileState copyWith({
    ProfileStatus? status,
    User? user,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        status,
        user,
      ];
}
