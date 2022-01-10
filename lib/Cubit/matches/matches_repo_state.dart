part of 'matches_repo_cubit.dart';


enum MatchesRepoStatus { INITIAL , FETCHING_MATCHES, WINNER_COMPUTED, FETCHING_TEAM_INFO , TEAM_INFO_SUCCESS, FAILURE }

class MatchesRepoState {
  Team? teamWithMostWins;
  TeamModel? teamAllInfo;
  MatchesRepoStatus status;

  MatchesRepoState({
    this.teamWithMostWins,
    this.teamAllInfo,
    required this.status
    // required this.competition,
  });


}