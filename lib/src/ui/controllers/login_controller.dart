class LoginController {
  String usuario = '';
  String senha = '';

  bool validarLogin() {
    return usuario == 'root' && senha == 'root';
  }
}