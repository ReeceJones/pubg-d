module pubg.season;
import pubg.request;
import std.file: write;
import std.json;

class Season
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    bool getCurrentSeason()
    {
        return cast(bool)this.json["attributes"]["isCurrentSeason"].integer;
    }
    bool getOffSeason()
    {
        return cast(bool)this.json["attributes"]["isOffSeason"].integer;
    }
    string getId()
    {
        return this.json["id"].str;
    }
private:
    JSONValue json;
}

class SeasonRequest : ObjectRequest
{
    this(string region)
    {
        super("https://api.playbattlegrounds.com/shards/" ~ region ~ "/");
    }
    Season getSeason(uint index)
    {
        auto content = this.request("seasons");
        return new Season(parseJSON(content)["data"].array[index]);
    }
    Season[] getSeasons()
    {
        auto content = this.request("seasons");
        Season[] seasons;
        foreach (s; parseJSON(content)["data"].array)
            seasons ~= new Season(s);
        return seasons;
    }
}