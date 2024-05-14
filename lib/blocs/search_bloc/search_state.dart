part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final String searchword ;

  const SearchState({required this.searchword});
}

final class SearchInitial extends SearchState {
  const SearchInitial({required super.searchword});
}
