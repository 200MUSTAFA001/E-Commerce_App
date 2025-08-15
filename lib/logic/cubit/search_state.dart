part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchListEmpty extends SearchState {
  final List<Product> searchList;
  final int searchListLength;

  SearchListEmpty({required this.searchList, required this.searchListLength});
}

class SearchLoaded extends SearchState {
  final List<Product> searchList;
  final int searchListLength;

  SearchLoaded({required this.searchList, required this.searchListLength});
}
