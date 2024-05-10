// ignore_for_file: must_be_immutable

part of 'service_selected_bloc.dart';

@immutable
sealed class ServiceSelectedState {
 
   Map<String, Map<String, String>> serviceMap;

   ServiceSelectedState({required this.serviceMap});
  
}

final class ServiceSelectedInitial extends ServiceSelectedState {
   ServiceSelectedInitial({ required super.serviceMap});
  
}
