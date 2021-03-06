import 'package:challenge/network/generic/base_api.dart';
import 'package:challenge/network/models/album.dart';
import 'package:challenge/network/models/response.dart';
import 'package:challenge/utils/constants.dart';
import 'package:dio/dio.dart' as dioResponse;

abstract class ContentSearchDataSource {
  Future<List<dynamic>> searchContent(String searchText, String searchBy);
}

class ContentSearchRemoteDataSource implements ContentSearchDataSource {
  BaseApi baseAPi = BaseApi();

  @override
  Future<List<dynamic>> searchContent(
      String searchText, String searchBy) async {
    try {
      final params = {
        'method': '$searchBy.search',
        '$searchBy': searchText,
        'api_key': API_kEY,
        'format': "json"
      };
      var response = await baseAPi.dio.get(BASE_URL, queryParameters: params);
      return _convertContent(searchBy, response);
    } catch (e) {
      throw dioResponse.DioError(error: e);
    }
  }

  _convertContent(String type, var response) {
    if (type.toLowerCase() == "artist") {
      return Response.fromJson(response.data).results.artistmatches.artist;
    } else if (type.toLowerCase() == "album") {
      return Response.fromJson(response.data).results.albummatches.album;
    } else if (type.toLowerCase() == "track") {
      return Response.fromJson(response.data).results.trackmatches.track;
    } else
      return List.empty();
  }
}

class ContentSearchMockDataSource implements ContentSearchDataSource {
  @override
  Future<List<Album>> searchContent(String searchText, String searchBy) {
    throw UnimplementedError();
  }
}
