import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class fiSrvcs{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String getUid()
  {
    return _firebaseAuth.currentUser!.uid;
  }
final CollectionReference usrRef = FirebaseFirestore.instance.collection('Users');
final CollectionReference prdRef = FirebaseFirestore.instance.collection('Products');
}