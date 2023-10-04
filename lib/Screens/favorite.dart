import 'package:blog_explorer/dBhelper/dbHelper.dart';
import 'package:blog_explorer/models/addfrvBlog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailsBlog_page.dart';
class My_favorite extends StatefulWidget{
  @override
  State<My_favorite> createState() => _My_favoriteState();
}
class _My_favoriteState extends State<My_favorite> {
  late AppDatabase mydb ;
  List<addfev_blog_model>arrblogs=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydb=AppDatabase.db;
    getblos();
  }
   void getblos()async{
     arrblogs = await mydb.fetchALLBlog();
     setState(() {
     });
   }
  @override
  Widget build(BuildContext context) {
    setState(() {
    });
    // TODO: implement build
    return Scaffold(
       body:   Padding(
         padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 50),
         child: Column(
           children: [

             /// Appbar
             Container(
                 padding: EdgeInsets.only(right: 20,left: 20),
                 margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(20)),
                     color: Colors.green
                 ),
                 height:70,alignment:Alignment.centerRight,child: Row(
               children: [
                 Center(child: Text('Blog explorer',style: TextStyle(fontSize: 20,color: Colors.white),)),
                 ],
             )),

             ///Sizebox

             SizedBox(
               height: 20,
             ),

             /// Listview builder
             ///
             Expanded(
               child: ListView.builder(
                   itemCount: arrblogs.length,
                   itemBuilder: (context,index){
                 return InkWell(

                  ///On tap for go to the details
                     onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Details_blog_page(
                     ImageUrl: '${arrblogs[index].image.toString()}',
                     ImageTitle: arrblogs[index].title.toString(),
                     ImageId: arrblogs[index].id.toString(),
                   )));
                 },

                   ///long press for delete blogs

                   onLongPress: (){
                   mydb.deleteblog(int.parse(arrblogs[index].blogindex.toString()));
                   getblos();
                   setState(() {
                   });
                   },
                   child: ListTile(
                     title:   FadeInImage(
                       image:  NetworkImage(arrblogs[index].image.toString()),
                       placeholder: NetworkImage('https://cdn.dribbble.com/users/5661/screenshots/2491233/media/95e6edd78c070cc1f4873151d30e302b.gif'),
                       imageErrorBuilder:
                           (context, error, stackTrace) {
                         return Image.network('https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png');
                       },
                       fit: BoxFit.fitWidth,
                     ),
                     subtitle: Text(arrblogs[index].title.toString(),textAlign: TextAlign.center,),
                   ),
                 );
               }),
             )
           ],
         ),
       )
    );
  }
}