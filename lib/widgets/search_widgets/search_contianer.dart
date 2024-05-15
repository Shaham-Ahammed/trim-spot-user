import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/search_bloc/search_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SearchField extends StatefulWidget {
  final bool autoFocus;
  final String service;
  const SearchField({
    this.autoFocus = false,
    required this.service,
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context
        .read<SearchBloc>()
        .add(EnteredASearchString(searchWord: widget.service));
    searchController.text = widget.service;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 105, 105, 105),
            borderRadius: BorderRadius.circular(90),
            border: Border.all(color: greyColor, width: 2)),
        width: double.infinity,
        height: mediaqueryHeight(0.06, context),
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.024, context)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  autofocus: widget.autoFocus,
                  onChanged: (value) {
                    context
                        .read<SearchBloc>()
                        .add(EnteredASearchString(searchWord: value));
                  },
                  cursorColor: cyanColor,
                  cursorHeight: 22,
                  maxLength: 35,
                  style: const TextStyle(color: whiteColor),
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: greyColor2),
                      counterText: "",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: mediaqueryHeight(0.01, context),
                          vertical: mediaqueryHeight(0.0132, context)),
                      hintText: "search salons, servies...",
                      border: InputBorder.none),
                ),
              ),
              Icon(
                Icons.search,
                size: mediaqueryHeight(0.03, context),
                color: greyColor2,
              )
            ],
          ),
        ));
  }
}
