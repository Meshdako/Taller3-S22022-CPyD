import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';
import '../constant.dart';

class AboutPokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const AboutPokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 100,
            width: 400,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.monitor_weight,
                              color: Colors.grey,
                              size: 50,
                            ),
                            Text('${(pokemon.weight! / 10).toString()} Kg',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black87))
                          ],
                        ))),
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Row(children: [
                          const Icon(
                            Icons.height,
                            color: Colors.grey,
                            size: 50,
                          ),
                          Text("${(pokemon.height! / 10).toString()} m",
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.black87)),
                        ]))),
              ],
            )));
  }
}
