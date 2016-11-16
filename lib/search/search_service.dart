import 'package:angular2/core.dart';
import 'package:iHAT/search/SearchResult.dart';
import 'package:iHAT/search/SearchDetails.dart';
import 'package:iHAT/search/adapter/SearchBuilder.dart';
import 'package:iHAT/search/adapter/SearchAdapter.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:io';

@Injectable()
class SearchService{

  Future<List<SearchResult>> getSearchResults(SearchDetails searchDetails) async{
    String request = getSearchRequest(searchDetails);
    BrowserClient browserClient = new BrowserClient();
    Response response = null;

    try {
      response = await browserClient.post(
          "http://localhost:4042/sabreprovideradapter/v2/search",
          headers: {
            'Content-Type': 'application/xml',
          },
          body: request);
//      response.
    } catch(e){

    }

    //SearchResult searchResult = new SearchResult();
    return getSearchResultList(response.body);
  }

}