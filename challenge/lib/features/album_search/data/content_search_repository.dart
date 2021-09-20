import 'package:challenge/features/album_search/data/content_search_data_source.dart';
import 'package:challenge/network/models/album.dart';

class ContentSearchRepository {
  final ContentSearchDataSource dataSource;

  ContentSearchRepository(this.dataSource);

  Future<List<dynamic>> searchContent(
      String searchText, String searchBy) async {
    return dataSource.searchContent(searchText, searchBy);
  }
}
