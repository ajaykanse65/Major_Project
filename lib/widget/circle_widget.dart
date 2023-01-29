import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircleBarWidget extends StatefulWidget {
  const CircleBarWidget({Key? key}) : super(key: key);

  @override
  State<CircleBarWidget> createState() => _CircleBarWidgetState();
}

class _CircleBarWidgetState extends State<CircleBarWidget> {
  late List<DAYSData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(150, 150, 150, 150),
          child: Expanded(
            child: SfCircularChart(
              legend: Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                DoughnutSeries<DAYSData, String>(
                  dataSource: _chartData,
                  xValueMapper: (DAYSData data, _) => data.continent,
                  yValueMapper: (DAYSData data, _) => data.days,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DAYSData> getChartData() {
    final List<DAYSData> chartData = [
      DAYSData('Days Use', 118),
      DAYSData('Days Left', 247)
    ];
    return chartData;
  }
}

class DAYSData {
  DAYSData(this.continent, this.days);
  final String continent;
  final int days;
}
