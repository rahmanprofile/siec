part of 'searching_bloc.dart';

abstract class SearchingState extends Equatable {
  const SearchingState();
}

class SearchingInitial extends SearchingState {
  @override
  List<Object> get props => [];
}

class SearchingFoundState extends SearchingState {
  final String searchValue;
  const SearchingFoundState({required this.searchValue});

  @override
  List<Object?> get props => [searchValue];
}

class SearchingErrorState extends SearchingState {
  final String message;
  const SearchingErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
