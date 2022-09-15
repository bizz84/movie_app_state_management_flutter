import 'package:flutter/material.dart';
import 'package:core/api/tmdb_api.dart';
import 'package:transparent_image/transparent_image.dart';

// TODO: Add Favourite Button builder
class PosterTile extends StatelessWidget {
  const PosterTile({
    this.imagePath,
    // debugging hint to show the tile index
    this.debugIndex,
    this.favouriteBuilder,
  });
  final String? imagePath;
  final int? debugIndex;
  final WidgetBuilder? favouriteBuilder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _Poster(imagePath: imagePath),
        TopGradient(),
        if (debugIndex != null)
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              '$debugIndex',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        if (favouriteBuilder != null)
          Positioned(
            right: 0,
            top: 0,
            child: favouriteBuilder!(context),
          ),
      ],
    );
  }
}

class TopGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
          stops: [0.0, 0.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: TMDBApi.imageUrl(imagePath!, PosterSize.w154),
        fit: BoxFit.fitWidth,
      );
    }
    return Image.memory(kTransparentImage);
  }
}
