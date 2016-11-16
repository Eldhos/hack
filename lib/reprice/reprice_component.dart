import 'package:angular2/core.dart';
import 'dart:html';
import 'package:iHAT/search/SearchResult.dart';

@Component(
    selector: "reprice-form",
    template: '''
      Reprice Form
      <div *ngIf="searchResult.price != null">
        come on da maheshe
      </div>

    '''
)
class RepriceComponent {

  @Input()
  SearchResult searchResult;
  WebSocket webSocket ;

  void reprice(){
    //TODO import reprice Service
    print("Going for reprice");
  }
}
