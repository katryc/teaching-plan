var PlansContainer = React.createClass({
	componentWillMount(){
		this.fetchPlans();
	},

	fetchPlans() {

		$.ajax({
	      url: this.props.plansPath,

	      dataType: 'json',

	      success: function(data) {
	        this.setState({plans: data});
	      }.bind(this),

	      error: function(data) {
	      	this.setState({plans: []});
	      }.bind(this)
	    });
	},

	searchPlans(event) {
		if (event.target.value) {
			$.ajax({
		      url: this.props.searchPath+"?query="+event.target.value,

		      dataType: 'json',

		      success: function(data) {
		        this.setState({plans: data});
		      }.bind(this),

		      error: function(data) {
		      	this.setState({plans: []});
		      }.bind(this)
		    });
		}
		else{
			this.fetchPlans();
		}

	},

	getInitialState() {
		return { plans: [] };
	},

	render() {

		return (
			<div>
				<Plans plans={this.state.plans} />
				<PlansSearch searchPath={this.props.searchPath} submitPath={this.searchPlans} cancelPath={this.fetchPlans}/>
			</div>
			);

	}
});
