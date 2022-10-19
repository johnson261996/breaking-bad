import 'dart:async';

import 'package:breaking_bad/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/characters_model.dart';
import '../widget/Shimmer.dart';

class CharacterScreen extends StatefulWidget {
   const CharacterScreen( {Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<CharacterModel>? cmodel = [];
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
    getCharacterData();
  }

  void getCharacterData() async{
    cmodel = await ApiService().getCharters();
   /* if (!mounted) {
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
    if(isLoading) {
      return  ShimmerList();
    } else {
      return cmodel!.isEmpty ?  Center(
      child: CircularProgressIndicator(),
    ):ListView.builder(itemCount: cmodel!.length,itemBuilder: (context,index)=>
        Card(
          elevation: 3,
          color: Colors.white70,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
                child:
                Image.network(cmodel![index].img ,
                  errorBuilder: ( context,  exception,  stackTrace) {
                    return Image.asset('assets/images/default.png');
                  },
                ),
              ),
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
                          child: Text(cmodel![index].charId.toString()),
                        ),
                      ],
                    ),
                    Text(
                      "Name:${cmodel![index].name}"  ,
                      style:  TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "NickName:${cmodel![index].nickname}",
                      style:  TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Status:${cmodel![index].status}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Birthday:${cmodel![index].birthday}",
                      style:  TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "occupation:${cmodel![index].occupation.join(",")}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "appearance:${cmodel![index].appearance.join(",")}",
                      style:  const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "category:${cmodel![index].charId}",
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
}
