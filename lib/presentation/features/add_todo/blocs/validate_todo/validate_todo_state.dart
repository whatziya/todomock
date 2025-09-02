import 'package:equatable/equatable.dart';

sealed class ValidateTodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ValidateToDoInitial extends ValidateTodoState {}

class ValidateToDoSuccess extends ValidateTodoState {}

class ValidateToDoLoading extends ValidateTodoState {}

class ValidateToDoInvalidTitle extends ValidateTodoState {}

class ValidateToDoInvalidTime extends ValidateTodoState {}
