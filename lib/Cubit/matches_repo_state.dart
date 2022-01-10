part of 'matches_repo_cubit.dart';


enum MatchesRepoStatus { INITIAL , FETCHING_MATCHES, WINNER_COMPUTED, FETCHING_TEAM_INFO , TEAM_INFO_SUCCESS, FAILURE }

class MatchesRepoState {
  Team? teamWithMostWins;
  MatchesRepoStatus status;
  // Competition competition ;

  MatchesRepoState({
    this.teamWithMostWins,
    required this.status
    // required this.competition,
  });


}