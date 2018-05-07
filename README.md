# pubg-d
PUBG api wrapper written in D.
## dependencies
none
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
To setup the api all you need to do is set the api key using `setAPIKey(<config path>)`.
