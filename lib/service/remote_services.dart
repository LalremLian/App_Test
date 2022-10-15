import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import '../model/Post.dart';
import '../global_conponents/constants.dart';
import '../model/blog_model.dart';
import '../model/test.dart';

class RemoteService{

  // final String _url = "https://owlbot.info/api/v4/dictionary/";
  final String urls = BaseURL;
  final String _token = "c99413a763f9861f62fad84a38adf948c9e50b71";

  Future<http.Response> getSearchData(String value, String pass) async {

      var response;
      print('SERVICE : ' + value + '   ' + pass);
      print(Uri.http(BaseURL, 'api/login').toString());
      return response = await http.post(
          Uri.http(BaseURL, 'api/login'),
          body: {'email': value, 'password': pass});


/*    List<BlogModel> blogList = [];

    var url = Uri.parse(urls + '/login');

    var respone = await http.get(url);
    var decodedJson = json.decode(respone.body);
    print(decodedJson);
    if(respone.statusCode == 200)
      {
        for(var i = 1; i< decodedJson.length; i++)
          {
            blogList.add(BlogModel.fromJson(decodedJson[i]));
          }
      }

    return blogList;*/

/*    http.Response response;
    response = await http.get(
        Uri.https(
            "owlbot.info", "/api/v4/dictionary/" + value),
        headers: {"Authorization": "Token " + _token});

    if(response.statusCode==200)
    {
      var json = response.body;
      return postFromJson(json);
    }
    return null;*/
  }

  var blogList = <Test>[].obs;
  Future<Test?> getBlogsData(String token) async {

    http.Response response;
    response = await http.get(
        Uri.http(BaseURL, "api/admin/blog-news"),
        headers: {"Authorization": "Token $token"});

    print('URL : ${Uri.https(BaseURL, "api/admin/blog-news")}');
    if(response.statusCode==200)
    {
      var json = response.body;
      return testFromJson(json);
    }
    return null;
  }

  Future<http.Response> getDta(String token) async {
    var response;

    print('From Execute Service : ' + Uri.http(BaseURL, 'api/admin/blog-news').toString());
    return response = await http.get(
      Uri.http(BaseURL, 'api/admin/blog-news'),
      headers: {'Authorization': 'Bearer $token',
        // "Authorization": "Bearer " + token,
      },
    );
  }
}