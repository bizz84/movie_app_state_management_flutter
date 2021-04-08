import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(
      {Key? key, required this.isFavourite, this.onFavouriteChanged})
      : super(key: key);
  final bool isFavourite;
  final ValueChanged<bool>? onFavouriteChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onFavouriteChanged?.call(!isFavourite),
      child: Container(
        width: 36.0,
        height: 36.0,
        child: Icon(Icons.favorite,
            color: isFavourite ? Colors.red : Colors.white),
      ),
    );
  }
}
