part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoadingEvent extends UserEvent {
  const UserLoadingEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataEvent extends UserEvent {
  const UserDataEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserErrorEvent extends UserEvent {
  const UserErrorEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
