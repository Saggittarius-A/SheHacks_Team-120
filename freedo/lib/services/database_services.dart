import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freedo/services/shared_preferences.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices(this.uid);
  final CollectionReference profileCollection =
      Firestore.instance.collection('profiles');

  Future createUser(List<String> technical, List<String> societies) async {
    String name = await SharedPreferencesUtil.getUserName();
    String personality = await SharedPreferencesUtil.getUserPersonality();
    int age = await SharedPreferencesUtil.getUserAge();
    return await profileCollection.document(uid).setData({
      'name': name,
      'personality': personality,
      'age': age,
      'uid': uid,
      'technical': FieldValue.arrayUnion(technical),
      'societies': FieldValue.arrayUnion(societies)
    });
  }

  Future<bool> isUser() async {
    bool ans;

    DocumentReference docRef = profileCollection.document(uid);
    docRef.get().then((doc) {
      if (doc.exists) {
        ans = true;
      }
    });
    if (ans == true) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
