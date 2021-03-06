import pubg.request, pubg.match, pubg.player, pubg.season, pubg.sample;


//example: get random matches and sort the players based on the amount of kills
// void main()
// {
//  import std.stdio;
// 	setAPIKey("<api key>");
// 	SampleRequest sampleRequest = new SampleRequest("pc-na");
// 	auto sm = sampleRequest.getRandomMatches();
// 	MatchParticipant[] participants;
// 	foreach (s; sm[0..10])
// 	{
// 		MatchRequest matchRequest = new MatchRequest("pc-na");
// 		auto match = matchRequest.getMatch(s);
// 		import std.algorithm.sorting;
// 		auto p = match.getIncluded().getParticipants();
// 		foreach (x; p)
// 		{
// 			participants ~= x;
// 		}
// 	}
// 	import std.algorithm.sorting;
// 	participants.sort!("a > b");
// 	enum indent = 30;
// 	foreach (i, p; participants)
// 	{
// 		//make sure spacing is same for all names
// 		string disp = p.getName();
// 		int kills = p.getKills();
// 		for (int x = cast(int)disp.length; x < indent; x++)
// 			disp ~= ' ';
// 		writeln(disp ~ to!string(kills));
// 	}
// }
