# pubg-d
PUBG api wrapper written in D.
## dependencies
none
## usage
### installation
Clone the repo then add like any other library to your project by adding the following code to your dub.(json/sdl) file.
dub.json
```JSON
"pubg-d": "~>0.8.0"
```
dub.sdl
```SDL
dependency "pubg-d" version="~>0.8.0"
```
### setup
To setup the api all you need to do is set the api key using `setAPIKey(<config path>)`.
