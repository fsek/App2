import "dart:math" as math;
import "package:flutter/material.dart";
import "package:fl_chart/fl_chart.dart";

class SubmissionsBarChart extends StatefulWidget {
  const SubmissionsBarChart({
    required this.scoreDistribution,
    required this.playerScore,
    required this.optimalScore
  });

  final Map<int, int> scoreDistribution;
  final int playerScore;
  final int optimalScore;

  @override
  _SubmissionsBarChartState createState() => _SubmissionsBarChartState();
}

class _SubmissionsBarChartState extends State<SubmissionsBarChart> with SingleTickerProviderStateMixin {
  late final entries = widget.scoreDistribution.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

  late final minScore = widget.scoreDistribution.keys.reduce(math.min);
  late final maxOccurence = widget.scoreDistribution.values.reduce(math.max);
  late final amountBars = widget.optimalScore - minScore + 1;

  int? _shownTooltip;
  Future<void>? _hideTooltipFuture;
  late final _tooltipAnimationController = AnimationController(
    vsync: this,
    duration: Duration.zero,
    reverseDuration: const Duration(milliseconds: 200)
  );

  final _chartTransformationController = TransformationController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _startAnimation(widget.playerScore);
  }

  @override
  void dispose() {
    _tooltipAnimationController.dispose();
    _chartTransformationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barColorDict = {
      widget.playerScore: Theme.of(context).primaryColor,  // A bit weird on themeN where primaryColor is green
      widget.optimalScore: Colors.green[800]
    };
    const defaultBarColor = Colors.blue;

    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) => ListenableBuilder(
          listenable: Listenable.merge([  // Could split the animation into an animationController, but it works the same
            _tooltipAnimationController,  // This is pretty expensive, making the scaling a bit slow. The barGroups regenerate every time (even though the data is constant) because the barWidth changes
            _chartTransformationController
          ]),
            
          builder: (context, child) {
            final scale = _chartTransformationController.value.getMaxScaleOnAxis();
            final barWidth = scale * (constraints.maxWidth * 0.7 - 75) / amountBars;
            final currentAlpha = (255 * _tooltipAnimationController.value).toInt();

            return BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barTouchData: BarTouchData(
                  allowTouchBarBackDraw: true,
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    maxContentWidth: screenWidth,
                    tooltipBorderRadius: const BorderRadius.all(
                      Radius.circular(12)
                    ),
                    tooltipBorder: BorderSide(color: Colors.black.withAlpha(currentAlpha)),
                    getTooltipColor: (group) => (barColorDict[group.x] ?? defaultBarColor).withAlpha(currentAlpha),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        "Score: ${entries[groupIndex].key}\nOccurrences: ${rod.toY.toInt()}",
                        TextStyle(
                          color: Colors.white.withAlpha(currentAlpha),
                          fontSize: 18,
                          fontFamily: "Schoolbell"
                        )
                      );
                    }
                  ),
                  handleBuiltInTouches: false,
                  touchCallback: (FlTouchEvent event, barTouchResponse) {
                    // event is FlPanStartEvent || event is FlPanUpdateEvent || event is FlPanEndEvent ||  // Wish I could use these when the graph is not zoomed in but FlTransformationConfig eats all pan gestures even if pan is disabled
                    if (!(event is FlTapUpEvent || event is FlLongPressStart || event is FlLongPressMoveUpdate || event is FlLongPressEnd)) return;
                    if (barTouchResponse == null || barTouchResponse.spot == null) return;

                    final tappedBar = barTouchResponse.spot!.touchedBarGroup.x;
                    _startAnimation(tappedBar);
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)
                  ),
                  bottomTitles: AxisTitles(
                    axisNameSize: 30,
                    axisNameWidget: const Text(
                      "Score",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Schoolbell"
                      )
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: scale == 1 ? 1 : amountBars / scale,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        if (scale == 1 && value != minScore && value != widget.optimalScore) return const SizedBox.shrink();  // Because the axis is categorical we can't use interval and instead have to use this

                        final usedInterval = amountBars ~/ scale;  // Evenly space labels so that at least one is always showing
                        if ((value.toInt() - minScore) % usedInterval != 0 && value != minScore && value != widget.optimalScore) return const SizedBox.shrink();

                        return SideTitleWidget(
                          space: 5,
                          meta: meta,
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Schoolbell"
                            )
                          )
                        );
                      }
                    )
                  ),
                  leftTitles: AxisTitles(
                    axisNameSize: 30,
                    axisNameWidget: const Text(
                      "Occurrence",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Schoolbell"
                      )
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: maxOccurence.toDouble(),
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          space: 5,
                          meta: meta,
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Schoolbell"
                            )
                          )
                        );
                      }
                    )
                  )
                ),
                barGroups: entries.map((entry) => BarChartGroupData(
                  showingTooltipIndicators: _shownTooltip == entry.key ? [0] : [],
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.toDouble(),
                      color: barColorDict[entry.key] ?? defaultBarColor,
                      width: barWidth,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4)
                      )
                    ),
                  ]
                )).toList()
              ),
              transformationConfig: FlTransformationConfig(
                scaleAxis: FlScaleAxis.horizontal,
                minScale: 1,
                maxScale: (amountBars / 5).ceilToDouble(),  // Minimum of 5 bars in frame
                transformationController: _chartTransformationController
              )
            );
          }
      )
    );
  }

  void _startAnimation(int bar, {Duration duration = const Duration(seconds: 4)}) async {  // Tried with callCounter but this was just easier
    _tooltipAnimationController.forward(from: _shownTooltip == bar ? null : 0);  // start from zero if clicking on a new bar
    _shownTooltip = bar;

    // _hideTooltipFuture = Future.delayed(duration, () async {
    //   if (!mounted) return;

    //   await _tooltipAnimationController.reverse();
    //   _shownTooltip = null;
    // });

    // Kind of a scuffed way to do it. If anyone has a better solution, please implement!
    final tooltipFuture = Future.delayed(duration);
    _hideTooltipFuture = tooltipFuture;

    await tooltipFuture;
    if (!mounted) return;
    if (_hideTooltipFuture != tooltipFuture) return;  // A different bar has been clicked

    await _tooltipAnimationController.reverse();
    if (!mounted) return;
    if (_hideTooltipFuture != tooltipFuture) return;  // A different bar has been clicked during the fade-out

    setState(() {  // we have to use setState since the tooltip is not showing anymore
      _shownTooltip = null;
    });
  }
}