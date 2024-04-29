import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nearby_salons_event.dart';
part 'nearby_salons_state.dart';

class NearbySalonsBloc extends Bloc<NearbySalonsEvent, NearbySalonsState> {
  NearbySalonsBloc() : super(const NearbySalonsInitial(listCount: 5)) {
    on<ViewMorePressed>(_viewMorePressed);
  }
  _viewMorePressed(ViewMorePressed event, Emitter<NearbySalonsState> emit) {
    emit(const NearbySalonsInitial(listCount: 10));
  }
}
