import 'package:animation/bloc/list_state.dart';
import 'package:animation/bloc/user_event.dart';
import 'package:animation/bloc/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await repository.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError('Failed to fetch users'));
      }
    });

    on<SubmitUsers>((event, emit) async {
      emit(UserLoading());
      try {
        await repository.createUser(event.user);
        emit(UserSuccess());
      } catch (e) {
        emit(UserError("Failed to create user"));
      }
    });
  }
}
