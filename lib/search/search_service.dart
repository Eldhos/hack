import 'package:angular2/core.dart';
import 'package:iHAT/search/SearchResult.dart';
import 'package:iHAT/search/SearchDetails.dart';
import 'package:iHAT/search/adapter/SearchAdapter.dart';

@Injectable()
class SearchService{

  List<SearchResult> getSearchResults(SearchDetails searchDetails) {
    getSearchRequest(searchDetails);
    //TODO Sent to host and get response
    SearchResult searchResult = new SearchResult();
    searchResult.price = "Test Price";
    return [searchResult];
    
  }

}