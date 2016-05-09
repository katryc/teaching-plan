var Plans = React.createClass({
	render() {
		var showPlans = (plan) => <Plan name={plan.title} key={plan.id}/>;
		return <ul>{this.props.plans.map(showPlans)}</ul>;
	}
});
