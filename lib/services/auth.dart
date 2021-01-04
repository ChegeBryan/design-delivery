import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
}
