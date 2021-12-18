// GENERATED CODE - DO NOT MODIFY BY HAND

part of core;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TMDBMoviesResponse _$$_TMDBMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TMDBMoviesResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TMDBMovieBasic.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TMDBMoviesResponseToJson(
        _$_TMDBMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'errors': instance.errors,
    };
