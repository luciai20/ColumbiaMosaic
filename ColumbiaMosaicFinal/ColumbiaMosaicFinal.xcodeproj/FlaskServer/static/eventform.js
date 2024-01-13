function renderEvents(data) {
    // Empty old data
    $("#announcements").empty();

    // Insert all of the new data
    $.each(data, function(i, event){
        renderEvent(event["subject"], event["body"]);
    });
}

function renderEvent(subjectText, bodyText) {
    var eventElement = $("<div class='event'>");
    var subject = $("<span class='event-subject'>").text(subjectText);
    var body = $("<span class='event-body'>").text(bodyText);

    eventElement.append(subject, body);
    $("#announcements").append(eventElement);
}

function saveEvent(eventTitle, eventDescription) {
    var dataToSave = {
        "event_title": eventTitle,
        "event_description": eventDescription
    };

    $.ajax({
        type: "POST",
        url: "/submit-event",
        data: dataToSave,
        success: function(response) {
            console.log("Success:", response);
            // Assuming 'data' is the array of events
            data.push(response["new_event"]);
            renderEvents(data);
        },
        error: function(request, status, error) {
            console.log("Error");
            console.log(request);
            console.log(status);
            console.log(error);
        }
    });
}

$(document).ready(function(){
    // When the page loads, render all of the events
    renderEvents(data);

    $("#eventForm").submit(function(event){
        event.preventDefault();
        var eventTitle = $("#new-announcement-subject").val();
        var eventDescription = $("#new-announcement-body").val();

        saveEvent(eventTitle, eventDescription);

        // Clear text inputs
        $("#new-announcement-subject").val("");
        $("#new-announcement-body").val("");
    });
});