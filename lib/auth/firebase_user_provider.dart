import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyPetFirebaseUser {
  MyPetFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MyPetFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyPetFirebaseUser> myPetFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MyPetFirebaseUser>(
      (user) {
        currentUser = MyPetFirebaseUser(user);
        return currentUser!;
      },
    );
