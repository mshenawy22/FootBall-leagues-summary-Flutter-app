
import 'package:bt_assignment/Cubit/matches/matches_repo_cubit.dart';
import 'package:bt_assignment/models/matches_history.dart';
import 'package:bt_assignment/models/team.dart';
import 'package:bt_assignment/services/matches_services.dart';
import 'package:bt_assignment/services/team_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teams_repo_state.dart';



class TeamsRepoCubit extends Cubit<TeamsRepoState> {

  TeamsRepoCubit() : super(TeamsRepoState( status: TeamsRepoStatus.INITIAL));


  void fetchTeamInfo(int teamId ) async {
    final teamServices = TeamServices(teamId);
    emit(TeamsRepoState(status: TeamsRepoStatus.FETCHING_TEAM_INFO));
    try {
      var teamAllInfo = await teamServices.findbyID(teamId);
      emit (TeamsRepoState(status:TeamsRepoStatus.TEAM_INFO_SUCCESS ,teamAllInfo: teamAllInfo));
    }
    catch (e){
      print (e);
      emit(TeamsRepoState(status: TeamsRepoStatus.FAILURE));
    }

  }


}
