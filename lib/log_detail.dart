import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class LogDetail extends StatefulWidget {
  const LogDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LogDetail();
}

class _LogDetail extends State<LogDetail> {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(color: Color(0xFFd3d3d3)),
  );

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
          title: const Text('記録詳細'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
              const SizedBox(width: 16),
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
                        controller:
                            TextEditingController(text: DateFormat('yyyy/MM/dd').format(_date)),
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
