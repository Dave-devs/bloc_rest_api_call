import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/User.dart';
import '../model/user_repo.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()) {

    on<UserLoadingEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        final users = await _userRepository.fetchUserData();
        emit(UserDataState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });

  }
}
