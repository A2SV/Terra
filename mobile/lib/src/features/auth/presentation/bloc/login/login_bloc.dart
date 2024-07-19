import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';
import 'package:mobile/src/features/auth/domain/use_cases/auth_use_cases.dart';
import 'package:mobile/src/features/auth/presentation/bloc/login/login_event.dart';
import 'package:mobile/src/features/auth/presentation/bloc/login/login_state.dart';


class LoginBloc extends Bloc<LoginEvent,LoginState>{

  final LoginUseCase loginUseCase;
  

  LoginBloc({required this.loginUseCase}):super(Initial()){
    print('Bloc init..');
    on<LoginUserEvent>((event,emit)async{
      print('Login event');
      final Box userBox=await Hive.openBox('userData');
      final LoginUseCase loginUseCase=LoginUseCase(AuthRepositoryImpl());
      final login= await loginUseCase(LoginParams(email: event.username, password: event.password));

      
      var output;
      login.fold(
              (failure)=>output=failure,
              (loginReturn)=>output=loginReturn
      );
      if (output is LoginReturn){
        print('login success');
        await userBox.put('isLoggedIn', true);
        await userBox.put('username', output.user.username);
        await userBox.put('password', output.user.password);

        //emit(LoginSuccess(user: output.user));

      }
      else if (output is Failure){
        print('failure message:${output.errormessage}');
        userBox.put('errormessage', output.errormessage);
        //yield LoginFailed();
      }
    });
  }



  Stream<Future<void>> _onUserLogin(LoginUserEvent event,Emitter<LoginState> emit)async*{
    print('Login event');
    final LoginUseCase loginUseCase=LoginUseCase(AuthRepositoryImpl());
    final login= await loginUseCase(LoginParams(email: event.username, password: event.password));
    var output;
    login.fold(
            (failure)=>output=failure,
            (loginReturn)=>output=loginReturn
    );
    if (output is LoginReturn){
      print('login success');
      //yield LoginSuccess(user: output.user);

    }
    else{
      print('login failure');
      //yield LoginFailed();
    }
  }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUserEvent) {
      final LoginUseCase loginUseCase=LoginUseCase(AuthRepositoryImpl());
      final login= await loginUseCase(LoginParams(email: event.username, password: event.password));
      var output;
      login.fold(
          (failure)=>output=failure,
          (loginReturn)=>output=loginReturn
      );
      if (output is LoginReturn){
        print('login success');
        yield LoginSuccess(user: output.user);

      }
      else{
        print('login failure');
        yield LoginFailed();
      }
    }
  }

}