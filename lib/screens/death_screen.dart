
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/death_model.dart';
import '../services/api_service.dart';
import '../widget/Shimmer.dart';

class DeathScreen extends StatefulWidget {
  const DeathScreen({Key? key}) : super(key: key);

  @override
  State<DeathScreen> createState() => _DeathScreenState();
}

class _DeathScreenState extends State<DeathScreen> {
  List<DeathModel>? dmodel = [];
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
    dmodel = await ApiService().getDeaths();
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
    return dmodel!.isEmpty ? const Center(
      child: CircularProgressIndicator(),
    ):ListView.builder(itemCount: dmodel!.length,itemBuilder: (context,index)=>
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
                          child: Text(dmodel![index].death_id.toString()),
                        ),
                      ],
                    ),
                    Text(
                      "Death:${dmodel![index].death}"  ,
                      style:  TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Episode:${dmodel![index].episode}",
                      style: new TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Season:${dmodel![index].season}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Cause:${dmodel![index].cause}",
                      style:  TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Last Words:${dmodel![index].last_words}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "No of Deasth:${dmodel![index].number_of_deaths.toString()}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Responsible:${dmodel![index].responsible}",
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
