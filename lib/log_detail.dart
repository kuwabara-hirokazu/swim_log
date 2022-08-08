import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          child: Column(
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
        ),
      ),
    );
  }
}
