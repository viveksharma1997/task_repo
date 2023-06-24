import 'package:bloc/bloc.dart';
import 'package:task_project/apis/api_provider.dart';
import 'package:task_project/model/login_model.dart';

abstract class LoginEvent{}

class LoginRefreshEvent extends LoginEvent{
  String userName, password;
  LoginRefreshEvent(this.userName, this.password);
}

abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  LoginModel? loginData;
  LoginSuccessState(this.loginData);
}

class LoginErrorState extends LoginState{
  String errorMsg;
  LoginErrorState(this.errorMsg);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiProvider _provider = ApiProvider();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginRefreshEvent>((LoginRefreshEvent event, Emitter<LoginState> emit) async {
      emit(LoginLoadingState());

      try{

        var response = await _provider.loginApi(event.userName, event.password);
        if(response != null && response.statusCode == 200){
          emit(LoginSuccessState(response));
        }
        else{
          emit(LoginErrorState(response.message??"Something went wrong!"));
        }
      } catch (error) {
        emit(LoginErrorState(error.toString()));
      }

    });
  }
}