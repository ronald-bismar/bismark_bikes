// Maquina de estados
// Que estados puede tener una pantalla
// Login -> Cargando... cargando los datos del usuario
//          Success... datos exitosamente cargados
//          Error... no se pudo obtener los datos del usuario
//          Idle... estado inactivo (pantalla sin accion)

import 'package:login_tutorial/domain/entities/user.dart';

sealed class LoginState {
  const LoginState();
}

class Loading extends LoginState {}

class Success extends LoginState {
  final User dataUser;

  Success(this.dataUser);
}

class Error extends LoginState {
  final String error;

  Error(this.error);
}

class Idle extends LoginState {}
