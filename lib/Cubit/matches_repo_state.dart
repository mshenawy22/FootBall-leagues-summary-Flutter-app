part of 'matches_repo_cubit.dart';


enum MatchesRepoStatus { initial, loading, success, failure }

extension MatchesRepoStatusX on MatchesRepoStatus {
  bool get isInitial => this == MatchesRepoStatus.initial;
  bool get isLoading => this == MatchesRepoStatus.loading;
  bool get isSuccess => this == MatchesRepoStatus.success;
  bool get isFailure => this == MatchesRepoStatus.failure;
}

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