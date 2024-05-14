part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class EnteredASearchString extends SearchEvent {
  final String searchWord;

  EnteredASearchString({required this.searchWord});
}
