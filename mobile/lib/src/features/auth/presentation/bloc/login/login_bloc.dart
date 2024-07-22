import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';
import 'package:mobile/src/features/auth/domain/use_cases/auth_use_cases.dart';
import 'package:mobile/src/features/auth/presentation/bloc/login/login_event.dart';
import 'package:mobile/src/features/auth/presentation/bloc/login/login_state.dart';

import '../../../../../core/network/network_info.dart';


class LoginBloc extends Bloc<LoginEvent,LoginState>{

  final LoginUseCase loginUseCase;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkImpl network;
  

  LoginBloc({required this.remoteDataSource, required this.network, required this.loginUseCase}):super(Initial()){
    print('Bloc init..');

  }

}