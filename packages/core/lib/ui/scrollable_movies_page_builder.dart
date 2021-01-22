import 'package:flutter/material.dart';

class ScrollableMoviesPageBuilder extends StatefulWidget {
  const ScrollableMoviesPageBuilder(
      {Key key,
      @required this.title,
      @required this.builder,
      this.onNextPageRequested})
      : super(key: key);
  final String title;
  final Function(BuildContext, ScrollController) builder;
  final VoidCallback onNextPageRequested;

  @override
  _ScrollableMoviesPageBuilderState createState() =>
      _ScrollableMoviesPageBuilderState();
}

class _ScrollableMoviesPageBuilderState
    extends State<ScrollableMoviesPageBuilder> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      widget.onNextPageRequested?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.builder(context, _scrollController),
      backgroundColor: Colors.black,
    );
  }
}
