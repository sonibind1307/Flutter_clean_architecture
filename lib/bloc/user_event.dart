import '../model/user_model.dart';

abstract class UserEvent {}

class SubmitUsers extends UserEvent {
  final User user;

  SubmitUsers(this.user);
}

class FetchUsers extends UserEvent {
  FetchUsers();
}
