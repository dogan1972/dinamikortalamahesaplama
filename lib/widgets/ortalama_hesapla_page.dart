import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/models/ders.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
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
  String girilenDersAdi = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: OrtalamaGoster(
                  ortalama: DataHelper.ortalamaHesapla(),
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Sabitler.anaRenk.shade100.withValues(
                alpha: 5,
                red: 5,
                blue: 5,
                green: 5,
              ),
              child: Derslistesi(
                onElemanCikarildi: (index) {
                  setState(() {
                    DataHelper.tumEklenenDersler.removeAt(index);
                  });
                },
              ),
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
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDegeri = kredi;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.transparent,
                ),
                onPressed: _dersEkleveOrtalamaHesapla,
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
      validator: (s) {
        if (s!.isEmpty) {
          return "Ders adını giriniz.";
        }
        return null;
      },
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
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

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDegeri,
        krediDegeri: secilenKrediDegeri,
      );
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
