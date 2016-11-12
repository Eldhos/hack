import 'package:angular2/core.dart';
import 'SearchDetails.dart';
import 'package:Search/adapter/SearchAdapter.dart';

@Component(
	selector: "search-form",
	template: '''
		<form class="form-inline" (ngSubmit)="search()">
			<div class="form-group">
				<label>Origin</label>
				<input [(ngModel)]="origin" placeholder="Origin Name" class="form-control" required ng-control="origin" #org="ngForm">
			</div>
			<div class="form-group">
				<label>Destination</label>
				<input [(ngModel)]="destination" placeholder="Destination Name" class="form-control" ng-control="destination" #spy2>
			</div>
			<div class="form-group">
				<label>Departure Date</label>
				<input type="date" [(ngModel)]="departureDate">
			</div>
			<div class="form-group">
				<label>Arrival Date</label>
				<input type="date" [(ngModel)]="arrivalDate">
			</div>
			<div>
				<button  type="submit">Search</button>
				<button type="submit">Reprice</button>
				<button type="submit">Purchase</button>
			</div>

			<div>
			{{departureDate}}
			{{arrivalDate}}
			</div>
			<div>
			{{searchRequest}}
			</div>
		</form>
		''',
	styles: const ['''
	  .ng-valid[required] {
      border-left: 5px solid #42A948; /* green */
    }
    .ng-invalid {
      border-left: 5px solid #a94442; /* red */
    }
		'''

	]

)
class SearchComponent implements OnInit{
	SearchDetails searchDetails;
	String origin;
	String destination;
	String departureDate;
	String arrivalDate;
	String searchRequest;
	bool submitted;

	void search(){
		searchRequest =  getSearchRequest(searchDetails);

	}


	void ngOnInit(){
		origin = "";
		destination="";
		searchDetails = new SearchDetails();
		submitted = false;

	}




}