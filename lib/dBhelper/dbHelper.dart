import 'dart:io';

import 'package:blog_explorer/models/addfrvBlog_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
   AppDatabase._();
   static final AppDatabase db = AppDatabase._();
   Database? _database;
   static final BLOG_IMAGE = 'blog_image';
   static final BLOG_TITLE = 'blog_title';
   static final BLOG_ID = 'blog_id';
   static final BLOG_INDEX = 'blog_index';
   static final BLOG_TABLE_NAME = 'blog_table';

   Future<Database>getDB()async{
     if(_database!=null){
       return _database!;
     }else{
       return  await initDB();
     }
   }
   Future<Database>initDB()async {
     Directory documentsdirectory = await getApplicationDocumentsDirectory();
    var dbpath = join(documentsdirectory.path,"blogDB");
    return  openDatabase(
      dbpath,
      version: 1,
      onCreate: (db,version){
        db.execute('Create table $BLOG_TABLE_NAME ($BLOG_INDEX integer primary key autoincrement,$BLOG_IMAGE text,$BLOG_TITLE text,$BLOG_ID text)');
      }
    );
   }
   Future<bool>addBlog(addfev_blog_model model)async{
     var db = await getDB();
     var roweffect = await db.insert(BLOG_TABLE_NAME, model.toMap());
    if(roweffect>0){
      return true;
    }
    else{
      return false;
    }
   }
   Future<List<addfev_blog_model>>fetchALLBlog()async{
     var db = await getDB();

     List<Map<String,dynamic>> notes= await db.query(BLOG_TABLE_NAME) ;
     List<addfev_blog_model> listnotes = [];
     for(Map<String,dynamic> note in notes){
       listnotes.add(addfev_blog_model.fromMap(note));
     }
     return listnotes;
   }
   Future<bool> deleteblog(int id)async{
     var db=await  getDB();
     var count =await  db.delete(BLOG_TABLE_NAME,where: "$BLOG_INDEX=$id");
     return count>0;
   }

}