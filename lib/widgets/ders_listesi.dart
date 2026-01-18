import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/models/ders.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Derslistesi extends StatelessWidget {
  final Function onElemanCikarildi;

  const Derslistesi({required this.onElemanCikarildi, super.key});
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk.shade100,
                        child: Text(
                          (tumDersler[index].krediDegeri *
                                  tumDersler[index].harfDegeri)
                              .toString(),
                        ),
                      ),
                      subtitle: Text(
                        "${tumDersler[index].harfDegeri.toString()} Kredi, Not Değeri ${tumDersler[index].krediDegeri}",
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            alignment: Alignment.center,
            color: Sabitler.anaRenk.shade100.withValues(
              alpha: 5,
              red: 5,
              blue: 5,
              green: 5,
            ),
            child: Text(
              "Lütfen Ders Ekleyiniz.",
              style: Sabitler.baslikTextStyle,
            ),
          );
  }
}
