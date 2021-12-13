import 'package:cloud_firestore/cloud_firestore.dart';

import 'model.dart';

class API {
  final String documentId;

  API({required this.documentId});

  CollectionReference reference =
      FirebaseFirestore.instance.collection("BankManager");

  Future setData(String credential,String bankName,
      int cardNumber, int cvv) async {
    return await reference.doc().set({
      "bankName": bankName,
      "credential": credential,
      'value': 300.33,
      'cardNumber': cardNumber,
      'cvv': cvv,
    });
  }

  Future updateData(double value) async {
    return await reference.doc(documentId).update({
      'value': value
    });
  }

  Future delete() async {
    return await reference.doc(documentId).delete();
  }

  List<BankManagerData> _dataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print((doc.data() as dynamic)['value']);
      return BankManagerData(
          id: (doc.id as dynamic) ?? '',
          bankName: (doc.data() as dynamic)['bankName'] ?? '',
          credential: (doc.data() as dynamic)['credential'] ?? '',
          value: (doc.data() as dynamic)['value'] ?? 0.0,
          cardNumber: (doc.data() as dynamic)['cardNumber'] ?? 0,
          cvv: (doc.data() as dynamic)['cvv'] ?? 0);
    }).toList();
  }

  Stream<List<BankManagerData>> get data {
    return reference.snapshots().map(_dataFromSnapshot);
  }
}
