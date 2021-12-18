// GENERATED CODE - DO NOT MODIFY BY HAND

part of core;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TMDBMovieBasic _$$_TMDBMovieBasicFromJson(Map<String, dynamic> json) =>
    _$_TMDBMovieBasic(
      voteCount: json['vote_count'] as int?,
      id: json['id'] as int,
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      title: json['title'] as String,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      backdropPath: json['backdrop_path'] as String?,
      adult: json['adult'] as bool?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$$_TMDBMovieBasicToJson(_$_TMDBMovieBasic instance) =>
    <String, dynamic>{
      'vote_count': instance.voteCount,
      'id': instance.id,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
