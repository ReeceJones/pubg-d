module pubg.request;

import std.net.curl;
import pz.config;

void setConfigLocation(string loc)
{
    pf = new PzConfig(loc, true, false);
    apiKey = pf.getValue!string("apiKey");
}

//super class for all of the requests
class ObjectRequest
{
public:
    this(string baseURI)
    {
        this.baseURI = baseURI;
        this.http = HTTP();
        http.addRequestHeader("Authorization", "Bearer " ~ apiKey);
	    http.addRequestHeader("Accept", "application/vnd.api+json");
    }
    auto request(string reqURI)
    {
        return get(baseURI ~ reqURI, http);
    }
private:
    string baseURI;
    HTTP http;
}

private
{
    PzConfig pf;
    string apiKey;
}
