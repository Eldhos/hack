import 'package:xml/xml.dart' as xml;
import 'package:Search/SearchDetails.dart';

class SearchAdapter{





}

String getSearchRequest(SearchDetails searchDetails) {
	xml.XmlBuilder requestBuilder = new xml.XmlBuilder();

	requestBuilder
		..processing('xml','version="1.0"')
		..text("Hello")
		..element("SearchRequest", nest:() {
			for(;;){

			}

		});
	return requestBuilder.build().toXmlString(pretty: true);
}