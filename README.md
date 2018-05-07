# pubg-d
PUBG api wrapper written in D.
## dependencies
    -PzConfig
## usage
### installation
Clone the repo then add like any other library to your project by adding the following code to your dub.(json/sdl) file.
```JSON
"pubg-d": {
    "version": "~master",
    "path": "<path to pubg-d folder>"
} 
```
```SDL
dependency "pubg-d" version="~master" path="<path to pubg-d folder>"
```
### setup
Place your api key in a config file using the following `apiKey <api key>".
To setup the api all you need to do is set the config location using `setConfigLocation(<config path>)`.
### using the api
