React = require("react")
Moment = require("moment")
Router = require("react-router")
{Link} = Router

module.exports = (context) ->
  {accessToken,gaiaRoot} = context
  React.createClass
    accessToken: accessToken
    gaiaRoot: gaiaRoot
    render: ->
      data = @props.data;
      return <div /> unless (data);
      dateFormat = 'MMM D, YYYY'
      timeFormat = 'h:mm:ss A'
      type = 'error'
      if data.status == "Success"
        if data.totalMessages > 0
          type = 'available'
        else
          type = 'empty'
      else if data.status == "Expired"
        type = 'expired'
      else if data.status == "Served"
        type = 'served'
      else if data.status == "InProgress"
        type = 'inprogress'
      req = data.request
      startMoment = Moment(req.startDate)
      endMoment = Moment(req.endDate)
      filter = 'all'
      count = 'all'
      if req.uids
        filter = 'user'
        count = 1
      else if req.sdtids
        filter = 'device'
        count = req.sdtids.split(',').length

      formats = 
        json: 'json'
        csv1: 'csv'
      format = formats[req.format] || 'unknown'

      status = switch
        when type == 'available' or type == 'served' then "Expires: " + Moment(data.expirationDate).calendar()
        when type == 'expired' then "Expired!"
        when type == 'empty' then "Your export returned no data. Try double-checking the dates."
        when type == 'inprogress' then "Your export request is currently being processed."
        else "Sorry, we encountered a permissions error while building your report."

      fileSize = data.fileSize/1000
      fileSizeUnit = 'KB'

      if data.fileSize > (1000*1000)
        fileSize = data.fileSize/1000/1000
        fileSizeUnit = 'MB'

      if data.fileSize > (1000*1000*1000)
        fileSize = data.fileSize/1000/1000/1000
        fileSizeUnit = 'GB'

      request = btoa(JSON.stringify(data.request) )
      <div className="export-item">
        <table className="details">
          <tr>
            <td className="title start">
              <span className="dt">{startMoment.format(dateFormat)}</span>
              <br/>
              <span className="tm">{startMoment.format(timeFormat)}</span>
            </td>
            <td className="to">
              &nbsp;
            </td>
            <td className="title end">
              <span className="dt">{endMoment.format(dateFormat)}</span>
              <br/>
              <span className="tm">{endMoment.format(timeFormat)}</span>
            </td>
            <td className="format">
              <div>
                <span className="icon type"></span>
                <span className="label">{format}</span>
              </div>
            </td>
            {if filter == 'device' or filter == 'all'
              <td className="filter">
                <div>
                  <span className="icon by-device"></span>
                  <span className="label">{count}</span>
                </div>
              </td>
            }
            {if filter == 'user' or filter == 'all'
              <td className="filter">
                <div>
                  <span className="icon by-user"></span>
                  <span className="label">{count}</span>
                </div>
              </td>
            }
            <td className="action">
              {if type == 'available' or type == 'served'
                [ <span className={"button " + type} onClick={@onDownload}>{"Download (" + fileSize.toFixed(1) + fileSizeUnit + ")"}</span>
                <form style={display: 'none'} ref="downloadForm" target="downloadExportFrame" method="POST" action="">
                  <input ref="authorizationInput" type="hidden" name="Authorization" value="" />
                </form> ]
              else if type == 'expired'
                <Link className={"button " + type} to="reExportTrial" params={id: data.request.trialId, pastExportRequest:request}>Re-export...</Link> unless !data.request.trialId?
              }
            </td>
          </tr>
        </table>
        <div className="dates">
       	  <span className={"status " + type}>
            {status}
          </span>
          {if req.requestDate
            <span className="requested">
              Requested: {Moment(req.requestDate).calendar()}
            </span>
          }
        </div>
      </div>

    onDownload: (e) ->
      e.preventDefault()
      this.refs.authorizationInput.getDOMNode().value = "bearer #{@accessToken}"
      this.refs.downloadForm.getDOMNode().setAttribute "action", "#{@gaiaRoot}/messages/export/#{@props.data.exportId}/result"
      this.refs.downloadForm.getDOMNode().submit()

    onReExport: (e) ->
      e.preventDefault()

