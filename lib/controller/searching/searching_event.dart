part of 'searching_bloc.dart';

abstract class SearchingEvent extends Equatable {
  const SearchingEvent();
}

class SearchTextEvent extends SearchingEvent {
  final String searchText;
  const SearchTextEvent({required this.searchText});

  @override
  List<Object?> get props => [searchText];

}