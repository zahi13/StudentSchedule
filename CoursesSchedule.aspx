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

	$(document).ready(function() {


	    /* initialize the external events
        -----------------------------------------------------------------*/

	    $('#external-events .fc-event')
	        .each(function() {

	            // store data so the calendar knows to render an event upon drop
	            $(this)
	                .data('event',
	                {
	                    title: $.trim($(this).text()), // use the element's text as the event title
	                    stick: true // maintain when user navigates (see docs on the renderEvent method)
	                });

	            // make the event draggable using jQuery UI
	            $(this)
	                .draggable({
	                    zIndex: 999,
	                    revert: true, // will cause the event to go back to its
	                    revertDuration: 0 //  original position after the drag
	                });

	        });


	    /* initialize the calendar
        -----------------------------------------------------------------*/

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
	                events: { url: '/json/events.json' },  // Reads events from JSON file
	                //events: { 'Request.RequestContext.HttpContext.Session["CoursesTime"]' }, // Reads events from JSON file
	                //events: { session["CoursesTime"] },  // Reads events from JSON file
	        
	            

			//drop: function() {
			//	// is the "remove after drop" checkbox checked?
			//	if ($('#drop-remove').is(':checked')) {
			//		// if so, remove the element from the "Draggable Events" list
			//		$(this).remove();
			//	}
			//},

	        //eventDrop: function(event, delta, revertFunc) {
	        //    alert(event.title + " was dropped on " + event.start.format());
	        //    if (!confirm("Are you sure about this change?")) {
	        //        revertFunc();
	        //    }

	        //    var saveit = $('#calendar').fullCalendar('clientEvents');
	        //    var eventsholded = []; //JSON.parse(sessionStorage.getItem('CoursesTime'));

	        //    $.each(saveit, function (index, value) {
	        //        var event = new Object();
	        //        event.id = value.id;
	        //        event.start = value.start;
	        //        event.end = value.end;
	        //        event.title = value.title;
	        //        event.allDay = value.allDay
	        //        eventsholded.push(event);
	        //    });
	        //    $.ajax
            //        ({
            //            type: "GET",
            //            dataType: 'json',
            //            async: false,
            //            url: '/json/test.json',
            //            data: { data: JSON.stringify(eventsholded) },
            //            success: function () {
            //                alert("Thanks!");

            //                alert(eventsholded[0].start.format() + " " + eventsholded[0].end.format());
            //            },
            //            failure: function () { alert("Error!"); }
            //        });
            //}
		});
	});

</script>
<style>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		/*width: 150px;*/
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
        width: 90%;
	}

</style>    
  
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
<!DOCTYPE html>
<html>
<body>
    <div id="menu">
        <asp:Button ID="addCourseWindow" runat="server" Text="הוסף שיעור" OnClick="addCourseWindow_Click"/>
        <asp:Button ID="removeCourseWindow" runat="server" Text="הסר שיעור" OnClick="removeCourseWindow_Click"/>
    </div>
    <br/>
    <br/>
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

		<div style='clear:both'></div>

	</div>
</body>
</html>
</asp:Content>

