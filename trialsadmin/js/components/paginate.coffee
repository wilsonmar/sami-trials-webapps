React = require("react")

module.exports =
  React.createClass

    componentWillMount: ->

    paginate: (offset) ->
      (e) =>
        e.preventDefault()
        @props.onPaginate(offset)

    getProps: ->
      this.offset= @props.offset || 0
      this.count= @props.count || 0
      this.total= @props.total || 0
      return null

    render: ->
      <div className="paginated-content">
        {@getProps()}
        {@props.children}
        <div className="pagination-controls">
          <ol>
            {if @offset == 0
              <li className="paginate-prev disabled">« PREV</li>
            else
              <li className="paginate-prev" onClick={@paginate(@offset-@count)}>« PREV</li>
            }

            {for x in [0..@total-1] by @count
              classes = if @offset == x then "paginate-current" else ""
              <li className={classes} onClick={@paginate(x)}>{(x/@count)+1}</li>
            }

            {if @offset + @count >= @total
              <li className="paginate-next disabled">NEXT »</li>
            else
              <li className="paginate-next" onClick={@paginate(@offset+@count)}>NEXT »</li>
            }
          </ol>
        </div>
      </div>

