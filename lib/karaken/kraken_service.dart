import 'package:angular2/core.dart';
import 'dart:async';
import 'package:http/browser_client.dart';

@Injectable()
class KrakenService{
  Future releaseKraken() async{
    BrowserClient browserClient = new BrowserClient();
    try {
      browserClient.get("http://localhost:4042/kraken");
//      response.
    } catch(e){

    }

  }
}
