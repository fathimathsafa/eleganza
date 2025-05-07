
import '../../../core/model/user_model.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    // In a real app, this would call an API
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '1', email: email, name: 'User');
  }

  Future<User> register(String name, String email, String password) async {
    // In a real app, this would call an API
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '1', email: email, name: name);
  }
}