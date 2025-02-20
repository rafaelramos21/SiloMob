class LoginController {
  String usuario = '';
  String senha = '';

  bool validarLogin() {
    return usuario == 'admin' && senha == '1234';
  }
}