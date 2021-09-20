import 'package:challenge/features/album_search/presentation/bloc/content_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/album_search/data/content_search_data_source.dart';
import 'features/album_search/data/content_search_repository.dart';

class BlocDependency {
  static setBlocs() {
    return [
      BlocProvider<ContentSearchBloc>(
        create: (context) => ContentSearchBloc(
            ContentSearchRepository(ContentSearchRemoteDataSource())),
      ),
    ];
  }
}
