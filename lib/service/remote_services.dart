import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import '../model/Post.dart';
import '../global_conponents/constants.dart';
import '../model/blog_model.dart';
import '../model/test.dart';

class RemoteService{

  //-----------------------------------------------------------------------Login
  Future<http.Response> getSearchData(String value, String pass) async {

      var response;
      // print('SERVICE : ' + value + '   ' + pass);
      print(Uri.http(BaseURL, 'api/login').toString());
      return response = await http.post(
          Uri.http(BaseURL, 'api/login'),
          body: {'email': value, 'password': pass});

//region Dummy
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
//endregion
  }

  //region Dummy2
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
  //endregion


  //-------------------------------------------------------------------All-Blogs
  Future<http.Response> getDta(String token) async {
    var response;

    print('From Execute Service : ${Uri.http(BaseURL, 'api/admin/blog-news')}');
    return response = await http.get(
      Uri.http(BaseURL, 'api/admin/blog-news'),
      headers: {'Authorization': 'Bearer $token',
        // "Authorization": "Bearer " + token,
      },
    );
  }


//--------------------------------------------------------------------CreateBlog
  Future<http.Response> createBlogPost
      (String stTitle,
      String stSubTitle,
      String stSlug,
      String stDescription,
      String stCategoryId,
      String stDate,
      String stTags,
      String token
      ) async {

    var queryParameters = {
      'title': stTitle,
      'sub_title': stSubTitle,
      'slug': stSlug,
      'description': stDescription,
      'category_id': stCategoryId,
      'date': stDate,
      // 'date': '',
      'tags': stTags,
    };

    var map = new Map<String, dynamic>();
    map['title'] = stTitle;
    map['sub_title'] = stSubTitle;
    map['slug'] = stSlug;
    map['description'] = stDescription;
    map['category_id'] = stCategoryId;

    print(jsonEncode(<String, String>{
    'title': stTitle,
    'sub_title': stSubTitle,
    'slug': stSlug,
    'description': stDescription,
    'category_id': stCategoryId}));
    // final json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final json = queryParameters;

    Map<String, dynamic> body = {'id': 21, 'name': 'bob'};
    var response;
    print(queryParameters);
    print('From Execute Service : ${Uri.http(BaseURL, 'api/admin/blog-news/store')}');
    return response = await http.post(
      Uri.http(BaseURL, 'api/admin/blog-news/store',),
/*      body: jsonEncode(<String, String>{
        'title': stTitle,
        'sub_title': stSubTitle,
        'slug': stSlug,
        'description': stDescription,
        'category_id': stCategoryId
      }   */

      body: map,
      headers: {'Authorization': 'Bearer $token',
        // "Authorization": "Bearer " + token,
      },
    );
  }


  //------------------------------------------------------------------UpdateBlog
  Future<http.Response> updateBlogPost(
      String stId,
      String stTitle,
      String stSubTitle,
      String stSlug,
      String stDescription,
      String stCategoryId,
      String stDate,
      String stTags,
      String token) async {

    var queryParameters = {
      'title': stTitle,
      'sub_title': stSubTitle,
      'slug': stSlug,
      'description': stDescription,
      'category_id': stCategoryId,
      'date': stDate,
      'tags': stTags,
    };


    var response;
    // print('SERVICE : ' + value + '   ' + pass);
    print(Uri.http(BaseURL, 'api/admin/blog-news/update/$stId', queryParameters).toString());
    return response = await http.post(
        Uri.http(BaseURL, 'api/admin/blog-news/update/$stId', queryParameters),
    headers: {'Authorization': 'Bearer $token'});
  }



  //------------------------------------------------------------------DeleteBlog
  Future<http.Response> deleteBlogPost(
      String stId,
      String token) async {

    var response;
    // print('SERVICE : ' + value + '   ' + pass);
    print(Uri.http(BaseURL, 'api/admin/blog-news/delete/$stId').toString());
    return response = await http.delete(
        Uri.http(BaseURL, 'api/admin/blog-news/delete/$stId'),
        headers: {'Authorization': 'Bearer $token'});
  }

}