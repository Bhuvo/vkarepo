import 'dart:convert';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/repository/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiServiceOld extends ApiRepository {
  @override
  Future<dynamic> getResponse(
      String requestType, String url, String bodyPost, String bodyGet) async {
    if (requestType == "GET") {
      http.Response response = await http
          .get(Uri.parse(Consts.BASE_URL + bodyGet), headers: {
        'Content-type': 'application/json',
        "Accept": "application/json"
      });
      if (response.statusCode == 200) {
        print("URL : " +
            Consts.BASE_URL +
            bodyGet +
            "\n "
                "\nResponse : " +
            response.body.toString());
        print("\n ");
        return json.decode(response.body);
      } else {
        print("URL$url :  Status Code: " + response.statusCode.toString());
        print("URL$url :  Resp: " + response.body.toString());
        throw "URL$url :  Error";
      }
    } else {
      print("Post URL :" + Consts.BASE_URL + url);
      print("\n");
      print("Post Body Request : " + bodyPost.toString());
      http.Response response = await http
          .post(Uri.parse(Consts.BASE_URL + url), body: bodyPost, headers: {
        'Content-type': 'application/json',
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        print("url$url :  Resp: " + response.body.toString());
        print("\n");
        return json.decode(response.body);
      } else {
        print("url$url :  Status Code: " + response.statusCode.toString());
        print("url$url :  Resp: " + response.body.toString());
        throw "url$url : Error";
      }
    }
  }
}