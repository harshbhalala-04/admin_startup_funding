import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  rejectStartup(String uid) {
    FirebaseFirestore.instance
        .collection("Startups")
        .doc(uid)
        .update({"isRejected": true});
  }

  approveStartup(String uid) {
     FirebaseFirestore.instance
        .collection("Startups")
        .doc(uid)
        .update({"isVerified": true});
  }
}
