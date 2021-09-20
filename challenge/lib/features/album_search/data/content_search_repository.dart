import 'package:challenge/features/album_search/data/content_search_data_source.dart';

class ContentSearchRepository {
  final ContentSearchDataSource dataSource;

  ContentSearchRepository(this.dataSource);

  Future<List<dynamic>> searchContent(
      String searchText, String searchBy) async {
    return dataSource.searchContent(searchText, searchBy);
  }
}
