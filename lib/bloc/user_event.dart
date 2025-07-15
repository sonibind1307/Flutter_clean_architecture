import '../model/user_model.dart';

abstract class UserEvent {}

class SubmitUsers extends UserEvent {
  final PatientModel user;

  SubmitUsers(this.user);
}

class FetchUsers extends UserEvent {
  FetchUsers();
}
