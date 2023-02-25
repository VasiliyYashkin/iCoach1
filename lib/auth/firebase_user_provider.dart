import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ICoachFirebaseUser {
  ICoachFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ICoachFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ICoachFirebaseUser> iCoachFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ICoachFirebaseUser>(
      (user) {
        currentUser = ICoachFirebaseUser(user);
        return currentUser!;
      },
    );
