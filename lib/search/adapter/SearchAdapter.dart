import 'package:xml/xml.dart' as xml;
import 'package:iHAT/search/SearchResult.dart';

getSearchResultList(String searchResponse){


  var document = xml.parse(searchResponse);
  List<SearchResult> searchResults;

  document.findAllElements('ProductReferenceList')
      .forEach((el)=> el.findElements('ProductReference')
      .forEach((productReference) => productReference.findElements('FareTotal')
      .forEach((fareTotal)=> fareTotal.findElements('TotalCurrencyAmount')
      .forEach((totalCurrencyAmount)=> print( totalCurrencyAmount.findElements('Amount').single.text
  )))));

  document.findAllElements('OriginDestinationShopped')
      .forEach((odShopped)=>odShopped.findElements('SegmentList')
      .forEach((segmentList)=>segmentList.findElements('Segment')
      .forEach((segment)=>
      getOriginDestination(segment)
  )));

}


getOriginDestination(xml.XmlElement segment){
  print(segment.findElements('DepartureAirportCode').single.text);
  print(segment.findElements('ArrivalAirportCode').single.text);
  print(segment.findElements('CarrierCode').single.text);
  print(segment.findElements('DepartureDateTime').single.text);
  print(segment.findElements('ArrivalDateTime').single.text);
}