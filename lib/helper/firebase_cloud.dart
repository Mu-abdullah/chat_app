import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/const.dart';

final Stream<DocumentSnapshot<Map<String, dynamic>>> message =
FirebaseFirestore.instance
    .collection(kMessages)
    .doc(kMessages)
    .snapshots();

final Stream<DocumentSnapshot<Map<String, dynamic>>> time =
FirebaseFirestore.instance
    .collection(kMessages)
    .doc(kCreatedAt)
    .snapshots();