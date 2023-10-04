import 'dart:convert';
import 'dart:io';

import 'package:blog_explorer/api_helper/my_exception.dart';
import 'package:http/http.dart ' as http;
class ApiHelper{
  //static String baseurl = " https://intent-kit-16.hasura.app/api/rest/blogs";
  Future<dynamic>getApi({required String Url,Map<String,String>?mheader})async{
    var mdata;
    try {
      var res = await  http.get(Uri.parse(Url),
      headers: mheader??{
        'x-hasura-admin-secret':
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6'
      });
      mdata =  returmDataResponse(res);
    }on SocketException{
      throw  FetchDataException(body: "Internate Error");
    }
    return mdata;
  }
  dynamic returmDataResponse(http.Response res){
    if(res.statusCode==200){
      return jsonDecode(res.body);
    }else if(res.statusCode>=400&&res.statusCode<=499){
      throw UnAuthorisedException(body: res.body.toString());
    }else{
      throw FetchDataException(body: "Error while Communication to server");
    }

   /*  switch(res.statusCode){
       case 200:
       return jsonDecode(res.body);
       case 400:
         throw BadrequestException(body: res.body.toString());
       case 401:
       case 402:
       case 403:
         throw UnAuthorisedException(body: res.body.toString());
       case 500:
       default:
          throw FetchDataException(body: "Error while Communication to server");
     }*/
  }
}