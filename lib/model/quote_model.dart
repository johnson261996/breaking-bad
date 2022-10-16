

import 'dart:convert';

List<QuoteModel> QuoteModelFromJson(String str)  =>
    List<QuoteModel>.from(json.decode(str).map((x)=>QuoteModel.fromJson(x)));

class QuoteModel {
  late int  quote_id;
  late String quote;
  late String author;
  late String series;

  QuoteModel({required this.quote_id, required this.quote, required this.author, required this.series});

  factory QuoteModel.fromJson(Map<String,dynamic> json) =>QuoteModel(
    quote_id: json["quote_id"],
    quote: json["quote"],
    author: json["author"],
    series: json["series"],
  );

  Map<String, dynamic> toJson() => {
    "quote_id": quote_id,
    "quote": quote,
    "author": author,
    "series": series,
  };
}