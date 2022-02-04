import 'package:shared_preferences/shared_preferences.dart';

class ReadStoredData {
  Future<String> readStoredData(dataKey) async {
    final loadData = await SharedPreferences.getInstance();
    //see if the libery have the key
    if(loadData.containsKey(dataKey)){
      //get the value of the key
          var savedData = loadData.getString(dataKey);
          return savedData.toString();
    }else{
      return "notFound";
    }
  }
}