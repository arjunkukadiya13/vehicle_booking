import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class FirebaseOperations {
  static addUserData(
      String mobileno, String fullname, String email, String password) {
    String resp = '';
    final transaction = <String, dynamic>{
      "fullname": fullname,
      "mobileno": mobileno,
      "email": email,
      "password": password,
      "tr_dt": DateTime.now().toString(),
    };
    db.collection("userdata").add(transaction).whenComplete(() {
      resp = 'Transaction added successfully';
    });
    //     .catchError((e) {
    //   resp = e.toString();
    // });
    return resp;
  }

  static Stream<QuerySnapshot> fetchTransactions() {
    CollectionReference transaction = db.collection("userdata");
    return transaction.snapshots();
  }

  static deleteTranscation(String id) {
    String resp = '';
    DocumentReference docRef = db.collection("userdata").doc(id);

    docRef.delete().whenComplete(() {
      resp = 'Transaction deleted successfully';
    });
    return resp;
  }
}
