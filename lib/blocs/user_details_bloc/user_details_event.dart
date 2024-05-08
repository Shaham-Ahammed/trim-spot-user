part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsEvent {}

final class FetchingUserDetailsFromFirebase extends UserDetailsEvent{}

