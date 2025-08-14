part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchListEmpty extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Product> searchList;

  SearchLoaded({required this.searchList});
}
