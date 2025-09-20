import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeChart extends StatefulWidget {
  const HomeChart({super.key});

  @override
  State<HomeChart> createState() => _HomeChartState();
}

class _HomeChartState extends State<HomeChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Show',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'this year',
                            style: TextStyle(color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Icon(Icons.book, size: 18),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomContainerChart(
                    amount: 9999,
                    isInscreation: true,
                    name: 'Sales',
                    percent: 5,
                    year: 2020,
                  ),
                  CustomContainerChart(
                    amount: 9999,
                    isInscreation: false,
                    name: 'Purchase',
                    percent: 2,
                    year: 2020,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomContainerChart(
                    amount: 9999,
                    isInscreation: true,
                    name: 'Sales',
                    percent: 5,
                    year: 2020,
                  ),
                  CustomContainerChart(
                    amount: 9999,
                    isInscreation: false,
                    name: 'Purchase',
                    percent: 2,
                    year: 2020,
                  ),
                ],
              ),
            ),
            CustomLineChart(
              data: [
                SalesData(month: 'May', marketingSales: 600, casesSales: 580),
                SalesData(month: 'Jun', marketingSales: 640, casesSales: 660),
                SalesData(month: 'Jul', marketingSales: 620, casesSales: 740),
                SalesData(
                  month: 'Aug',
                  marketingSales: 680,
                  casesSales: 700,
                ), // $27632 ở đây
                SalesData(month: 'Sep', marketingSales: 660, casesSales: 660),
                SalesData(month: 'Oct', marketingSales: 620, casesSales: 670),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainerChart extends StatelessWidget {
  const CustomContainerChart({
    super.key,
    required this.name,
    required this.year,
    required this.percent,
    required this.amount,
    required this.isInscreation,
  });
  final String name;
  final int year;
  final double percent;
  final double amount;
  final bool isInscreation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      height: 123,
      width: 150,
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: isInscreation ? '-' : '+',
                      style: TextStyle(
                        color:
                            isInscreation
                                ? Colors.greenAccent
                                : Colors.redAccent,
                      ),
                    ),
                    TextSpan(
                      text: percent.toString(),
                      style: TextStyle(
                        color:
                            isInscreation
                                ? Colors.greenAccent
                                : Colors.redAccent,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        isInscreation
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: isInscreation ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '\$${amount.toString()}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Compare to ${amount.toString()} last year',
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key, required this.data});
  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.white,
      title: const ChartTitle(text: 'Sales Figures'),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(
        tooltipPosition: TooltipPosition.auto,
        enable: true,
        textStyle: const TextStyle(color: Colors.white),
        color: Colors.black87,
      ),
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: const NumericAxis(),
      series: [
        LineSeries<SalesData, String>(
          name: 'Marketing Sales',
          dataSource: data,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.marketingSales,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        LineSeries<SalesData, String>(
          name: 'Cases Sales',
          dataSource: data,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.casesSales,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}

class SalesData {
  final String month;
  final double marketingSales;
  final double casesSales;

  SalesData({
    required this.month,
    required this.marketingSales,
    required this.casesSales,
  });
}
