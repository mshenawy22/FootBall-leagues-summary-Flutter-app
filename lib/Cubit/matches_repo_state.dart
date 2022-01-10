part of 'matches_repo_cubit.dart';


enum MatchesRepoStatus { initial, loading, success, failure }

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