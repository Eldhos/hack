import 'package:xml/xml.dart' as xml;
import 'package:iHAT/search/search_component.dart';
import 'package:iHAT/search/SearchDetails.dart';
class SearchAdapter{





}

String getSearchRequest(SearchDetails searchDetails) {
	xml.XmlBuilder requestBuilder = new xml.XmlBuilder();
	requestBuilder
		..processing('xml','version="1.0"')
		..element("SearchRequest");
//	requestBuilder.processing('xml','version="1.0"');
//		requestBuilder.element("SearchRequest", nest:() {
//			requestBuilder.
//
//		});
	return requestBuilder.build().toXmlString(pretty: true);
}