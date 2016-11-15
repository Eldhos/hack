import 'package:angular2/core.dart';
import 'package:iHAT/search/SearchResult.dart';
import 'package:iHAT/search/SearchDetails.dart';
import 'package:iHAT/search/adapter/SearchAdapter.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'dart:async';

@Injectable()
class SearchService{

  Future<List<SearchResult>> getSearchResults(SearchDetails searchDetails) async{
    String request = getSearchRequest(searchDetails);
    BrowserClient browserClient = new BrowserClient();
    Response response = null;

    try {
      response = await browserClient.post(
          "http://192.168.72.198:8080/sabreprovideradapter/v2/search",
          headers: {
            'Content-Type': 'application/xml',
            'Access-Control-Allow-Origin': '*'
          },
          body: request);
    } catch(e){

    }

    SearchResult searchResult = new SearchResult();
    if(response != null) {
      searchResult.price = response.body;
    } else {
      searchResult.price = "Shit broke lose";
    }
    return [searchResult];
    
  }

}