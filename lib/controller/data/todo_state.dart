part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}


class FetchTodoData extends TodoState {
  final List<TodoModel> todoModel;
  const FetchTodoData({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];
}

class TodoError extends TodoState {
  final String message;
  const TodoError({required this.message});

  @override
  List<Object?> get props => [message];
}

class TodoException extends TodoState {
  final String message;
  const TodoException({required this.message});

  @override
  List<Object?> get props => [message];
}