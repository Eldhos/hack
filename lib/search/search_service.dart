import 'package:angular2/core.dart';
import 'package:iHAT/search/SearchResult.dart';
import 'package:iHAT/search/SearchDetails.dart';
import 'package:iHAT/search/adapter/SearchAdapter.dart';

@Injectable()
class SearchService{

  List<SearchResult> getSearchResults(SearchDetails searchDetails) {
    String result = getSearchRequest(searchDetails);
    //TODO Sent to host and get response
    String sabreURL = "http://cheijvasws002:8080/sabreprovideradapter/v2/search";


    print(result);
    SearchResult searchResult = new SearchResult();
    searchResult.price = result;
    return [searchResult];
    
  }

}