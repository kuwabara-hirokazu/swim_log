import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swim_log/data/log_data.dart';
import 'package:swim_log/ui/log_register_view_model.dart';
import 'package:swim_log/util/DateTimeExt.dart';

class LogRegister extends StatefulWidget {
  const LogRegister({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LogDetail();
}

class _LogDetail extends State<LogRegister> {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(color: Color(0xFFd3d3d3)),
  );

  final LogRegisterViewModel viewModel = LogRegisterViewModel();

  DateTime _date = DateTime.now();
  String distance = '';

  Future _pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime.now(),
        helpText: '日付選択');

    if (newDate != null) {
      setState(() => _date = newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('記録登録'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  LogData log = LogData(totalDistance: int.parse(distance), createDate: _date);
                  viewModel.registerLog(log);
                  // try {
                  //   registerLog(int.parse(distance), _date);
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(const SnackBar(content: Text('保存しました')));
                  //   Navigator.pop(context);
                  // } catch (e) {
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(const SnackBar(content: Text('保存に失敗しました')));
                  // }
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 4),
                    child: Text("距離",
                        style: TextStyle(
                          color: Color(0xFF758492),
                        )),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      onChanged: (text) {
                        distance = text;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFf0f8ff),
                          focusedBorder: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          hintText: '0',
                          suffixText: 'm'),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 4),
                    child: Text("日付",
                        style: TextStyle(
                          color: Color(0xFF758492),
                        )),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextFormField(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        controller: TextEditingController(text: _date.toFormatString()),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFf0f8ff),
                            focusedBorder: outlineInputBorder,
                            enabledBorder: outlineInputBorder,
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                  _pickDate(context);
                                }))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
