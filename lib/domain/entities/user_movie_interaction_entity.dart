class UserMovieInteractionEntity {
  final String id;
  final String userId;
  final String movieId;
  final String type; // 'favorite' | 'review'
  final int? rating; // 1-5 only if type='review'
  final String? comment;

  UserMovieInteractionEntity({
    required this.id,
    required this.userId,
    required this.movieId,
    required this.type,
    this.rating,
    this.comment,
  });
}
