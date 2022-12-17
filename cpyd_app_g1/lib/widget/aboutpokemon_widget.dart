import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';

class AboutPokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const AboutPokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  _getString() {
    String? oculta;
    if (pokemon.abilities!.length > 1) {
      oculta = pokemon.abilities![1].ability?.name! ?? "";
      return oculta;
    }
    else{
      oculta = "No tiene habilidad oculta";
      return oculta;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0,
                offset: Offset(5, 8),
              )
            ],
            color: Colors.white,
          ),
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
                            color: Colors.black87,
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
                          color: Colors.black87,
                          size: 50,
                        ),
                        Text("${(pokemon.height! / 10).toString()} m",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black87)),
                      ]))),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.red,
          child: Column(
            children: [
              Container(
                color: Colors.green,
                child: Row(children: const [
                  Text("Forma: Original"),
                ]),
              ),
              Row(children: [
                const Text("Habilidad: "),
                Text(pokemon.abilities![0].ability!.name!)
              ]),
              Row(
                children: [
                  const Text("Habilidad Oculta: "),
                  Text(_getString())
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
