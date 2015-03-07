React = require("react")
{Link} = require("react-router")


module.exports = (context) ->
  Layout = require("../../common-js/components/layout")(context)

  React.createClass
    render: ->
      <Layout analytics="UA-54296710-10" params={@props.params}>
        <ul>
          <li><Link to="index" className="trials">Trial Management</Link></li>
        </ul>
      </Layout>
