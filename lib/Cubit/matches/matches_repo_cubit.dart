
import 'package:bt_assignment/models/matches_history.dart';
import 'package:bt_assignment/models/team.dart';
import 'package:bt_assignment/services/matches_services.dart';
import 'package:bt_assignment/services/team_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'matches_repo_state.dart';



class MatchesRepoCubit extends Cubit<MatchesRepoState> {

  MatchesRepoCubit() : super(MatchesRepoState( teamWithMostWins: null, status: MatchesRepoStatus.INITIAL));

  void fetchWinnerbyMatches() async {
    emit (MatchesRepoState(status: MatchesRepoStatus.FETCHING_MATCHES)) ;
    final matchservices = MatchServices();
    try {
      await matchservices.computeTeamWithMostWins();
      emit (MatchesRepoState(status:MatchesRepoStatus.WINNER_COMPUTED , teamWithMostWins : matchservices.teamWithMostWins()));
    }
    catch (e){
      print (e);
      emit(MatchesRepoState(status: MatchesRepoStatus.FAILURE));
    }

  }

  void fetchTeamInfo(int teamId ) async {


    final teamServices = TeamServices(teamId);
    emit(MatchesRepoState(status: MatchesRepoStatus.FETCHING_TEAM_INFO));
    try {
      var teamAllInfo = await teamServices.findbyID(teamId);
      emit (MatchesRepoState(status:MatchesRepoStatus.TEAM_INFO_SUCCESS ,teamAllInfo: teamAllInfo));
    }
    catch (e){
      print (e);
      emit(MatchesRepoState(status: MatchesRepoStatus.FAILURE));
    }

  }


}
