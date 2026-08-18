import "package:flutter/material.dart";
import "package:api_client/api_client.dart";
import "package:fsek_mobile/services/api.service.dart";
import "package:dio/dio.dart";
import "asset_handler.dart";
import "enclose_moose_level_placeholder_page.dart";
import "enclose_moose_level_page.dart";

class EncloseMoosePage extends StatefulWidget {
  @override
  _EncloseMooseState createState() => _EncloseMooseState();
}

class _EncloseMooseState extends State<EncloseMoosePage> with TickerProviderStateMixin {
  List<EncloseMooseLevelRead>? _levels;
  bool _exceptionOccurred = false;

  late final PageController? _pageController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheAllAssets();
    });

    _fetchLevels();
  }

  void _precacheAllAssets() {
    for (final frame in AssetHandler.getAllFrames()) {
      precacheImage(AssetImage(frame), context);
    }
  }

  Future<void> _fetchLevels() async {
    try {
      final response = await ApiService.apiClient.getEncloseMooseApi().encloseMooseGetAllLevels();

      if (!mounted) return;

      setState(() {
        _levels = response.data!
          .where((level) => level.dayIndex != null)
          .followedBy(response.data!
          .where((level) => level.dayIndex == null))
          .toList();
      });

      final lastDailyIndex = _levels!.lastIndexWhere((level) => level.dayIndex != null);
      _pageController = PageController(initialPage: lastDailyIndex != -1 ? lastDailyIndex : 0);
    } on DioException {  // catch (e) {
      setState(() {
        _exceptionOccurred = true;
      });

      _pageController = null;  // needs to be initialized
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_levels == null) {
      if (_exceptionOccurred) {
        return EncloseMooseGamePlaceholderPage(reason: .connectionError);
      } else {
        return EncloseMooseGamePlaceholderPage(reason: .loading);
      }
    } else if (_levels!.isEmpty) {
      return EncloseMooseGamePlaceholderPage(reason: .noLevels);
    }

    return PageView.builder(
      controller: _pageController!,
      allowImplicitScrolling: true,
      physics: const NeverScrollableScrollPhysics(),
      // scrollCacheExtent: ScrollCacheExtent.viewport(_levels.length.toDouble()),  // keeps all pages alive. Too expensive, consider only saving game state (sharedPreferences) and then using that
      itemCount: _levels!.length,
      itemBuilder: (context, index) {
        final level = _levels![index];

        return EncloseMooseLevelPage(
          pageController: _pageController,
          level: level,
          availableLevels: _levels!
        );
      }
    );
  }
}
