

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/EpisodeModel.dart';
import '../services/api_service.dart';
import '../widget/Shimmer.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  List<EpisodeModel>? emodel = [];
  bool isLoading = true;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        timer.cancel();
        print("isLoading:$isLoading");
      });
    });
    getEpisodeData();
  }

  void getEpisodeData() async{
    emodel = await ApiService().getEpisodes();
  /*  if (!mounted) {
      timer.cancel();
    }else
      Future.delayed(const Duration(seconds: 1)).then((value) => setState((){}));*/
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("isLoading:$isLoading");
    if(isLoading)
      return ShimmerList();
    else
      return emodel!.isEmpty ?  Center(
        child: CircularProgressIndicator(),
      ): ListView.builder(itemCount: emodel!.length,itemBuilder: (context,index)=>
        Card(
          elevation: 3,
          color: Colors.white70,
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(emodel![index].episode_id.toString()),
                        ),
                      ],
                    ),
                    Text(
                      "Title:${emodel![index].title}"  ,
                      style:  TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Episode:${emodel![index].episode}",
                      style: new TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "AirDate:${emodel![index].air_date}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Characters:${emodel![index].characters.join(",")}",
                      style:  TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Season:${emodel![index].season}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Series:${emodel![index].series}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Episode id:${emodel![index].episode_id}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
