import 'package:equatable/equatable.dart';
import 'package:todomock/domain/entities/to_do_item.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ToDoItem> items;

  HomeSuccess({required this.items});

  @override
  List<Object?> get props => [items];
}

class HomeFailure extends HomeState {}
