import 'package:cloud_firestore/cloud_firestore.dart';

class AuthApi {
  final _usersRef = FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocById(String userId) {
    return _usersRef.doc(userId).get();
  }
}
