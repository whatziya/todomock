import 'package:equatable/equatable.dart';

sealed class AddTodoState extends Equatable {
  @override
  List<Object?> get props => [];

  bool get isLoading => this is AddToDoLoading;
}

class AddToDoInitial extends AddTodoState {}

class AddToDoLoading extends AddTodoState {}

class AddToDoSuccess extends AddTodoState {}

class AddToDoFailure extends AddTodoState {}
