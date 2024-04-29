import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/nearby_salons_bloc/nearby_salons_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbySalonsBloc, NearbySalonsState>(
      builder: (context, state) {
        if (state.listCount == 5) {
          return Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  context.read<NearbySalonsBloc>().add(ViewMorePressed());
                },
                child: myFont(" view more ",
                    fontFamily: belleza,
                    fontSize: mediaqueryHeight(0.02, context),
                    fontWeight: FontWeight.normal,
                    fontColor: cyanColor),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}