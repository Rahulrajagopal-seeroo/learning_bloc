import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../controller/chart_controller.dart';
import '../widgets/legend_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chartController = Provider.of<ChartController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Outstanding Payments", style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 20),
                          const Text("Year", style: TextStyle(fontSize: 15)),
                          DropdownButton<String>(
                            value: chartController.selectedYear,
                            items: ['2023', '2024', '2025']
                                .map((year) => DropdownMenuItem<String>(
                                      value: year,
                                      child: Text(year),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              if (newValue != null) {
                                chartController.updateChartData(newValue);
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "AED 101.00",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 10,
                            barGroups: chartController.chartData
                                .asMap()
                                .entries
                                .map((entry) {
                              return BarChartGroupData(
                                x: entry.key,
                                barRods: [
                                  BarChartRodData(
                                    toY: entry.value.collectedAmount +
                                        entry.value.pendingAmount,
                                    width: 10,
                                    rodStackItems: [
                                      BarChartRodStackItem(
                                        0,
                                        entry.value.pendingAmount,
                                        const Color.fromRGBO(140, 28, 39, 1),
                                      ),
                                      BarChartRodStackItem(
                                        entry.value.pendingAmount,
                                        entry.value.pendingAmount +
                                            entry.value.collectedAmount,
                                        const Color.fromARGB(255, 98, 184, 125),
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        chartController.chartData[value.toInt()]
                                            .month,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            gridData: const FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LegendItem(
                              label: 'Collected Amount',
                              color: Color.fromARGB(255, 98, 184, 125),
                            ),
                            SizedBox(width: 20),
                            LegendItem(
                              label: 'Pending Amount',
                              color: Color.fromRGBO(140, 28, 39, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
