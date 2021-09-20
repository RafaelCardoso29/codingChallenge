part of 'content_search_bloc.dart';

abstract class ContentSearchState {}

class ContentSearchInitial extends ContentSearchState {}

class ContentSearchLoading extends ContentSearchState {}

class ContentSearchLoaded extends ContentSearchState {
  final List<dynamic> contentList;
  final String searchBy;

  ContentSearchLoaded({this.contentList, this.searchBy});
}

class ContentSearchEmpty extends ContentSearchState {}

class ContentSearchError extends ContentSearchState {
  final String message;

  ContentSearchError({this.message});
}
