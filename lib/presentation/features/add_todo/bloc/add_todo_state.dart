import 'package:equatable/equatable.dart';

sealed class AddTodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToDoInitial extends AddTodoState {}

class AddToDoLoading extends AddTodoState {}

class AddToDoInvalidTitle extends AddTodoState {}

class AddToDoInvalidYear extends AddTodoState {}

class AddToDoInvalidMonth extends AddTodoState {}

class AddToDoInvalidDay extends AddTodoState {}

class AddToDoInvalidTime extends AddTodoState {}

class AddToDoSuccess extends AddTodoState {}

class AddToDoFailure extends AddTodoState {}
