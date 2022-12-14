
import 'dart:async';

import 'package:dart_quote/string_quote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/quote_model.dart';
import '../services/api_service.dart';
import '../widget/Shimmer.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<QuoteModel>? qmodel = [];
  bool isLoading = true;
  late Timer timer;
  @override
  void initState() {
    timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        timer.cancel();
        print("isLoading:$isLoading");
      });
    });
    super.initState();
    getQuoteData();
  }

  void getQuoteData() async{
    qmodel = await ApiService().getQuotes();
/*    if (!mounted) {
      timer.cancel();
    } else
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
      return qmodel!.isEmpty ? const Center(
      child: CircularProgressIndicator(),
    ):ListView.builder(itemCount: qmodel!.length,itemBuilder: (context,index)=>
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
                          child: Text(qmodel![index].quote_id.toString()),
                        ),
                      ],
                    ),
                    StringQuote(
                      text: qmodel![index].quote,
                    ).quote(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        Text(
                          qmodel![index].author,
                          style:  TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign:TextAlign.end,
                        ),
                      ]
                    ),
                    Text(
                      qmodel![index].series,
                      style: TextStyle(
                        fontSize: 12.0,
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
