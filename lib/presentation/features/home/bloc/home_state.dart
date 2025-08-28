import 'package:equatable/equatable.dart';
import 'package:todomock/data/data_source/local/drift_api/app_database.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  HomeSuccess({required this.items});

  final List<TodoItem> items;

  @override
  List<Object?> get props => [items];
}

class HomeFailure extends HomeState {}
