import 'package:xml/xml.dart' as xml;
import 'package:iHAT/search/SearchResult.dart';

getSearchResultList(String searchResponse){


  var document = xml.parse(searchResponse);
  List<SearchResult> searchResults = new List();
  List<OriginDestination> originDestinationList = new List();

  document.findAllElements('OriginDestinationShopped')
      .forEach((odShopped)=>odShopped.findElements('SegmentList')
      .forEach((segmentList)=>segmentList.findElements('Segment')
      .forEach((segment)=> originDestinationList.add(getOriginDestination(segment))
  )));

  document.findAllElements('ProductReferenceList')
      .forEach((el)=> el.findElements('ProductReference')
      .forEach((productReference) => searchResults.add(getAmountAndOriginDestinationIndex(productReference, originDestinationList))
  ));


}


OriginDestination getOriginDestination(xml.XmlElement segment){
  OriginDestination originDestination = new OriginDestination();
  originDestination.origin = segment.findElements('DepartureAirportCode').single.text.toString();
  originDestination.destination = segment.findElements('ArrivalAirportCode').single.text.toString();
  originDestination.airline = segment.findElements('CarrierCode').single.text.toString();
  originDestination.departureDate = segment.findElements('DepartureDateTime').single.text.toString();
  originDestination.arrivalDate = segment.findElements('ArrivalDateTime').single.text.toString();
  return originDestination;
}

SearchResult getAmountAndOriginDestinationIndex(xml.XmlElement productReference,
    List<OriginDestination> originDestinationList){
  SearchResult searchResult;
  OriginDestination originDestination = new OriginDestination();
  List<OriginDestination> originDestList = new List();

  String amount;
  productReference.findElements('FareTotal')
      .forEach((fareTotal)=> fareTotal.findElements('TotalCurrencyAmount')
      .forEach((totalCurrencyAmount)=> amount = totalCurrencyAmount.findElements('Amount').single.text.toString()
  ));

  int originDestIndex;
  productReference.findElements('ItineraryReference')
      .forEach((itineraryReferance)=> itineraryReferance.findElements('OriginDestinationReferenceList')
      .forEach((originDestinationReferenceList)=> originDestinationReferenceList.findElements('OriginDestinationReference')
      .forEach((originDestinationReference)=> originDestIndex = int.parse(originDestinationReference.findElements('OriginDestinationReferenceIndex').single.text.toString())
  )));
  originDestination = originDestinationList.elementAt(originDestIndex);
  originDestList.add(originDestination);
  searchResult = new SearchResult(amount, originDestList);
  return searchResult;
}