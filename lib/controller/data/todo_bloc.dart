import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<FetchTodo>(__fetchingTodoItems);
  }

  FutureOr<void> __fetchingTodoItems(FetchTodo event, Emitter<TodoState> emit) async {
    try {
      String url = "https://jsonplaceholder.typicode.com/todos";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> dynamicItems = jsonDecode(response.body);
        final List<TodoModel> todoModel = dynamicItems.map((e) => TodoModel.fromJson(e)).toList();
        emit(FetchTodoData(todoModel: todoModel));
      } else {
        emit(TodoError(message: jsonDecode(response.body)));
      }
    } catch (message) {
      emit(TodoException(message: message.toString()));
    }
  }
}
