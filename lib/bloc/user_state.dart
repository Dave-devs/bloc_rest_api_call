part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserDataState extends UserState {
  final List<User> users;

  UserDataState(this.users);

  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);

  @override
  List<Object> get props => [];
}
