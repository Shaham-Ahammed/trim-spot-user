

part of 'service_selected_bloc.dart';

@immutable
sealed class ServiceSelectedState {
 
  final Map<String, Map<String, String>> serviceMap;

   const ServiceSelectedState({required this.serviceMap});
  
}

final class ServiceSelectedInitial extends ServiceSelectedState {
   const ServiceSelectedInitial({ required super.serviceMap});
  
}
