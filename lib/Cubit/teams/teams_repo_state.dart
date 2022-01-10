part of 'teams_repo_cubit.dart';


enum TeamsRepoStatus { INITIAL , FETCHING_TEAM_INFO , TEAM_INFO_SUCCESS, FAILURE }

class TeamsRepoState {

  TeamModel? teamAllInfo;
  TeamsRepoStatus status;

  TeamsRepoState ({
    required this.status,
    this.teamAllInfo
  });


}