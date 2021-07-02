import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  //String userId;
  final dbRef = FirebaseDatabase.instance.reference();
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  get currentUser => _firebaseAuth.currentUser;

  //SIGN IN METHOD CALL THIS FROM OTHER CLASSES
  Future<String> signIn({String email, String password}) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Text("User successfully logged in");

    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
        Text('No user found for that email.');
      } else if (e.code == 'wrong-password') {

        Text('Wrong password provided for that user.');
      }
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }


  //SIGN UP METHOD CALL THIS FROM OTHER CLASSES
  Future<String> signUp({String email, String password}) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up!";
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  String getUID(){
    final User user = _firebaseAuth.currentUser;
    final uid = user.uid;
    return uid;
  }

  void createUID() async{
    final User user = _firebaseAuth.currentUser;
    final uid = user.uid;
    //dbRef.push().set({'Users': 'uid'});
    dbRef.set
      ({
      uid
    });
  }


  void addUserInfo(String name, String lastName, String phoneNumber, String address) async{
    final User user = _firebaseAuth.currentUser;
    final uid = user.uid;
    //dbRef.push().set({'Users': 'uid'});

    dbRef.child(getUID()).set
      ({
      'address': address,
      'phone': phoneNumber,
      'lastname': lastName,
      'firstname': name



    });
  }

  void addData(String data) {
    dbRef.push().set({'name': data, 'comment': 'A good season'});
  }


}