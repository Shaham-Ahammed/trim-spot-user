import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/search_page/shop_details.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/name_location_service.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/shop_image.dart';

  ListView searchResultDisplay() {
    return ListView.separated(
                  itemBuilder: (context, index) {
                    return Material(
                      color: greyColor3,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Container(
                          height: mediaqueryHeight(0.123, context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              searchShopImage(context, index),
                              SizedBox(
                                width: mediaqueryHeight(0.013, context),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  shopName(context, index),
                                  shopLocation(context, index),
                                  shopServices(context, index)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    );
                  },
                  itemCount: searchDisplayModelList.length);
  }