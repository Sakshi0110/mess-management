import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  // Basic Features of the user
  String usn, name, email, photoUrl, role;

  UserModel({
    this.name,
    this.email,
    this.photoUrl,
    this.usn,
    this.role = "student",
  });
}
