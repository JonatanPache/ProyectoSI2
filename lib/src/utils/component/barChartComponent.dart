import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/utils/style/colors.dart';

class BarChartComponent extends StatelessWidget {
  const BarChartComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
        swapAnimationCurve:Curves.slowMiddle,
      swapAnimationDuration: const Duration(milliseconds: 200),
      BarChartData(
          borderData: FlBorderData(show: false) ,
          alignment: BarChartAlignment.spaceBetween,
          //axisTitleData: FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 20)),
          gridData: FlGridData(drawHorizontalLine: true, horizontalInterval: 30),
          barGroups: [
            BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                      toY: 10,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg
                      )
                  ),
                ]
            ),
            BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                      toY: 50,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg
                      )
                  )
                ]
            ),
            BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                      toY: 30,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg
                      )
                  )
                ]
            ),
            BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                      toY: 80,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg
                      )
                  )
                ]
            ),
            BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                      toY: 70,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg
                      )
                  )
                ]
            ),
            BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                      toY: 20,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg))
                ]
            ),
            BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                      toY: 90,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg))
                ]
            ),
            BarChartGroupData(
                x: 7,
                barRods: [
                  BarChartRodData(
                      toY: 60,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg))
                ]
            ),
            BarChartGroupData(
                x: 8,
                barRods: [
                  BarChartRodData(
                      toY: 90,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg))
                ]
            ),
            BarChartGroupData(
                x: 9,
                barRods: [
                  BarChartRodData(
                      toY: 10,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90, show: true,
                          color: AppColors.barBg))
                ]
            ),
            BarChartGroupData(
                x: 10,
                barRods: [
                  BarChartRodData(
                      toY: 40,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg))
                ]
            ),
            BarChartGroupData(
                x: 11,
                barRods: [
                  BarChartRodData(
                      toY: 80,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0),
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 90,
                          show: true,
                          color: AppColors.barBg))
                ]
            ),
          ],
          titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 30,
                  showTitles: true,
                  getTitlesWidget: (value,title) {
                    if (value == 0) {
                      return Text(
                      '20k',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12
                        ),
                      );
                    } else if (value == 30) {
                      return Text(
                      '30k',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                      ),
                    );
                    } else if (value == 60) {
                      return Text(
                      '60k',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                      ),
                    );
                    } else if (value == 90) {
                      return Text(
                      '90k',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                      ),
                    );
                    } else { return Text('');}
                  },
                )
              ),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value,titleMeta) {
                      if (value == 0) {return Text('JAN',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 1) {return Text('FEB',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 2) {return Text('MAR',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 3) {return Text('APR',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 4) {return Text('MAY',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 5) {return Text('JUN',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 6) {return Text('JUL',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 7) {return Text('AUG',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 8) {return Text('SEP',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 9) {return Text('OCT',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 10) {return Text('NOV',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else if (value == 11) {return Text('DEC',style: const TextStyle(color: Colors.black, fontSize: 10));
                      } else {return Text('');}
          }, )),
          ),
      )
    );
  }
}
