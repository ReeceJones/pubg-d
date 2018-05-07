module pubg.sample;
import pubg.match;
import pubg.request;
import std.json;
import std.file: write;

class SampleRequest : ObjectRequest
{
    this(string region)
    {
        super("https://api.playbattlegrounds.com/shards/" ~ region ~ "/");
    }
    string[] getRandomMatches()
    {
        auto content = this.request("samples");
        write("sample.json", parseJSON(cast(string)content).toPrettyString);
        string[] matches;
        foreach (m; parseJSON(content)["data"]["relationships"]["matches"]["data"].array)
        {
            matches ~= m["id"].str;
        }
        return matches;
    }
}