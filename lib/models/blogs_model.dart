class blogs_model{
  String? id;
  String? image_url;
  String? title;

  blogs_model({this.id, this.image_url, this.title});
  factory blogs_model.fromjson(Map<String,dynamic>json){
    return blogs_model(
      id: json["id"],
      image_url: json["image_url"],
      title: json["title"],
    );
  }
}