part of 'check_update_bloc.dart';

sealed class CheckUpdateEvent extends Equatable {
  const CheckUpdateEvent();

  @override
  List<Object> get props => [];
}

class LoadCuEvent extends CheckUpdateEvent {}
