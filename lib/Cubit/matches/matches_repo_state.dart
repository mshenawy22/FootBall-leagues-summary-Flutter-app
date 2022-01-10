part of 'matches_repo_cubit.dart';


enum MatchesRepoStatus { INITIAL , FETCHING_MATCHES, WINNER_COMPUTED, FAILURE }

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