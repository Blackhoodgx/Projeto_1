import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/developer.dart';
import 'package:trabalho_final/models/developer_list_info.dart';

class DeveloperListService {
  Future getDevelopers(urlListofDevelopers) async {
    final response = await http.get(Uri.parse(urlListofDevelopers));

    if(response.statusCode == 200){
      List<Developer> developers = jsonDecode(response.body)
      ['results'].map<Developer>((jsonItem) => Developer.fromJson(jsonItem)).toList();

      String nextPage = jsonDecode(response.body)['next'];

      DeveloperListInfo developerListInfo = new DeveloperListInfo(developerList: developers, nextPage: nextPage);
    
    return developerListInfo;
    } else{
      throw Exception('unable to load developer');
    }
  }
}

