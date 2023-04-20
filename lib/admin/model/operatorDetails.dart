

import 'package:cloud_firestore/cloud_firestore.dart';

class OperatorDetails{
  Future testCall({required String fname, required String lname}) async{
    FirebaseFirestore.instance
        .collection('operator')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        fname = element['fname'];
        lname = element['lname'];
      });
    });
  }
}