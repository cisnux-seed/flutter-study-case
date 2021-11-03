import 'package:resto_app/common/custom_error_handling.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthUser {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static late String _title = '';
  static late String _message = '';
  static final _googleSignIn = GoogleSignIn();

  static Future<Either<RestoAppException, String>> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      /// get sign in methods
      var fetchSignInMethods = await auth.fetchSignInMethodsForEmail(email);

      /// check is email already registered
      if (!fetchSignInMethods.contains('google.com') &&
          !fetchSignInMethods.contains('password')) {
        var userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        var uid = userCredential.user!.uid;
        return Right(uid);
      } else {
        _title = 'Sign Up Error';
        _message =
            'Your account is already register\nYou can try to login with email and password or gmail';
        return Left(RestoAppException(title: _title, message: _message));
      }
    } on FirebaseAuthException catch (error) {
      /// sign out to remove previous session
      await _googleSignIn.signOut();
      _title = 'Sign Up Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  static Future<Either<RestoAppException, User?>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var data = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(data.user);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        _title = 'Sign In Error';
        _message = 'User account not found\nPlease register to enter this app';
      } else {
        _title = 'Sign In Error';
        _message = error.message!;
      }
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  static Future<Either<RestoAppException, dynamic>> signInWithGmail() async {
    try {
      /// ask gmail account to sign in
      final googleUser = await _googleSignIn.signIn();

      /// to handle null check
      if (googleUser != null) {
        var fetchSignInMethods =
            await auth.fetchSignInMethodsForEmail(googleUser.email);

        /// check is gmail is already registered
        if (fetchSignInMethods.contains('google.com')) {
          final googleAuth = await googleUser.authentication;

          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await auth.signInWithCredential(credential);
          return Right('Success');
        } else {
          /// sign out to remove previous session
          await _googleSignIn.signOut();
          _title = 'Sign In Error';
          _message =
              'User account not found\nPlease register, then link your account with gmail account';
          return Left(RestoAppException(title: _title, message: _message));
        }
      } else {
        return Right(null);
      }
    } on FirebaseAuthException catch (error) {
      /// sign out to remove previous session
      await _googleSignIn.signOut();
      _title = 'Sign In Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  static Future<Either<RestoAppException, dynamic>> linkWithGmail() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      /// to handle null check
      if (googleUser != null) {
        var fetchSignInMethods =
            await auth.fetchSignInMethodsForEmail(googleUser.email);

        /// check is gmail is already registered
        if (!fetchSignInMethods.contains('google.com') &&
            fetchSignInMethods.contains('password')) {
          final googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await auth.currentUser!.linkWithCredential(credential);

          return Right('success');
        } else {
          /// sign out to remove previous session
          _title = 'Link Account';
          _message =
              'Your gmail account is already\nLinked with another account';
          return Left(RestoAppException(title: _title, message: _message));
        }
      } else {
        return Right(null);
      }
    } on FirebaseAuthException catch (error) {
      /// sign out to remove previous session
      await _googleSignIn.signOut();
      _title = 'Link Account';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  static Future<Either<RestoAppException, dynamic>> resetPassword(
      String email) async {
    try {
      /// send password reset message to email user
      await auth.sendPasswordResetEmail(email: email);
      return Right(null);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        _title = 'Reset Password Error';
        _message = 'User account not found\nPlease register to enter this app';
      } else {
        _title = 'Reset Password Error';
        _message = error.message!;
      }
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  /// will remove local data login
  static Future<void> signOut() async {
    await auth.signOut();
    await _googleSignIn.signOut();
  }
}
