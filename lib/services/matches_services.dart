import 'dart:collection';
import 'dart:core';
export 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/matches_history.dart' hide Duration;
import 'api_config.dart';



class Team extends Equatable{
  Team({required  this.teamBasicInfo , required  this.numofWins , this.competition});

  final TeamBasicInfo teamBasicInfo;
  Competition? competition;
  final int numofWins;

  @override
  List<Object?> get props =>[ this.teamBasicInfo , this.numofWins];
}


class  MatchServices   {
  late Team _teamWithMostWins ;
  late Competition competition;




  DateToday(){
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime.now());

  }


  Date30daysAgo(){

    DateFormat formatter = DateFormat('yyyy-MM-dd');

    DateTime _date = DateTime.now().subtract(Duration(days: 30));
    return formatter.format(_date);
  }


  Future<MatchesHistoryModel> getMatchesList() async {

    var queryParams = {
      'dateFrom' : Date30daysAgo(),
      'dateTo'   :  DateToday(),
      'status'   :  'FINISHED'

    };
    Uri uri = Uri.https(BASE_URL, GET_MATCHES , queryParams);

    developer.log(uri.toString(), name: 'just logging');
    print(uri.toString());

    final response = await http.get(
      uri,
      headers: {
        'X-Auth-Token': API_KEY,
      },
    );

    MatchesHistoryModel _matchesHistory = await MatchesHistoryModel.fromJson(response.body);
    return _matchesHistory ;

  }

  computeTeamWithMostWins() async
  {
    var _matchesHistory = await getMatchesList();
    competition = _matchesHistory.competition!;
    Map <TeamBasicInfo, int> matchWinners = await createWinnerTable(_matchesHistory);
     matchWinners     = sortWinnerTablesbyWins(matchWinners);
    _teamWithMostWins = Team (teamBasicInfo : matchWinners.entries.first.key, numofWins: matchWinners.entries.first.value  ) ;
    _teamWithMostWins.competition = competition ;

    print('Team with most wins is ${_teamWithMostWins.teamBasicInfo.name}  with ${_teamWithMostWins.numofWins} wins  ');

  }


  createWinnerTable(MatchesHistoryModel _matchesHistory ) async
  {
    // where Map <TeamID , Score>
    Map matchWinners = Map <TeamBasicInfo, int>();

    if (_matchesHistory != null)
    {


      _matchesHistory.matches!.forEach((match) {

        switch (match.score!.winner) {

          case Winner.AWAY_TEAM:
            // matchWinners[Team(id : match.awayTeam?.id ,name: match.awayTeam?.name)]  ==null ? 0 :  CountaWin() ;
            matchWinners[match.awayTeam] =
            ( matchWinners[match.awayTeam] == null ?0 : ++matchWinners[match.awayTeam]);
            // developer.log( ( '${match.awayTeam!.name} : No of wons  ${  matchWinners[match.awayTeam?.name]}');
            break;

          case Winner.HOME_TEAM:
            matchWinners[match.homeTeam] =
            ( matchWinners[match.homeTeam] == null ? 0 : ++matchWinners[match.homeTeam]);

             // developer.log('${match.homeTeam?.name} : No of wons ${matchWinners[match.homeTeam?.name]}');
            break;
          case Winner.DRAW:
            //do nothing
            break;
        }

      });
    }
    else {
      developer.log('null _matchesHistory', name: 'null Errors' );

    }

    return matchWinners;


  }

  sortWinnerTablesbyWins(Map <TeamBasicInfo, int> matchWinners)
  {

      var sortedEntries = matchWinners.entries.toList()..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        return diff;
      });

      matchWinners..clear()..addEntries(sortedEntries);

      return matchWinners;
  }

  Team teamWithMostWins()
  {
    return _teamWithMostWins ;
  }


}

