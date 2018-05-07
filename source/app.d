import std.stdio, std.conv: to;
import std.net.curl;
import pubg.request, pubg.match, pubg.player, pubg.season;


//example: sorting players by their amount of kills in a game
/*void main()
{
	setConfigLocation("api.conf");
	MatchRequest matchRequest = new MatchRequest("pc-na");
	//auto content = matchRequest.getMatch("e7fdc02f-4fab-495d-8075-7988bb0d23ef");
	Match match = matchRequest.getMatch("e7fdc02f-4fab-495d-8075-7988bb0d23ef");
	auto included = match.getIncluded();
	auto participants = included.getParticipants();

	import std.algorithm.sorting;
	participants.sort!("a > b");
	enum indent = 30;
	foreach (i, p; participants)
	{
		//make sure spacing is same for all names
		string disp = p.getName();
		int kills = p.getKills();
		for (int x = cast(int)disp.length; x < indent; x++)
			disp ~= ' ';
		writeln(disp ~ to!string(kills));
	}
}
*/

void main()
{
	setConfigLocation("api.conf");
	//PlayerRequest playerRequest = new PlayerRequest("pc-na");
	//Player player = playerRequest.getPlayerFromName("ReeceTheGeese");
	// writeln(player.getAttributes().getName());
	// writeln(player.getId());
	// Player player = playerRequest.getExtendedPlayer("account.f80823e2cd624fe8a5a0aa1899ffcc41", "division.bro.official.2018-05");
	// writeln(player.getGameModeStats("squad-fpp").getKills());
}