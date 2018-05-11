module pubg.player;

import pubg.request;
import std.json;
import std.file: write;
import std.stdio: writeln;

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
    GameModeStats getGameModeStats(string gamemode)
    {
        return new GameModeStats(this.json["data"]["attributes"]["gameModeStats"][gamemode]);
    }
private:
    JSONValue json;
}

class GameModeStats
{
public:
    this(JSONValue json)
    {
        this.json = json;
    }
    int getDBNOs()
    {
        return cast(int)this.json["DBNOs"].integer;
    }
    int getAssists()
    {
        return cast(int)this.json["assists"].integer;
    }
    int getBoosts()
    {
        return cast(int)this.json["boosts"].integer;
    }
    int getDamageDealt()
    {
        return cast(int)this.json["damageDealt"].integer;
    }
    string getDeathType()
    {
        return this.json["deathType"].str;
    }
    int getHeadshotKills()
    {
        return cast(int)this.json["headShotKills"].integer;
    }
    int getHeals()
    {
        return cast(int)this.json["heals"].integer;
    }
    int getKillPlace()
    {
        return cast(int)this.json["killPlace"].integer;
    }
    int getKillPoints()
    {
        return cast(int)this.json["killPoints"].integer;
    }
    float getKillPointsDelta()
    {
        return cast(float)this.json["killPointsDelta"].floating;
    }
    int getKillStreaks()
    {
        return cast(int)this.json["killPoints"].integer;
    }
    int getKills()
    {
        return cast(int)this.json["kills"].integer;
    }
    int getLastKillPoints()
    {
        return cast(int)this.json["lastKillPoints"].integer;
    }
    int getLastWinPoints()
    {
        return cast(int)this.json["lastWinPoints"].integer;
    }
    int getLongestKill()
    {
        return cast(int)this.json["longestKill"].integer;
    }
    int getMostDamage()
    {
        return cast(int)this.json["longestKill"].integer;
    }
    string getName()
    {
        return this.json["name"].str;
    }
    string getPlayerId()
    {
        return this.json["playerId"].str;
    }
    int getRevives()
    {
        return cast(int)this.json["revives"].integer;
    }
    int getRideDistance()
    {
        return cast(int)this.json["rideDistance"].integer;
    }
    int getRoadKills()
    {
        return cast(int)this.json["roadKills"].integer;
    }
    int getTeamKills()
    {
        return cast(int)this.json["teamKills"].integer;
    }
    int getTimeSurvived()
    {
        return cast(int)this.json["timeSurvived"].integer;
    }
    int getVehicleDestroys()
    {
        return cast(int)this.json["vehicleDestroys"].integer;
    }
    float getWalkDistance()
    {
        return cast(float)this.json["walkDistance"].floating;
    }
    int getWeaponsAcquired()
    {
        return cast(int)this.json["weaponsAcquired"].integer;
    }
    int getWinPlace()
    {
        return cast(int)this.json["winPlace"].integer;
    }
    int getWinPoints()
    {
        return cast(int)this.json["winPoints"].integer;
    }
    float getWinPointsDelta()
    {
        return cast(float)this.json["winPointsDelta"].floating;
    }
    int getWins()
    {
        return cast(int)this.json["wins"].integer;
    }
    int getLosses()
    {
        return cast(int)this.json["losses"].integer;
    }
private:
    JSONValue json;
}

class PlayerRequest : ObjectRequest 
{
public:
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
    Player getExtendedPlayer(string id, string season)
    {
        auto content = this.request("players/" ~ id ~ "/seasons/" ~ season);
        //auto seasons = this.request("seasons");
        //writeln(cast(string)seasons);
        //write("ext.json", parseJSON(cast(string)content).toPrettyString());
        return new Player(content);
    }
}
