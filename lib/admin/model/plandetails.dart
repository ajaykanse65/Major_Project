


import 'package:cloud_firestore/cloud_firestore.dart';


class PlanDetails{
  final CollectionReference planStream = FirebaseFirestore.instance.collection('planDetails');
  Future getPlanDetails() async{
    List planList = [];

    try{
      await planStream.get().then((querySnapshot){
        querySnapshot.docs.forEach((element) {
          planList.add(element.data());
        });
      });
      return planList;
    }catch (e){
      return null;
    }
  }

  Future getOperatorDetails() async{
    List operatorList = [];

    try{
      await planStream.get().then((querySnapshot){
        querySnapshot.docs.forEach((element) {
          operatorList.add(element.data());
        });
      });
      return operatorList;
    }catch (e){
      return null;
    }
  }
}

