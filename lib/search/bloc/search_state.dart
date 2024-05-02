part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  loading,
  populated,
  failure,
}

enum SearchType {
  popular,
  relevant,
}
class SearchState extends Equatable {
  const SearchState({
    required this.topics,
    required this.status,
    required this.searchType,
  });

  const SearchState.initial()
      : this(
          topics: const [],
          status: SearchStatus.initial,
          searchType: SearchType.popular,
        );


  final List<String> topics;

  final SearchStatus status;

  final SearchType searchType;

  @override
  List<Object?> get props => [topics, status, searchType];

  SearchState copyWith({
    List<String>? topics,
    SearchStatus? status,
    SearchType? searchType,
  }) =>
      SearchState(
        topics: topics ?? this.topics,
        status: status ?? this.status,
        searchType: searchType ?? this.searchType,
      );
}
