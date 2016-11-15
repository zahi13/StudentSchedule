<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CoursesSchedule.aspx.cs" Inherits="CourseSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head>
    <meta charset='utf-8' />
    <link href='fullcalendar-3.0.1/fullcalendar-3.0.1/fullcalendar.css' rel='stylesheet' />
    <link href='~/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='fullcalendar-3.0.1/fullcalendar-3.0.1/lib/moment.min.js'></script>
    <script src='fullcalendar-3.0.1/fullcalendar-3.0.1/lib/jquery.min.js'></script>
    <script src='fullcalendar-3.0.1/fullcalendar-3.0.1/lib/jquery-ui.min.js'></script>
    <script src='fullcalendar-3.0.1/fullcalendar-3.0.1/fullcalendar.min.js'></script>

<script>

    $(document).ready(function () {

	    /* initialize the external events
        -----------------------------------------------------------------*/
	    $('#external-events .fc-event').each(function() {
            // store data so the calendar knows to render an event upon drop
	            $(this).data('event',
	                {
	                    title: $.trim($(this).text()), // use the element's text as the event title
	                    stick: true // maintain when user navigates (see docs on the renderEvent method)
	                });
	    });



	    /* initialize the calendar
        -----------------------------------------------------------------*/
        var studentID = '<%= Session["studentID"] %>';
	    var url = "testWebService.asmx/getJSON";
	    $.ajax({
	        type: "POST",
	        url: url,
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        data: JSON.stringify( {studentID: studentID}),
	        success: function (data) {
	            $('#calendar').fullCalendar({
	                    header: {
	                        left: 'prev,next today',
	                        center: 'title',
	                        right: 'month,agendaWeek,agendaDay'
	                    },
	                    editable: true,
	                    droppable: true, // this allows things to be dropped onto the calendar
	                    navLinks: true, // can click day/week names to navigate views
	                    eventLimit: true, // allow "more" link when too many events
	                    events: JSON.parse(data.d), // Reads events from JSON file
	            });
	        },
	        error: function () {
	            alert("ERROR AJAX");
	        }
	    });
	});

</script>
<style>
		
	#external-events {
		float: left;
		padding: 0 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
	}

	#calendar {
        float: left;
        width: 100%;
	}

</style>    
  
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
<!DOCTYPE html>
<html>
<body>
    <div id="menu">
        <asp:Button ID="addCourseWindow" CssClass="button button1" runat="server" Text="הוסף שיעור" OnClick="addCourseWindow_Click"/>
<%--        <asp:Button ID="removeCourseWindow" CssClass="button button1" runat="server" Text="הסר שיעור" OnClick="removeCourseWindow_Click"/>--%>
    </div>
	<div id='wrap'>
<%--		<div id='external-events'>
			<h4>גרור קורסים מהרשימה</h4>
			<div class='fc-event'>My Event 1</div>
			<div class='fc-event'>My Event 2</div>
			<div class='fc-event'>My Event 3</div>
			<div class='fc-event'>My Event 4</div>
			<div class='fc-event'>My Event 5</div>

			<div style="visibility: hidden">
				<input type='checkbox' id='drop-remove' checked="checked"/>
				<label for='drop-remove'>remove after drop</label>
			</div>
		</div>--%>

		<div id='calendar'></div>

		<div <%--style='clear:both'--%>></div>
        <input type="hidden" id="hdnSession" data-value="@Request.RequestContext.HttpContext.Session["User"]" />

	</div>
</body>
</html>
</asp:Content>

