# scriptingExamples

This is a collection of simple examples for general scripting concepts. The focus is on reusability in the form of a process of functions pieced together in the flow of the script.

## TechSteps.vbs

This script shows an example of when we needed to have an icon open a website with companion software installed on the client to allow the website to remain on top. The main process is at top. It checks for the installation of the required software. If it is there, launch everything. If it is not, install everything first and then launch.

## CheckRDP.js

A Nodejs script that uses a configuration file to specify the options. The script is small and simple, so a top-down flow is used with the portions of the script broken off into separate functions for readability. Reading down the script goes further into the details.

## rMarkdownReport.rmd

A report written in RStudio that uses a SQL query with specified parameters to generate a report with resulting data. At the top are all the required R libraries. Then, the DB connection followed by the query setup. The variables are setup to be easy to adjust and then they are updated to add in the single quotes automatically. The query is is run to get the needed data for a chart at the time it is needed in the report. Using this pattern, multiple queries are setup at the top and they are all dynamically using the variables defined. The query is run to get the data and dislay the chart in it's own section. Finally, at the end, the ODBC connection is closed. The approach is generally the more global items are near the top and the details fall below.
