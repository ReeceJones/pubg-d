module pubg.request;

import std.net.curl;

void setAPIKey(string key)
{
    apiKey = key;
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
    string apiKey;
}
