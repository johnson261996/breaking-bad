import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/EpisodeModel.dart';
import '../model/characters_model.dart';
import '../model/death_model.dart';
import '../model/quote_model.dart';
import '../util/api_constants.dart';

class ApiService {

  Future<List<CharacterModel>?> getCharters() async {
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.characterendpoint);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<CharacterModel> model = characterModelFromJson(response.body);
        print("response:" + response.body);
        return model;
      }
    }catch(e){
      log("apiservice error:"+e.toString());
    }
  }

  Future<List<EpisodeModel>?> getEpisodes() async {
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.episode_endpoint);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<EpisodeModel> model = EpisodeModelFromJson(response.body);
        print("response:" + response.body);
        return model;
      }
    }catch(e){
      log("apiservice error:"+e.toString());
    }
  }

  Future<List<QuoteModel>?> getQuotes() async {
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.quotes_endpoint);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<QuoteModel> model = QuoteModelFromJson(response.body);
        print("response:" + response.body);
        return model;
      }
    }catch(e){
      log("apiservice error:"+e.toString());
    }
  }

  Future<List<DeathModel>?> getDeaths() async {
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.deaths_endpoint);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<DeathModel> model = DeathModelFromJson(response.body);
        print("response:" + response.body);
        return model;
      }
    }catch(e){
      log("apiservice error:"+e.toString());
    }
  }
}