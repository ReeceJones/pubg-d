module pubg.match;

import std.stdio:writeln;
import std.file: write;
import pubg.request;
import std.json;
import pz.file;
import std.conv: parse;

class MatchAttributes
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
    int getDuration()
    {
        return cast(int)this.json["duration"].integer;
    }
    string getGameMode()
    {
        return this.json["gameMode"].str;
    }
    string getMapName()
    {
        return this.json["mapName"].str;
    }
    string getShardId()
    {
        return this.json["shardId"].str;
    }
    string getTitleId()
    {
        return this.json["titleId"].str;
    }
private:
    JSONValue json;
}

class MatchAssets
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string getId()
    {
        return this.json["data"].array[0]["id"].str;
    }
private:
    JSONValue json;
}

class MatchRosters
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string[] getRosterIds()
    {
        auto data = this.json["data"].array;
        string[] ret;
        foreach (j; data)
        {
            if (j["type"].str == "roster")
                ret ~= j["id"].str;
        }
        return ret;
    }
private:
    JSONValue json;
}

class MatchRelationships
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    MatchAssets getAssets()
    {
        return new MatchAssets(this.json["assets"]);
    }
    MatchRosters getRosters()
    {
        return new MatchRosters(this.json["rosters"]);
    }
private:
    JSONValue json;
}

class MatchLinks
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string getSchema()
    {
        return this.json["schema"].str;
    }
    string getSelf()
    {
        return this.json["self"].str;
    }
private:
    JSONValue json;
}

class MatchData
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    MatchAttributes getAttributes()
    {
        return new MatchAttributes(this.json["attributes"]);
    }
    MatchRelationships getRelationships()
    {
        return new MatchRelationships(this.json["relationships"]);
    }
    string getType()
    {
        return this.json["type"].str;
    }
    string getId()
    {
        return this.json["id"].str;
    }
private:
    JSONValue json;
}

class MatchParticipant
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string getActor()
    {
        return this.json["actor"].str;
    }
    string getShardId()
    {
        return this.json["shardId"].str;
    }
    int getDBNOs()
    {
        return cast(int)this.json["attributes"]["stats"]["DBNOs"].integer;
    }
    int getAssists()
    {
        return cast(int)this.json["attributes"]["stats"]["assists"].integer;
    }
    int getBoosts()
    {
        return cast(int)this.json["attributes"]["stats"]["boosts"].integer;
    }
    int getDamageDealt()
    {
        return cast(int)this.json["attributes"]["stats"]["damageDealt"].integer;
    }
    string getDeathType()
    {
        return this.json["attributes"]["stats"]["deathType"].str;
    }
    int getHeadshotKills()
    {
        return cast(int)this.json["attributes"]["stats"]["headShotKills"].integer;
    }
    int getHeals()
    {
        return cast(int)this.json["attributes"]["stats"]["heals"].integer;
    }
    int getKillPlace()
    {
        return cast(int)this.json["attributes"]["stats"]["killPlace"].integer;
    }
    int getKillPoints()
    {
        return cast(int)this.json["attributes"]["stats"]["killPoints"].integer;
    }
    float getKillPointsDelta()
    {
        return cast(float)this.json["attributes"]["stats"]["killPointsDelta"].floating;
    }
    int getKillStreaks()
    {
        return cast(int)this.json["attributes"]["stats"]["killPoints"].integer;
    }
    int getKills()
    {
        return cast(int)this.json["attributes"]["stats"]["kills"].integer;
    }
    int getLastKillPoints()
    {
        return cast(int)this.json["attributes"]["stats"]["lastKillPoints"].integer;
    }
    int getLastWinPoints()
    {
        return cast(int)this.json["attributes"]["stats"]["lastWinPoints"].integer;
    }
    int getLongestKill()
    {
        return cast(int)this.json["attributes"]["stats"]["longestKill"].integer;
    }
    int getMostDamage()
    {
        return cast(int)this.json["attributes"]["stats"]["longestKill"].integer;
    }
    string getName()
    {
        return this.json["attributes"]["stats"]["name"].str;
    }
    string getPlayerId()
    {
        return this.json["attributes"]["stats"]["playerId"].str;
    }
    int getRevives()
    {
        return cast(int)this.json["attributes"]["stats"]["revives"].integer;
    }
    int getRideDistance()
    {
        return cast(int)this.json["attributes"]["stats"]["rideDistance"].integer;
    }
    int getRoadKills()
    {
        return cast(int)this.json["attributes"]["stats"]["roadKills"].integer;
    }
    int getTeamKills()
    {
        return cast(int)this.json["attributes"]["stats"]["teamKills"].integer;
    }
    int getTimeSurvived()
    {
        return cast(int)this.json["attributes"]["stats"]["timeSurvived"].integer;
    }
    int getVehicleDestroys()
    {
        return cast(int)this.json["attributes"]["stats"]["vehicleDestroys"].integer;
    }
    float getWalkDistance()
    {
        return cast(float)this.json["attributes"]["stats"]["walkDistance"].floating;
    }
    int getWeaponsAcquired()
    {
        return cast(int)this.json["attributes"]["stats"]["weaponsAcquired"].integer;
    }
    int getWinPlace()
    {
        return cast(int)this.json["attributes"]["stats"]["winPlace"].integer;
    }
    int getWinPoints()
    {
        return cast(int)this.json["attributes"]["stats"]["winPoints"].integer;
    }
    float getWinPointsDelta()
    {
        return cast(float)this.json["attributes"]["stats"]["winPointsDelta"].floating;
    }
    //for example
    /*override int opCmp(Object other)
    {
        if (other is null || this is null)
            return 0;
        if (this.getKills() == (cast(MatchParticipant)other).getKills())
            return 0;
        return this.getKills() -(cast(MatchParticipant)other).getKills();
    }*/
private:
    JSONValue json;
}

class MatchRoster
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    string getShardId()
    {
        return this.json["attributes"]["shardId"].str;
    }
    int getRank()
    {
        return cast(int)this.json["attributes"]["stats"]["rank"].integer;
    }
    int getTeamId()
    {
        return cast(int)this.json["attributes"]["stats"]["teamId"].integer;
    }
    string getId()
    {
        return this.json["id"].str;
    }
    bool getWon()
    {
        auto s = this.json["attributes"]["won"].str;
        return parse!bool(s);
    }
    string[] getParticipantIds()
    {
        string[] ret;
        foreach (j; this.json["relationships"]["participants"]["data"].array)
        {
            if (j["type"].str == "participant")
                ret ~= j["id"].str;
        }
        return ret;
    }
private:
    JSONValue json;
}

class MatchIncluded
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    MatchParticipant[] getParticipants()
    {
        MatchParticipant[] stats;
        auto data = this.json.array;
        foreach(j; data)
        {
            if (j["type"].str == "participant")
            {
                stats ~= new MatchParticipant(j);
            }
        }
        return stats;
    }
    MatchRoster[] getRosters()
    {
        MatchRoster[] rosters;
        auto data = this.json.array;
        foreach(j; data)
        {
            if (j["type"].str == "roster")
            {
                rosters ~= new MatchRoster(j);
            }
        }
        return rosters;
    }
private:
    JSONValue json;
}

class Match
{
public:
    this(char[] content)
    {
        this.json = parseJSON(cast(string)content);
        //auto data = this.json["included"];
        //writeln(this.json.toPrettyString());
        //write("test.json", this.json.toPrettyString());
    }
    MatchData getData()
    {
        return new MatchData(this.json["data"]);
    }
    MatchIncluded getIncluded()
    {
        return new MatchIncluded(this.json["included"]);
    }
private:
    JSONValue json;
}

class MatchRequest : ObjectRequest
{
public:
    this(string region)
    {
        super("https://api.playbattlegrounds.com/shards/" ~ region ~ "/");
    }
    Match getMatch(string matchID)
    {
        return new Match(this.request("matches/" ~ matchID));
    }
}