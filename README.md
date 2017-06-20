# scriptingExamples

This is a collection of simple examples for general scripting concepts. The focus is on reusability in the form of a process of functions pieced together in the flow of the script.

## TechSteps.vbs

This script shows an example of when we needed to have an icon open a website with companion software installed on the client to allow the website to remain on top. The main process is at top. It checks for the installation of the required software. If it is there, launch everything. If it is not, install everything first and then launch.

## CheckRDP.js

A Nodejs script that uses a configuration file to specify the options. The script is small and simple, so a top-down flow is used with the portions of the script broken off into separate functions for readability. Reading down the script goes further into the details.
