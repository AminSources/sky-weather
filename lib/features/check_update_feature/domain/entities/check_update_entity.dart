import 'package:equatable/equatable.dart';

class CheckUpdateEntity extends Equatable {
  final int? id;
  final String? app;
  final String? version;

  const CheckUpdateEntity({this.id, this.app, this.version});

  @override
  List<Object?> get props => [];
}
