part of 'blog_bloc.dart';

@immutable
abstract class BlogState {}
class BlogInitial extends BlogState {}
class Loadindstate extends BlogState{}
class LoadedState extends BlogState{
  json_model model;
  LoadedState({required this.model});
}
class Errorstate extends BlogState{
  String ErrorMsg;
  Errorstate({required this.ErrorMsg});
}