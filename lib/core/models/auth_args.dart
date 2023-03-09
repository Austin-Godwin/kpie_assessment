
class AuthSignUpArgs {
  final String fullName;
  final String email;
  final String password;

  AuthSignUpArgs({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

class AuthLoginArgs {
  final String user;
  final String password;

  AuthLoginArgs({
   required this.user,
   required this.password,
});
}