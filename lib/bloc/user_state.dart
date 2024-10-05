import '../models/user_model.dart';

abstract class UserState {}
class UserInitialState extends UserState {}
class UserLoadingState extends UserState {}
class UserLoadedState extends UserState {
  UserModel userModel;
  UserLoadedState({required this.userModel});
}
class UserErrorState extends UserState {
  String errorMsg;
  UserErrorState({required this.errorMsg});
}
