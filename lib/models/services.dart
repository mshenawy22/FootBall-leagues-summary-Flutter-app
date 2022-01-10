import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'matches_history.dart';

 class CountaWin{
   NumberofWins(){
   count =  (count ==0)? 0 : count++;
   }
  static int count =0;
}


class Team extends Equatable{
  Team({this.id, this.name});

  final int? id ;
  final String? name;

  @override
  List<Object?> get props =>[this.id , this.name];
}


class  MatchServices   {

    MatchesHistory? matchesHistory;
    Map matchWinners = Map <String, int>();

 
 
 


  static const _baseUrl = 'api.football-data.org';
  static const String _GET_MATCHES = '/v2/competitions/2021/matches/';
  static const Map<String, String> _QUERY_PARAMS =
  {
    'dateFrom' : '2021-10-08',
    'dateTo'   : '2022-01-09',
    'status'   :  'FINISHED'
  };

  Future<MatchesHistory> getMatchesList() async {
    Uri uri = Uri.https(_baseUrl, _GET_MATCHES , _QUERY_PARAMS);
    print (uri);

    final response = await http.get(
      uri,
      headers: {
        'X-Auth-Token': 'cd029676c88b495da48839aefb25702c',
      },
    );
    matchesHistory = await MatchesHistory.fromJson(response.body);
    return matchesHistory! ;

  }


  createWinnerTable()
  {

    
    if (matchesHistory != null)
    {

      matchesHistory!.matches?.forEach((match) {

        switch (match.score!.winner) {
          
          case Winner.AWAY_TEAM:
            // matchWinners[Team(id : match.awayTeam?.id ,name: match.awayTeam?.name)]  ==null ? 0 :  CountaWin() ;
            matchWinners[match.awayTeam?.name] =
            ( matchWinners[match.awayTeam?.name] == null ?0 : ++matchWinners[match.awayTeam?.name]);
            // print ( '${match.awayTeam!.name} : No of wons  ${  matchWinners[match.awayTeam?.name]}');
            break;

          case Winner.HOME_TEAM:
            matchWinners[match.homeTeam?.name] =
            ( matchWinners[match.homeTeam?.name] == null ? 0 : ++matchWinners[match.homeTeam?.name]);

             // print('${match.homeTeam?.name} : No of wons ${matchWinners[match.homeTeam?.name]}');
            break;
          case Winner.DRAW:
            //do nothing
            break;
        }

      });
    }


  }

  sortWinnerTablesbyWins()
  {
    
  }








}



