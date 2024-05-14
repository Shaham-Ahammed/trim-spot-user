import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchInitial(searchword: '')) {
    on<EnteredASearchString>(_enteredASearchString);
  }
  _enteredASearchString(EnteredASearchString event, Emitter<SearchState> emit) {
    emit(SearchInitial(searchword: event.searchWord));
  }
}
