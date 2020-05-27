# Final-Year-Project-MyTherapy
David Parnell - Final Year Project

## About
MyTherapy is a native phone and web application that can be used as a data gathering tool in a therapy setting. 
It is based on the concept of Cognitive Behavioral Therapy (more on that here: https://mentalhealth.ie/cognitive-behavioural-therapy)
and CBT worksheets. These worksheets are tailored to each patient and are used to help that patient with their specific issues. 

### Phone application 
The phone application component of MyTherapy was developed using the Flutter framework and Dart programming language. Using this framework 
allows for the use of its "hot reload" feature which allows for code changes to instantly take effect, rather than rebuilding the application each time.
The phone application has the ability to login, read, write and update the database. Custom settings such as a colorblind mode are also available to 
users. Some data vizualization is available in the form of charts generated from the database entries. I hope to expand this to support multiple types of 
chart, with potential links to individual entries by selecting points on the chart.
I hope to add speech input and text to speech features in future.

### Web application
#### NOTE: currently in the process of migrating the project to Node.js using EJS on the "migrate-to-node" branch 
The web application allows for therapists to register for the system and create accounts for their patients. Logged in users can read, write and update
the database. Some vizualization of data is planned along with user preferences such as color blind modes.
