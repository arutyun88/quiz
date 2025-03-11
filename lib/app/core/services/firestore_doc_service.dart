import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDocService {
  const FirestoreDocService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  DocumentReference<Map<String, dynamic>> user(String id) => _firestore.collection('users').doc(id);
}
