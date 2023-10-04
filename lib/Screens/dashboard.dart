import 'package:blog_explorer/Screens/favorite.dart';
import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import '../models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'DetailsBlog_page.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}
class _dashboardState extends State<dashboard> {
  late Future<json_model> myJson_model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogBloc>().add(GetblogItem());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 50),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.green),
              height: 70,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Blog explorer',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => My_favorite()));
                      },
                      child: Icon(Icons.favorite_outlined)),
                ],
              )),
          SizedBox(
            height: 20,
          ),

          ///Blocbuilder

          Expanded(
            child: BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                if (state is Loadindstate) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is Errorstate) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.ErrorMsg),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                              onTap: () {
                                context.read<BlogBloc>().add(GetblogItem());
                              },
                              child: Icon(Icons.refresh)),
                        )
                      ],
                    ),
                  );
                } else if (state is LoadedState) {
                  ///ListviewBuilder

                  return ListView.builder(
                      itemCount: state.model.blogs!.length,
                      itemBuilder: (context, index) {
                        String imageUrl = state.model.blogs![index].image_url!
                            .replaceAll(" ", "");
                        String Imagetitle = state.model.blogs![index].title!;
                        String Imageid = state.model.blogs![index].id!;
                        try {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details_blog_page(
                                            ImageUrl: imageUrl,
                                            ImageTitle: Imagetitle,
                                            ImageId: Imageid,
                                          )));
                            },
                            child: ListTile(
                              title: FadeInImage(
                                image: NetworkImage(imageUrl),
                                placeholder: NetworkImage(
                                    'https://cdn.dribbble.com/users/5661/screenshots/2491233/media/95e6edd78c070cc1f4873151d30e302b.gif'),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.network(
                                      'https://icons.veryicon.com/png/o/business/new-vision-2/picture-loading-failed-1.png');
                                },
                                fit: BoxFit.fitWidth,
                              ),
                              subtitle: Center(
                                  child: Text(
                                state.model.blogs![index].title!,
                                textAlign: TextAlign.center,
                              )),
                            ),
                          );
                        } catch (e) {
                          print('Image loded failled');
                          return Center(
                            child: Text('Image loded failled'),
                          );
                        }
                      });
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    ));
  }
}
