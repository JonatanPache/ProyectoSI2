import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/utils/config/size_config.dart';
import 'package:seguro_motors_final/src/utils/style/colors.dart';
import '../data.dart';
import 'package:seguro_motors_final/src/utils/component/historyTable_controller.dart';

class HistoryTable extends StatefulWidget {
  const HistoryTable({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryTable> createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  HistoryTableController _control=new HistoryTableController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _control.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.black38),
            //top: BorderSide(color: Colors.black87),
            //bottom: BorderSide(color: Colors.black87),
            //left: BorderSide(color: Colors.black87),
            //right: BorderSide(color: Colors.black87)
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
            _control!.list!.length,
                (index) => TableRow(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  children: <Widget>[
                    // icon
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage: NetworkImage("https://www.freeiconspng.com/uploads/taskmanager-icon-22.png"),
                        ),
                      ),
                    ),
                    // nombre de la transaccion
                    Text(
                        'SOL-00'+_control.list[index].solicitudSiniestroId??"",
                        style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          color: AppColors.secondary
                        )
                    ),
                    Text(
                        _control.list[index].status??"",
                        style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary
                        )
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void refresh(){
    setState(() {

    });
  }
}