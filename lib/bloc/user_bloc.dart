import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:user_pagination_apk/bloc/user_event.dart';
import 'package:user_pagination_apk/bloc/user_state.dart';
import 'package:user_pagination_apk/remote/app_urls.dart';

import '../models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState());

  getUser()async{
    emit(UserLoadingState());
    final response = await http.get(Uri.parse(AppUrls.baseUrl));
    if(response.statusCode==200){
      Map<String, dynamic> resData = jsonDecode(response.body);
      UserModel data = UserModel.fromJson(resData);
      emit(UserLoadedState(userModel: data));
    } else {
      emit(UserErrorState(errorMsg: "Response is not 200"));
    }
  }
}
