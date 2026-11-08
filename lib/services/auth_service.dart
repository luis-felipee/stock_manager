
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Usuário atualmente autenticado
  User? get currentUser => _auth.currentUser;

  // Observar alterações no login
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Criar conta
  Future<UserCredential> register({
  required String name,
  required String email,
  required String password,
}) async {
  final credential = await _auth.createUserWithEmailAndPassword(
    email: email.trim(),
    password: password,
  );

  await credential.user?.updateDisplayName(name.trim());

  return credential;
}


  // Entrar na conta
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  // Sair da conta
  Future<void> logout() async {
    await _auth.signOut();
  }
}
