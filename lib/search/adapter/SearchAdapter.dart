import 'package:xml/xml.dart' as xml;
import 'package:iHAT/search/search_component.dart';
import 'package:iHAT/search/SearchDetails.dart';
class SearchAdapter{





}

String getSearchRequest(SearchDetails searchDetails) {
	xml.XmlBuilder requestBuilder = new xml.XmlBuilder();

  requestBuilder
    ..processing('xml','version="1.0"');

  requestBuilder.element('SearchRequest', nest:(){
    requestBuilder.attribute('xsi:schemaLocation', 'urn:expedia:supply:provider:air:v2:search');
    requestBuilder.attribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
    requestBuilder.attribute('xmlns:providerair', 'urn:expedia:supply:provider:air:v3');
    requestBuilder.attribute('xmlns:searchmsg', 'urn:expedia:supply:provider:air:v2:search');

    requestBuilder.element('MessageContext', nest: (){
      requestBuilder.element('MessageGUID', nest: '55448fc6-8e6c-4956-a7f6-2cd661855731');
      requestBuilder.element('TransactionGUID', nest: '9fe16d4f-7e11-4492-89de-5fa73c849760');
      requestBuilder.element('MessageReference', nest: 'TPID=60000,TUID=2345,EAPID=0');
      requestBuilder.element('DebugTrace', nest: 'true');
      requestBuilder.element('ClientHostname', nest: 'DELPBAYGBY');
    });

    requestBuilder.element('SearchCriteriaList', nest: (){
      requestBuilder.element('SearchCriteria', nest: (){

        requestBuilder.element('ItineraryCriteria', nest: (){
          requestBuilder.element('OriginDestinationCriteriaList', nest: (){
            requestBuilder.element('OriginDestinationCriteria', nest: (){
              requestBuilder.element('OriginLocationCode',  nest: searchDetails.origin);
              requestBuilder.element('DestinationLocationCode',  nest: searchDetails.destination);
              requestBuilder.element('DepartureDate',  nest: searchDetails.startdate);
            });
          });
          requestBuilder.element('MaxConnectionCount', nest:'2');
        });

        requestBuilder.element('TravelerCriteriaList', nest: (){
          requestBuilder.element('TravelerCriteria', nest: (){
            requestBuilder.element('TravelerType', nest:'adult');
            requestBuilder.element('TravelerTypeCount', nest:'1');
          });
        });

        requestBuilder.element('FareCriteria', nest: (){
          requestBuilder.element('FareOptionList', nest: (){
            requestBuilder.element('FareOption', nest: (){
              requestBuilder.element('FareSecurity', nest: (){
                requestBuilder.element('ProviderAgencyOfficeCode', nest:'6JEB');
              });
            });
          });
        });

      });
    });

  });

  return requestBuilder.build().toXmlString(pretty: true);
}
