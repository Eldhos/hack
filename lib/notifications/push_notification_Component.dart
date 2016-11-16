import 'dart:html';
import 'package:angular2/core.dart';
//import 'dart:io' show ;


@Component(
    selector: "push-notification",
    template: '''
      <div class="notifications">
        Notifications Appear Here!!!!!!
        <div class="alert alert-success" *ngFor="let notification of notifications"
                            (click)="removeNotification(notification)">
          {{notification}}
        </div>
      </div>
    '''
)
class PushNotificationComponent implements OnInit{
  WebSocket webSocket ;
  List<String> notifications = new List<String>();
  void ngOnInit() {
    webSocket = new WebSocket("ws://localhost:4042/ws");
    webSocket.onOpen.listen((event) {
      print("Connected");
      webSocket.onMessage.listen((event) {
        handleMessage(event);
      });
     });
   }
  void handleMessage(MessageEvent event) {
    notifications.add(event.data);
  }

  void removeNotification(String notification){
    notifications.remove(notification);

  }
}

