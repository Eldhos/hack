class SearchResult{
  String price;
  List<OriginDestination> originDestinationList;

  SearchResult(this.price,this.originDestinationList);

}

class OriginDestination{
  String origin;
  String destination;
  String airline;
  String departureDate;
  String arrivalDate;

}