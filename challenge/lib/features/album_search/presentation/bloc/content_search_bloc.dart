import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:challenge/features/album_search/data/content_search_repository.dart';
part 'content_search_event.dart';
part 'content_search_state.dart';

class ContentSearchBloc extends Bloc<ContentSearchEvent, ContentSearchState> {
  final ContentSearchRepository _repository;

  ContentSearchBloc(this._repository) : super(ContentSearchInitial());

  @override
  Stream<ContentSearchState> mapEventToState(
    ContentSearchEvent event,
  ) async* {
    try {
      if (event is GetSearchResult) {
        yield ContentSearchLoading();

        final response =
            await _repository.searchContent(event.text, event.searchBy);
        yield ContentSearchLoaded(
            contentList: response, searchBy: event.searchBy);
      } else if (event is LoadInitialState) {
        yield ContentSearchLoading();
        yield ContentSearchLoaded(contentList: null);
      }
    } catch (e) {
      yield ContentSearchError(message: e.toString());
    }
  }
}
