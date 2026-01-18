import 'package:flutter/material.dart';
import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;

  const HarfDropdownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;

  @override
  Widget build(BuildContext context) {
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
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
      ),
    );
  }
}
