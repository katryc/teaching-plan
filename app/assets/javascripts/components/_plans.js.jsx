var Plans = React.createClass({
	render() {
		var showPlans = (plan) => <Plan name={plan.title} title={plan.intro} key={plan.id}/>;
		return <ul>{this.props.plans.map(showPlans)}</ul>;
	}
});
