import 'package:http/http.dart' as http;

import '../global_conponents/constants.dart';

class RemoteService{

  //-----------------------------------------------------------------------Login
  Future<http.Response> getLoginData(String value, String pass) async {

      var response;
      print(Uri.http(BaseURL, 'api/login').toString());
      return response = await http.post(
          Uri.http(BaseURL, 'api/login'),
          body: {'email': value, 'password': pass});
  }


  //-------------------------------------------------------------------All-Blogs
  Future<http.Response> getDta(String token) async {
    var response;
    print('From Execute Service : ${Uri.http(BaseURL, 'api/admin/blog-news')}');
    return response = await http.get(
      Uri.http(BaseURL, 'api/admin/blog-news'),
      headers: {'Authorization': 'Bearer $token',
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

    var response;
    print('From Execute Service : ${Uri.http(BaseURL, 'api/admin/blog-news/store')}');
    return response = await http.post(
      Uri.http(BaseURL, 'api/admin/blog-news/store',),
      body: map,
      headers: {'Authorization': 'Bearer $token',
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
    print(Uri.http(BaseURL, 'api/admin/blog-news/delete/$stId').toString());
    return response = await http.delete(
        Uri.http(BaseURL, 'api/admin/blog-news/delete/$stId'),
        headers: {'Authorization': 'Bearer $token'});
  }

}