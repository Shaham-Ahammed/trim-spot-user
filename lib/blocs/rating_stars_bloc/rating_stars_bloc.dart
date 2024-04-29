import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_stars_event.dart';
part 'rating_stars_state.dart';

class RatingStarsBloc extends Bloc<RatingStarsEvent, RatingStarsState> {
  RatingStarsBloc() : super(const RatingStarsInitial(rated: 0)) {
    on<OnRated>(_onRated);
  }
  _onRated(OnRated event, Emitter<RatingStarsState> emit) {
    emit(RatingStarsInitial(rated: event.count));
  }
}
