import 'package:xml/xml.dart' as xml;
import 'package:iHAT/search/SearchResult.dart';

class RepriceBuilder{





}


String getSearchRequest(SearchResult searchResult) {
  xml.XmlBuilder requestBuilder = new xml.XmlBuilder();

  requestBuilder
    ..processing('xml', 'version="1.0"');

}