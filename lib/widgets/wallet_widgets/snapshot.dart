import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/wallet_widgets/listview.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CollectionReferences()
            .userCollectionReference()
            .doc(BlocProvider.of<UserDetailsBloc>(context).state.id)
            .collection(FirebaseNamesUserSide.walletcollectionReference)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.data!.docs.isEmpty) {
            return Padding(
              padding:  EdgeInsets.only(top: mediaqueryHeight(0.1, context)),
              child: Column(
                children: [
                  Image.asset("assets/images/empty wallet.png",height: mediaqueryHeight(0.3, context),),
                  myFont(
                    
                      "You haven't made any wallet transactions yet.",
                    textalign: TextAlign.center,
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.016, context),
                      fontWeight: FontWeight.w400,
                      fontColor: whiteColor),
                ],
              ),
            );
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return listViewOfHistory(snapshot);
          }
          return Container();
        });
  }
}
