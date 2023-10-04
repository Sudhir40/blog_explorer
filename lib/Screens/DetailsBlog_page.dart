import 'package:blog_explorer/dBhelper/dbHelper.dart';
import 'package:blog_explorer/models/addfrvBlog_model.dart';
import 'package:flutter/material.dart';

class Details_blog_page extends StatefulWidget{
  String ImageUrl;
  String ImageTitle;
  String ImageId;
  Details_blog_page({required this.ImageUrl,required this.ImageTitle,required this.ImageId,
  });
  @override
  State<Details_blog_page> createState() => _Details_blog_pageState();
}
class _Details_blog_pageState extends State<Details_blog_page> {
  @override
  late AppDatabase myDB;
  void initState() {
    // TODO: implement initState
    super.initState();
    myDB = AppDatabase.db;
  }
  var micon = Icon(Icons.favorite_outline);
  bool added = false;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right:8.0,left:8.0,top:50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImage(
                image: NetworkImage(widget.ImageUrl),
                placeholder: NetworkImage('https://cdn.dribbble.com/users/5661/screenshots/2491233/media/95e6edd78c070cc1f4873151d30e302b.gif'),
                imageErrorBuilder: (context, error, stackTrace){
                  return  Image.network('https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png');
                },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
            padding: EdgeInsets.only(right: 10),
              height: 50,alignment:Alignment.centerRight,
              child: InkWell(onTap:()
              {
               /// Add here in fav list
                if(added==false){
                  micon=Icon(Icons.favorite,color: Colors.red,);
                  added = true;
                  print(added);
                  setState(() {
                  });
                  myDB.addBlog(addfev_blog_model(title:widget.ImageTitle , id: widget.ImageId, image: widget.ImageUrl.toString()));
                }else if (added==true){
                  micon=Icon(Icons.favorite_outline);
                  added=false;
                  setState(() {
                  });
                }else{
                }
              },
              child: micon,),),
            SizedBox(
              height: 20,
            ),
            Text('Image Title',
                style: TextStyle(
              fontWeight: FontWeight.w600
              )
            ),
            SizedBox(
              height: 20,
            ),
            Text(widget.ImageId),
            SizedBox(
              height: 20,
            ),
            Text('Image ID',style: TextStyle(
                fontWeight: FontWeight.w600
            )),
            SizedBox(
              height: 20,
            ),
            Text(widget.ImageId),
          ],
        ),
      ),
    );
  }
}

