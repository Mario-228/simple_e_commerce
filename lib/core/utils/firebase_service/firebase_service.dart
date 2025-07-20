import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_e_commerce/core/utils/functions/show_snack_bar.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Register
  Future<User?> register({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        showSnackBar(context, "Account created successfully 🎉");
      }
      return result.user;
    } on FirebaseAuthException catch (e) {
      final message = _getErrorMessage(e);
      if (context.mounted) showSnackBar(context, message);
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, "Something went wrong. Please try again.");
      }
    }
    return null;
  }

  // ✅ Login
  Future<User?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) showSnackBar(context, "Logged in successfully ✅");
      return result.user;
    } on FirebaseAuthException catch (e) {
      final message = _getErrorMessage(e);
      if (context.mounted) showSnackBar(context, message);
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, "Something went wrong. Please try again.");
      }
    }
    return null;
  }

  // ✅ Logout
  Future<void> logout(BuildContext context) async {
    try {
      await _auth.signOut();
      if (context.mounted) showSnackBar(context, "Logged out successfully 👋");
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, "Logout failed. Please try again.");
      }
    }
  }

  // ✅ Helper - Custom Error Messages
  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return "The email address is badly formatted.";
      case 'user-disabled':
        return "This account has been disabled.";
      case 'user-not-found':
        return "No user found with this email.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'email-already-in-use':
        return "This email is already in use.";
      case 'weak-password':
        return "The password is too weak.";
      case 'operation-not-allowed':
        return "Email/password accounts are not enabled.";
      default:
        return "An unknown error occurred: ${e.message}";
    }
  }

  // ✅ Get Current User
  User? get currentUser => _auth.currentUser;

  // ✅ Check Logged In
  bool get isLoggedIn => _auth.currentUser != null;
}
