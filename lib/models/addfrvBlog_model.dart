import 'package:blog_explorer/dBhelper/dbHelper.dart';

class addfev_blog_model{
  String title;
  String id;
  String image;
  int?blogindex;

  addfev_blog_model({
    this.blogindex,
    required this.title,
    required this.id,
    required  this.image});
  factory addfev_blog_model.fromMap(Map<String,dynamic>map){
    return addfev_blog_model(
        blogindex: map[AppDatabase.BLOG_INDEX],
        title: map[AppDatabase.BLOG_TITLE],
        id: map[AppDatabase.BLOG_ID],
        image: map[AppDatabase.BLOG_IMAGE]);
  }
  Map<String,dynamic>toMap(){
    return {
      AppDatabase.BLOG_IMAGE:image,
      AppDatabase.BLOG_TITLE:title,
      AppDatabase.BLOG_ID:id,
      AppDatabase.BLOG_INDEX:blogindex
    };
  }
}