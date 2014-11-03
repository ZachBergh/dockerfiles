# docker/mongo

MongoDB document databases provide high availability and easy scalability.

Supported tags and respective Dockerfile links

>2.2.7, 2.2 (2.2/Dockerfile)
2.4.11, 2.4 (2.4/Dockerfile)
2.6.4, 2.6, 2, latest (2.6/Dockerfile)
2.7.7, 2.7 (2.7/Dockerfile)

#What is MongoDB?

MongoDB (from “humongous”) is a cross-platform document-oriented database. Classified as a NoSQL database, MongoDB eschews the traditional table-based relational database structure in favor of JSON-like documents with dynamic schemas (MongoDB calls the format BSON), making the integration of data in certain types of applications easier and faster. Released under a combination of the GNU Affero General Public License and the Apache License, MongoDB is free and open-source software.

First developed by the software company 10gen (now MongoDB Inc.) in October 2007 as a component of a planned platform as a service product, the company shifted to an open source development model in 2009, with 10gen offering commercial support and other services. Since then, MongoDB has been adopted as backend software by a number of major websites and services, including Craigslist, eBay, Foursquare, SourceForge, Viacom, and the New York Times, among others. MongoDB is the most popular NoSQL database system.




# How to use this image

## start a mongo instance

`docker run --name some-mongo -d mongo`

This image includes EXPOSE 27017 (the mongo port), so standard container linking will make it automatically available to the linked containers (as the following examples illustrate).

## connect to it from an application

`docker run --name some-app --link some-mongo:mongo -d application-that-uses-mongo`

### … or via mongo

`docker run -it --link some-mongo:mongo --rm mongo sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'`
