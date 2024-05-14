import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/bookmarks/functions/fetching_bookmarks.dart';
import 'package:trim_spot_user_side/widgets/bookmarks/heading.dart';
import 'package:trim_spot_user_side/widgets/bookmarks/listview.dart';
import 'package:trim_spot_user_side/widgets/bookmarks/no_bookmark_illustration.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/shimmer_effect.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: commonScreenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingAndBackButton(),
              SizedBox(height: mediaqueryHeight(0.02, context)),
              FutureBuilder<List<QueryDocumentSnapshot>>(
                  future: fetchBookmarkedShops(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerEffectOfSearchScreen();
                    }
                    if (!snapshot.hasData) {
                      return const ShimmerEffectOfSearchScreen();
                    }

                    if (snapshot.data!.isEmpty) {
                      return const NoBookmarksIllustrationAndText();
                    }
                    if (snapshot.data!.isNotEmpty) {
                      return BookmarkedShopsListView(
                        snapshot: snapshot,
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}



