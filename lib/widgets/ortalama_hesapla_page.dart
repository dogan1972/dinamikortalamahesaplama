import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(Sabitler.appTitle, style: Sabitler.baslikTextStyle),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Text("Form"),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text("liste"),
            ),
          ),
        ],
      ),
    );
  }
}
