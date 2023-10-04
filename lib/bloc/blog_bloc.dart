import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_explorer/models/json_model.dart';
import 'package:meta/meta.dart';

import '../api_helper/api_helper.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  ApiHelper apiHelper;
  BlogBloc({required this.apiHelper}) : super(BlogInitial()) {
    on<GetblogItem>((event, emit)async {
       emit(Loadindstate());
       try{
         var res = await apiHelper.getApi(Url:"https://intent-kit-16.hasura.app/api/rest/blogs");
         emit (LoadedState(model:json_model.fromjson(res)));
       }catch (e){
         emit(Errorstate(ErrorMsg: e.toString()));
       }
       });
  }
}
