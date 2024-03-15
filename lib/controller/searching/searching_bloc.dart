import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'searching_event.dart';
part 'searching_state.dart';

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  SearchingBloc() : super(SearchingInitial()) {
    on<SearchTextEvent>(__searchUsers);
  }

  FutureOr<void> __searchUsers(SearchTextEvent event, Emitter<SearchingState> emit) {
    try{
      emit(SearchingInitial());
      final searchText = event.searchText;
      emit(SearchingFoundState(searchValue: searchText));
    } catch (e) {
      emit(SearchingErrorState(message: e.toString()));
    }
  }
}
