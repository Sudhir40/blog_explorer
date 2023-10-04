import 'blogs_model.dart';

class json_model {

  List<blogs_model>?blogs;
  json_model({ this. blogs});
  factory json_model.fromjson(Map<String,dynamic>json){
   List<blogs_model>mblogs=[];
   json['blogs'].forEach((element) {
     mblogs.add(blogs_model.fromjson(element));
   });
    return  json_model(
      blogs:mblogs
    );
  }
}