part of 'content_search_bloc.dart';

abstract class ContentSearchEvent {}

class LoadInitialState extends ContentSearchEvent {
  LoadInitialState();
}

class GetSearchResult extends ContentSearchEvent {
  String text;
  String searchBy;
  GetSearchResult(this.text, this.searchBy);
}
