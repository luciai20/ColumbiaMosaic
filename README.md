# ColumbiaMosaic
This is a couse long project that I along with 3 other teammates developed. We were prompted with developing a project that could solve a problem that a group of people were facing in and/or around the Columbia University campus. After several design iterations, we decided to develop Columbia Mosaic, a mobile app designed for Columbia University students to easily discover and engage with the campus's vibrant arts scene. This user-friendly app features a dynamic map and a list view of art-related events, allowing students to filter events by various criteria and save or share them with friends. We also wanted users to be able to learn about clubs and organizations hosting these events. While creating a Mosaic account with their UNI offers additional features like following clubs and receiving tailored event recommendations, the app is accessible to all, regardless of their level of commitment, ensuring everyone can explore their artistic interests conveniently.

The code in this repo is drawn directly from these Figma high-fidelity prototypes: https://www.figma.com/file/7Qz4KVKKmQuwzyLhW95b8W/Columbia-Mosaic-Final?type=design&node-id=2-4&mode=design. 


From the README:
To run the project, first we need to have XCode Installed. This can be done directly from the App Store for Mac users.

Flask should also be installed.

When you open XCode use the “Open a project or file” option and open our folder named ‘ColumbiaMosaicFinal’. You might get a warning that the project was downloaded from the internet but you can click “Trust and Open”. When opening the XCode project, there will be several Swift files, the main ones to open up previews for are... - the ColumbiaMosaicMap, which is th opening/home screen for our app - the ContentView which renders the map view of our application - the ListView, which renders the ListView of our application and pulls directly from the backend - the Event is a placeholder struct that stores information made from the connection - the EventViewModel is where the connection is made with the backend - the other files can be ignored for previewing our application

To create the connection to the server, in your terminal or VSCode, run:

export FLASKAPP=server.py

flask run

This should create the connection to the server and give you the corresponding HTTP address. Copy the http address with the ‘eventform’ extension in your browser. This will prompt you to our event submssion form. The information that is in the form will be taken and stored in our backend temporary database, the events_data.json, this is then accessible with the root /get-events, which is how our Swift Application is able to pull the information from the backend Flask application.

Then moving back to XCode, the connection should be made automatically with the Flask Application when it is running. To view the current previews, you can click on the respective swift files (ColumbiaMosaicMap, ContentView, and ListView) all have previews assosciated with them should appear automatically on the right side of the window. If they don't appear then navigate to the Editor in the top menu bar and scroll down to Create Preview, this will also render a preview for the respective file'

We also have a video walkthrough included in our submission if more guidance is needed.

Tools you used in your implementation, including any third-party code, libraries, or other resources that you should acknowledge? - For this code implemention we used three main tools. The bulk of our code is done in Swift, where we use the SwiftUI library to render most of our frontend. Within our app we are able to get the map functionality by using the Apple Mapkit package, addionally to render the backend information in our ListView we are able to pull this information by making a call to our FLASK host address and creating an API connection.
