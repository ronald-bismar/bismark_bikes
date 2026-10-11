class User {
  final String id;
  final String nombre;
  final String apellido;
  final String correo;
  final String? contrasenia;

  User(this.id, this.nombre, this.apellido, this.correo, {this.contrasenia});

  static User? fromMap(Map<String, dynamic> cMap) {
    return User(cMap["id"] as String, cMap['nombre'] as String,
        cMap['apellido'] as String, cMap['correo'] as String);
  }
}
