import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_forecast_chart/charts.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ui.Image centerImage;
  late ui.Image backgroundRedImage;
  late ui.Image backgroundGreenImage;
  final int centerImageSize = 30;
  final int backgroundImageSize = 80;

  Future<ui.Image> loadImage(
      String imageName, int targetHeight, int targetWidth) async {
    final data = await rootBundle.load('assets/images/$imageName');
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: targetHeight,
      targetWidth: targetWidth,
    );
    return (await codec.getNextFrame()).image;
  }

  void loadUiImage() async {
    centerImage = await loadImage('bomb.jpg', centerImageSize, centerImageSize);
    backgroundRedImage = await loadImage(
        'rec_1.png', backgroundImageSize * 5, backgroundImageSize);
    backgroundGreenImage = await loadImage(
        'rec_2.png', backgroundImageSize * 5, backgroundImageSize);
  }

  @override
  void initState() {
    super.initState();

    loadUiImage();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(DateTime(2022, 10, 27, 3, 0, 0), 1020),
      ChartData(DateTime(2022, 10, 27, 6, 0, 0), 1019.7),
      ChartData(DateTime(2022, 10, 27, 9, 0, 0), 1019),
      ChartData(DateTime(2022, 10, 27, 12, 0, 0), 1015.5),
      ChartData(DateTime(2022, 10, 27, 15, 0, 0), 1014.1),
      ChartData(DateTime(2022, 10, 27, 18, 0, 0), 1013),
      ChartData(DateTime(2022, 10, 27, 21, 0, 0), 1012.8),
      ChartData(DateTime(2022, 10, 28, 0, 0, 0), 1009.5),
      ChartData(DateTime(2022, 10, 28, 3, 0, 0), 1009.9),
      ChartData(DateTime(2022, 10, 28, 6, 0, 0), 1010),
      ChartData(DateTime(2022, 10, 28, 9, 0, 0), 1010.5),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        backgroundColor: Colors.teal[300],
        title: const Text('Demo App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('2020', style: TextStyle(fontSize: 18)),
                        RichText(
                          text: const TextSpan(
                            text: '03/27',
                            style: TextStyle(fontSize: 28, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: '(痰)', style: TextStyle(fontSize: 22)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: RichText(
                      text: const TextSpan(
                        text: '17',
                        style: TextStyle(fontSize: 56, color: Colors.black),
                        children: [
                          TextSpan(text: '痰', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.8,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 24,
                                  color: Colors.red,
                                  margin: const EdgeInsets.only(right: 4),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '私の',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: '(C)',
                                          style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 52,
                                  color: Colors.blue,
                                  margin: const EdgeInsets.only(right: 4),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: '私の',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '(hPa)',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: '15-21',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: '金',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('19',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            Text('1013.1',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            Text('-1.1',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  child: SfCartesianChart(
                    trackballBehavior: TrackballBehavior(
                      enable: true,
                      shouldAlwaysShow: true,
                      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                      tooltipSettings: const InteractiveTooltip(
                        canShowMarker: true,
                        enable: true,
                      ),
                    ),
                    primaryXAxis: DateTimeAxis(
                      opposedPosition: true,
                      maximum: DateTime(2022, 10, 28, 9, 0, 0),
                      minimum: DateTime(2022, 10, 27, 3, 0, 0),
                      interval: 3,
                      plotBands: <PlotBand>[
                        PlotBand(
                          backgroundImage: backgroundRedImage,
                          imageBonusOffset: centerImageSize / 2,
                          isVisible: true,
                          start: DateTime(2022, 10, 27, 3, 0, 0),
                          end: DateTime(2022, 10, 27, 9, 0, 0),
                          associatedAxisStart: 1019.5,
                          associatedAxisEnd: 1009,
                          image: centerImage,
                          color: Colors.red,
                          opacity: 0.2,
                        ),
                        PlotBand(
                          backgroundImage: backgroundRedImage,
                          imageBonusOffset: centerImageSize / 2,
                          isVisible: true,
                          start: DateTime(2022, 10, 27, 9, 0, 0),
                          end: DateTime(2022, 10, 27, 15, 0, 0),
                          associatedAxisStart: 1019.5,
                          associatedAxisEnd: 1009,
                          image: centerImage,
                          color: Colors.red,
                          opacity: 0.2,
                        ),
                        PlotBand(
                          backgroundImage: backgroundRedImage,
                          imageBonusOffset: centerImageSize / 2,
                          isVisible: true,
                          start: DateTime(2022, 10, 27, 15, 0, 0),
                          end: DateTime(2022, 10, 27, 21, 0, 0),
                          associatedAxisStart: 1019.5,
                          associatedAxisEnd: 1009,
                          image: centerImage,
                          color: Colors.red,
                          opacity: 0.2,
                        ),
                        PlotBand(
                          backgroundImage: backgroundRedImage,
                          imageBonusOffset: centerImageSize / 2,
                          isVisible: true,
                          start: DateTime(2022, 10, 27, 21, 0, 0),
                          end: DateTime(2022, 10, 28, 3, 0, 0),
                          associatedAxisStart: 1019.5,
                          associatedAxisEnd: 1009,
                          image: centerImage,
                          color: Colors.red,
                          opacity: 0.2,
                        ),
                        PlotBand(
                          backgroundImage: backgroundGreenImage,
                          imageBonusOffset: centerImageSize / 2,
                          isVisible: true,
                          start: DateTime(2022, 10, 28, 3, 0, 0),
                          end: DateTime(2022, 10, 28, 9, 0, 0),
                          associatedAxisStart: 1019.5,
                          associatedAxisEnd: 1009,
                          image: centerImage,
                          color: Colors.green,
                          opacity: 0.2,
                        ),
                      ],
                    ),
                    primaryYAxis: NumericAxis(
                      maximum: 1020,
                      minimum: 1000,
                      interval: 5,
                      majorGridLines: const MajorGridLines(
                        width: 1,
                        color: Colors.blue,
                        dashArray: <double>[5, 5],
                      ),
                    ),
                    series: <ChartSeries>[
                      // Renders spline chart
                      SplineSeries<ChartData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double? y;
}
