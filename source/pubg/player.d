module pubg.player;

import pubg.request;
import std.json;
import std.file: write;

class PlayerAttributes
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string getCreationDate()
    {
        return this.json["createdAt"].str;
    }
    string getName()
    {
        return this.json["name"].str;
    }
    string getPatchVersion()
    {
        return this.json["patchVersion"].str;
    }
    string getShardId()
    {
        return this.json["shardId"].str;
    }
    string getTitleId()
    {
        return this.json["titleId"].str;
    }
    string getUpdateDate()
    {
        return this.json["updatedAt"].str;
    }
private:
    JSONValue json;
}

class PlayerRelationships
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string[] getMatchIds()
    {
        string[] matches;
        auto data = this.json["matches"]["data"].array;
        foreach (j; data)
        {
            matches ~= j["id"].str;
        }
        return matches;
    }
private:
    JSONValue json;
}

class Player
{
public:
    this(char[] content)
    {
        this.json = parseJSON(cast(string)content);
    }
    PlayerAttributes getAttributes()
    {
        return new PlayerAttributes(this.json["data"].array[0]["attributes"]);
    }
    PlayerRelationships getRelationships()
    {
        return new PlayerRelationships(this.json["data"].array[0]["relationships"]);
    }
    string getType()
    {
        return this.json["data"].array[0]["type"].str;
    }
    string getId()
    {
        return this.json["data"].array[0]["id"].str;
    }
private:
    JSONValue json;
}

class PlayerRequest : ObjectRequest 
{
    this(string region)
    {
        super("https://api.playbattlegrounds.com/shards/" ~ region ~ "/");
    }
    Player getPlayerFromName(string name)
    {
        return new Player(this.request("players?filter[playerNames]=" ~ name));
    }
    Player getPlayerFromId(string id)
    {
        return new Player(this.request("players?filter[playerIds]=" ~ id));
    }
}