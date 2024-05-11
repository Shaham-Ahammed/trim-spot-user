import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

part 'nearby_salons_event.dart';
part 'nearby_salons_state.dart';

class NearbySalonsBloc extends Bloc<NearbySalonsEvent, NearbySalonsState> {
  NearbySalonsBloc() : super(const NearbySalonsInitial(listCount: 0, originalLength: 0)) {
    on<ViewMorePressed>(_viewMorePressed);
    on<FetchingTotalLength>(_fetchTotalLength);
  }
  _viewMorePressed(
      ViewMorePressed event, Emitter<NearbySalonsState> emit) async {
    final totalShop = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.isApproved, isEqualTo: true)
        .get();
    final length = totalShop.docs.length;
    if (length > 10) {
      emit(NearbySalonsInitial(listCount: 10, originalLength: state.originalLength));
    } else {
      emit(NearbySalonsInitial(listCount: length, originalLength: state.originalLength));
    }
  }

  _fetchTotalLength(
      FetchingTotalLength event, Emitter<NearbySalonsState> emit) async {
    final totalShop = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.isApproved, isEqualTo: true)
        .get();
    final length = totalShop.docs.length;
    if (length > 5) {
      emit(NearbySalonsInitial(listCount: 5,originalLength: length));
    } else {
      emit(NearbySalonsInitial(listCount: length,originalLength: length));
    }
  }
}
