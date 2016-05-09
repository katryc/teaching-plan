var PlansSearch = React.createClass({
	render () {
		return (
			<div>
				<form ref="form" action={ this.props.searchPath } acceptCharset="UTF-8" method="get">
				<p><input ref="query" name="query" placeholder="Search plans" onChange={ this.props.submitPath } /></p>
				</form>

				<button><a href="#" onClick={ this.props.cancelPath }>Cancel</a></button>
			</div>
			);
	}
});
