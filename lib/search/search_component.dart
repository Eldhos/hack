import 'package:angular2/core.dart';
import 'SearchDetails.dart';
import 'package:iHAT/search/search_service.dart';
import 'package:iHAT/search/SearchResult.dart';


@Component(
	selector: "search-form",
	template: '''
		<form class="form-horizontal" (ngSubmit)="search()">
			<div class="form-group">
				<label for="origin" class="col-sm-2 control-label">Origin</label>
				<div class="col-sm-2 control-label">
					<input id="origin" [(ngModel)]="origin" placeholder="Origin Name" class="form-control" required ng-control="origin" #org="ngForm">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Destination</label>
				<div for="destination" class="col-sm-2 control-label">
					<input [(ngModel)]="destination" placeholder="Destination Name" class="form-control" required ng-control="destination" #spy2>
				</div>
			</div>
			<div class="form-group">
				<label for="departureDate" class="col-sm-2 control-label">Departure Date</label>
				<div class="col-sm-2 control-label">
					<input id="departureDate" type="date" [(ngModel)]="departureDate">
				</div>
			</div>
			<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-10">
      	<div class="checkbox">
        <label>
          <input [ngModel]="roundTrip" (ngModelChange)="toggleRoundTrip()" type="checkbox"> Round Trip
        </label>
      </div>
    </div>
  </div>
			<div>
				<button  type="submit">Search</button>
				<button type="submit">Reprice</button>
				<button type="submit">Purchase</button>
			</div>
			{{roundTrip}}
			{{searchResponse}}
		</form>
		''',
	styles: const ['''
	  .ng-valid[required] {
      border-left: 5px solid #42A948; /* green */
    }
    .ng-invalid {
      border-left: 5px solid #a94442; /* red */
    }
		'''],
//	directives: const[],
	providers: const[SearchService]

)
class SearchComponent implements OnInit{
	String origin;
	String destination;
	String departureDate;
	String returnDate;
	String searchRequest;
	bool roundTrip;
	bool submitted;
	String searchResponse;
	final SearchService searchService;
	SearchComponent(this.searchService);
	void search(){
		SearchDetails searchDetails = new SearchDetails();
		searchDetails.destination = destination;
		searchDetails.origin = origin;
		searchDetails.roundTrip = roundTrip;
		searchDetails.startdate = departureDate;
		searchDetails.returnDate = null;
    for(SearchResult result in searchService.getSearchResults(searchDetails)) {
			searchResponse = result.price;
		}
	}
	void toggleRoundTrip(){
		roundTrip = !roundTrip;
	}
	void ngOnInit(){
		origin = "";
		destination="";
		submitted = false;

	}




}