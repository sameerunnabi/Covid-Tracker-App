import 'dart:convert';

import 'package:covid_tracker/model/world_states.dart';
import 'package:http/http.dart' as http;
import 'utilities/app_url.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(appUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> CountriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(appUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception("error");
    }
  }
}




// import 'dart:convert';

// import 'package:covid_tracker/model/world_states.dart';
// import 'package:covid_tracker/services/utilities/app_url.dart';
// // import 'package:covid_with_api/Model/WorldStatesModel.dart';
// // import 'package:covid_with_api/Services/Utilities/appUrl.dart';
// import 'package:http/http.dart' as http;

// class StatesServices {
//   Future<WorldStatesModel> fetchworldStateRecords() async {
//     //in {}
//     final Response = await http.get(Uri.parse(appUrl.worldStatesApi));
//     if (Response.statusCode == 200) {
//       var data = jsonDecode(Response.body.toString());
//       return WorldStatesModel.fromJson(data);
//     } else {
//       throw Exception('error');
//     }
//   }

//   Future<List<dynamic>> countriesListApi() async {
//     // in [{}] but handling dynamically
//     // other way is defined in API integeration 
//     var data;
//     final Response = await http.get(Uri.parse(appUrl.countriesList));
//     if (Response.statusCode == 200) {
//       data = jsonDecode(Response.body);
//       return data;
//     } else {
//       throw Exception('error');
// }
// }
// }