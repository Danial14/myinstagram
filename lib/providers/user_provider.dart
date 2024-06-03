import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  Future<void> fetchUser() async{
    // some code for fetching user
    notifyListeners();
  }
  User get getUser{
    return _user!;
  }
}