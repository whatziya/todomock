import 'package:equatable/equatable.dart';

class ToDoItem extends Equatable {
  final int id;
  final String title;
  final String description;
  final int progress;
  final int taskCount;

  const ToDoItem(this.id, this.title, this.description, this.progress, this.taskCount);

  @override
  List<Object?> get props => [id, title, description, progress, taskCount];
}
