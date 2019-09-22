[![Build Status](https://travis-ci.org/thoughtworks/build-your-own-radar.svg?branch=master)](https://travis-ci.org/thoughtworks/build-your-own-radar)
[![Stars](https://badgen.net/github/stars/thoughtworks/build-your-own-radar)](https://github.com/thoughtworks/build-your-own-radar)
[![dependencies Status](https://david-dm.org/thoughtworks/build-your-own-radar/status.svg)](https://david-dm.org/thoughtworks/build-your-own-radar)
[![devDependencies Status](https://david-dm.org/thoughtworks/build-your-own-radar/dev-status.svg)](https://david-dm.org/thoughtworks/build-your-own-radar?type=dev)
[![peerDependencies Status](https://david-dm.org/thoughtworks/build-your-own-radar/peer-status.svg)](https://david-dm.org/thoughtworks/build-your-own-radar?type=peer)
[![Docker Hub Pulls](https://img.shields.io/docker/pulls/wwwthoughtworks/build-your-own-radar.svg)](https://hub.docker.com/r/wwwthoughtworks/build-your-own-radar)
[![GitHub contributors](https://badgen.net/github/contributors/thoughtworks/build-your-own-radar?color=cyan)](https://github.com/thoughtworks/build-your-own-radar/graphs/contributors)
[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)
[![AGPL License](https://badgen.net/github/license/thoughtworks/build-your-own-radar)](https://github.com/thoughtworks/build-your-own-radar)


A library that generates an interactive radar, inspired by [thoughtworks.com/radar](http://thoughtworks.com/radar).

## Demo
Cinglevue Tech Radar can be found in (provide the url)

You can see this in action at https://radar.thoughtworks.com. If you plug in [this data](https://docs.google.com/spreadsheets/d/1YXkrgV7Y6zShiPeyw4Y5_19QOfu5I6CyH5sGnbkEyiI/) you'll see [this visualization](https://radar.thoughtworks.com/?sheetId=https://docs.google.com/spreadsheets/d/1YXkrgV7Y6zShiPeyw4Y5_19QOfu5I6CyH5sGnbkEyiI). 

## How To Use

The easiest way to use the app out of the box is to provide a *public* Google Sheet ID from which all the data will be fetched. . The data must conform to the format below for the radar to be generated correctly.

### Setting up your data

Create a Google Sheet. Give it at least the below column headers, and put in the content that you want:

| name          | ring   | quadrant               | isNew | description                                             |
|---------------|--------|------------------------|-------|---------------------------------------------------------|
| Composer      | adopt  | tools                  | TRUE  | Although the idea of dependency management ...          |
| Canary builds | trial  | techniques             | FALSE | Many projects have external code dependencies ...       |
| Apache Kylin  | assess | platforms              | TRUE  | Apache Kylin is an open source analytics solution ...   |
| JSF           | hold   | languages & frameworks | FALSE | We continue to see teams run into trouble using JSF ... |

### Sharing the sheet

* In Google sheets, go to 'File', choose 'Publish to the web...' and then click 'Publish'.
* Close the 'Publish to the web' dialog.
* Copy the URL of your editable sheet from the browser (Don't worry, this does not share the editable version). 

The URL will be similar to [https://docs.google.com/spreadsheets/d/1waDG0_W3-yNiAaUfxcZhTKvl7AUCgXwQw8mdPjCz86U/edit](https://docs.google.com/spreadsheets/d/1waDG0_W3-yNiAaUfxcZhTKvl7AUCgXwQw8mdPjCz86U/edit). In theory we are only interested in the part between '/d/' and '/edit' but you can use the whole URL if you want.

***Note:*** The CSV file parsing is using D3 library, so consult the D3 documentation for the data format details.

### How to aquire a Google Sheet API key and a Client ID
https://developers.google.com/sheets/api/guides/authorizing#APIKey

### Configuring the radar

Modify webpack.config.js file to set the Google sheet URL, default tab name, API key for google sheets API,and the client ID. 

```
'process.env.CLIENT_ID': JSON.stringify('1067243526160-3hj0odnjhnefgs87pa4jdikrcp0b1frh.apps.googleusercontent.com'),
'process.env.API_KEY': JSON.stringify('AIzaSyBgq7O7AqBFIWkRztygrOuXZJEIpxVAGUE'),
'process.env.GSHEET_DEFAULT_TAB': JSON.stringify('Technology Radar 2019'),
'process.env.GSHEET_URL': JSON.stringify('https://docs.google.com/spreadsheets/d/1J_JQ-9ADQAsiniQnh9B5qjaQEwe_3mL_HpQatVakftU')
```

Then follow the instructions in the docker section to deploy the application.

***Note:*** The quadrants of the radar, and the order of the rings inside the radar will be drawn in the order they appear in your data.

## Deploying with Docker
We have released BYOR as a docker image for our users. The image is available in our [DockerHub Repo](https://hub.docker.com/r/wwwthoughtworks/build-your-own-radar/). To pull and run the image, run the following commands.

```
$ docker-compose build
$ docker pull <image name>
$ docker run --p 8080:80 <image name>
$ open http://localhost:8080
```
## How to start development

```
npm install
npm run dev
```

Check the configs int the "Configuring the radar" section. 
