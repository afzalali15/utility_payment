import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:utility_payment/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var historyData = [
    {'month': 'DEC', 'amount': 130},
    {'month': 'JAN', 'amount': 90},
    {'month': 'FEB', 'amount': 120},
    {'month': 'MAR', 'amount': 143},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundStart,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.backgroundStart, AppColors.backgroundEnd],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      //Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Afzal',
                                style: TextStyle(color: Colors.white, fontSize: 24, height: 1.2, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Consumer: 123456',
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          Image.asset('assets/images/logo.png'),
                        ],
                      ),
                      const SizedBox(height: 32),
                      //Quick Actions
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.iconBgColor,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.fireplace_outlined,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                //Title
                                const Text(
                                  'TIPS FOR\nSUSTAINABILITY',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 14, height: 1.2, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          //Divider
                          Container(
                            width: 1,
                            height: 100,
                            color: Colors.white24,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                //Icon
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.iconBgColor,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.content_paste_search,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                //Title
                                const Text(
                                  'BILLS &\nPAYMENTS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 14, height: 1.2, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 64),
                      //Amount and Pay
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Amount
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'AMOUNT DUE (AED)',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '143.50',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  height: 1,
                                  fontWeight: FontWeight.w900,
                                ),
                              )
                            ],
                          ),
                          //Pay Button
                          MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.buttonStartColor,
                                    AppColors.buttonEndColor,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Text(
                                'PAY NOW',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 64),
                      //Graph
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Chart(
                          data: historyData,
                          variables: {
                            'month': Variable(
                              accessor: (Map map) => map['month'] as String,
                            ),
                            'amount': Variable(
                              accessor: (Map map) => map['amount'] as num,
                            ),
                          },
                          marks: [
                            IntervalMark(
                              label: LabelEncode(
                                encoder: (tuple) => Label(
                                  tuple['amount'].toString(),
                                  LabelStyle(textStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              elevation: ElevationEncode(value: 0, updaters: {
                                'tap': {true: (_) => 5}
                              }),
                              gradient: GradientEncode(
                                value: LinearGradient(
                                  colors: [AppColors.graphStartColor, AppColors.graphEndColor],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              shape: ShapeEncode(
                                value: RectShape(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                )),
                              ),
                              size: SizeEncode(value: 40),
                            )
                          ],
                          axes: [
                            AxisGuide(
                              line: PaintStyle(
                                strokeColor: AppColors.borderColor,
                              ),
                              label: LabelStyle(
                                textStyle: TextStyle(color: AppColors.borderColor, fontSize: 18),
                                offset: const Offset(0, 4),
                              ),
                            ),
                            AxisGuide(
                              label: LabelStyle(
                                textStyle: TextStyle(color: AppColors.borderColor, fontSize: 14),
                              ),
                              grid: PaintStyle(strokeColor: AppColors.graphGridColor),
                            ),
                          ],
                          selections: {'tap': PointSelection(dim: Dim.x)},
                          crosshair: CrosshairGuide(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 32,
            right: 32,
            child: Container(
              height: 64,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.navigationBgColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.home_rounded,
                    color: AppColors.primaryColor,
                  ),
                  Icon(Icons.analytics_outlined),
                  Icon(Icons.person_outline_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
