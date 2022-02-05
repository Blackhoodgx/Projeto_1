import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/publisher.dart';
import 'package:trabalho_final/models/publisher_list_info.dart';

class PublisherListService {
  Future getPublisher(urlListofPublishers) async {
    final response = await http.get(Uri.parse(urlListofPublishers));

    if (response.statusCode == 200) {
      List<Publisher> publisher = jsonDecode(response.body)['results']
          .map<Publisher>((jsonItem) => Publisher.fromJson(jsonItem))
          .toList();

      String nextPage = jsonDecode(response.body)['next'];

      PublisherListInfo publisherListInfo =
          new PublisherListInfo(publisherList: publisher, nextPage: nextPage);

      return publisherListInfo;
    } else {
      throw Exception('unable to load developer');
    }
  }
}
