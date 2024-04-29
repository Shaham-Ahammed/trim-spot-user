import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';

class LoginValidationRepository {
Future<QuerySnapshot<Object?>>  gettingUserName() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore
        .collection('user_information')
        .where("username", isEqualTo: loginEmailController.text.trim())
        .get();
    return querySnapshot;
  }
}
