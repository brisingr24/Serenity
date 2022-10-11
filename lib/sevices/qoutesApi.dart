import 'dart:convert';
import 'dart:developer';

import 'package:envision/models/quoteModel.dart';
import 'package:http/http.dart' as http;

class QuotesApi{
  QuoteModel? quoteModel;

  Future<QuoteModel?>  getdata(String? category) async{
    
    try{
      
       final url = Uri.parse(
        'https://api.api-ninjas.com/v1/quotes?category=$category');

       var response = await http.get(url,
       headers: {'X-Api-Key': 'E3s3nhORxD40qnGUVku64Q==Mz8rTn47E5CdAkr7'});
       var data = jsonDecode(response.body) ;
       var finaldata = data as List;
       quoteModel = QuoteModel.fromJson(finaldata[0]);
       
        
       

    }catch(e){
      log(e.toString());
    }
    return quoteModel;
  }

}