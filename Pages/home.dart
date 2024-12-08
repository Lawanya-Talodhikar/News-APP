import 'package:flutter/material.dart';
import 'package:techie/Components/appbar.dart';
import 'package:techie/Components/newsbox.dart';
import 'package:techie/Components/searchbar.dart';
import 'package:techie/Utils/colors.dart';
import 'package:techie/Utils/constants.dart';
import 'package:techie/backend/fetchfun.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Appcolors.black,
        appBar: appbar(),
        body: Column(
          children: [
            searchBar(),
            Expanded(
                child: Container(
                    width: w,
                    child: FutureBuilder(
                        future: fetchnews(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Newsbox(
                                    url: snapshot.data![index]['url'],
                                 imageurl:
                                    snapshot.data![index]['urlToImage'] ?? Constants.imageUrl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                                  );
                                });
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.hasError}');
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              color: Appcolors.primarycolor,
                            ),
                          );
                        })))
          ],
        ));
  }
}
