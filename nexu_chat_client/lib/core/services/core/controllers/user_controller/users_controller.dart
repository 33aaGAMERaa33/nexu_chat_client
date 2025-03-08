
import '../../controller.dart';

class UserController extends Controller{
  static final _instance = UserController._();
  UserController._() : super("users");

  factory UserController(){
    return _instance;
  }
}