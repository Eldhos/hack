import 'package:angular2/core.dart';
import 'package:iHAT/karaken/kraken_service.dart';
@Component(
  selector: "kraken",
  template: '''
      <button type="button" class="btn btn-danger" [disabled]="releasingKraken" (click)="releaseTheKraken()">Release The Kraken</button>
  ''',
  providers: const[KrakenService]
)
class KrakenComponent{

  @Injectable()
  KrakenService krakenService;
  bool releasingKraken;

  KrakenComponent(this.krakenService);
  void releaseTheKraken(){
    releasingKraken = true;
    krakenService.releaseKraken();
  }
}