// user_state.dart

import '../model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<PatientModel> users;

  UserLoaded(this.users);
}

class UserSuccess extends UserState {}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
