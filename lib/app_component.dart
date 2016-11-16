import 'package:angular2/core.dart';
import 'package:iHAT/search/search_component.dart';
import 'package:iHAT/notifications/push_notification_Component.dart';
import 'package:iHAT/karaken/kraken_component.dart';
@Component(
    selector: "app",
    template: '''
    <div class="col-md-8">
        <search-form></search-form>
    </div>
    <div class="col-md-4">
        <kraken></kraken>
        <push-notification></push-notification>
    </div>

    ''',
    directives: const[SearchComponent,PushNotificationComponent, KrakenComponent]

)
class AppComponent{
//  java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=n -jar provideradapter-interface/target/SabreProviderAdapterService-1.1.29-SNAPSHOT.jar server config/sabreprovideradapter-configuration.yml

}