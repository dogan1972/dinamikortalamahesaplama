import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(ortalama: 4.856, dersSayisi: 5),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Text("liste buraya gelecek"),
            ),
          ),
        ],
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildKrediler(),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.transparent,
                ),
                onPressed: null,
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 30,
                  color: Sabitler.anaRenk,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.withValues(
          alpha: 25,
          red: 25,
          green: 25,
          blue: 25,
        ),
      ),
    );
  }

  Container _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withValues(
          alpha: 50,
          red: 50,
          blue: 50,
          green: 50,
        ),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenHarfDegeri,
        underline: Container(),
        items: DataHelper.tumderslerinHarfleri(),
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
          });
        },
      ),
    );
  }

  Container _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withValues(
          alpha: 50,
          red: 50,
          blue: 50,
          green: 50,
        ),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenKrediDegeri,
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
          });
        },
      ),
    );
  }
}
