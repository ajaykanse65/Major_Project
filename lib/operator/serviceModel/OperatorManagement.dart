

import 'package:cloud_firestore/cloud_firestore.dart';

class OperatorManagement  {
  final _fireStore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection('operator').snapshots();


}