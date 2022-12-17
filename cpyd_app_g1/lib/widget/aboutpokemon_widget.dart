import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';

class AboutPokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const AboutPokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  _getHabilidad() {
    String? habilidad;
    for (var i = 0; i < pokemon.abilities!.length; i++) {
      if (pokemon.abilities![i].isHidden == false) {
        habilidad = pokemon.abilities![i].ability?.name;
        return habilidad;
      }
    }
  }

  _getString() {
    String? oculta;
    for (var i = 0; i < pokemon.abilities!.length; i++) {
      if (pokemon.abilities![i].isHidden == true) {
        oculta = pokemon.abilities![i].ability?.name;
        return oculta;
      }
    }
    return "No posee";
  }

  _getLocation() {
    String location = "";

    if (pokemon.id! >= 1 && pokemon.id! <= 151) {
      location = "Kanto";
    } else if (pokemon.id! >= 152 && pokemon.id! <= 251) {
      location = "Johto";
    } else if (pokemon.id! >= 252 && pokemon.id! <= 386) {
      location = "Hoenn";
    } else if (pokemon.id! >= 387 && pokemon.id! <= 493) {
      location = "Sinnoh";
    } else if (pokemon.id! >= 494 && pokemon.id! <= 649) {
      location = "Unova";
    } else if (pokemon.id! >= 650 && pokemon.id! <= 721) {
      location = "Kalos";
    } else if (pokemon.id! >= 722 && pokemon.id! <= 809) {
      location = "Alola";
    } else if (pokemon.id! >= 810 && pokemon.id! <= 905) {
      location = "Galar";
    }
    return location;
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
          height: 40,
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
            height: 120,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Forma: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Helvetica Neue",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Original",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Helvetica Neue",
                        ),
                      )
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Habilidad: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Helvetica Neue",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _getHabilidad(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Helvetica Neue",
                    ),
                  )
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Habilidad Oculta: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Helvetica Neue",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _getString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Helvetica Neue",
                      ),
                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Ubicación: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Helvetica Neue",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _getLocation(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Helvetica Neue",
                    ),
                  )
                ]),
              ],
            ))
      ],
    );
  }
}
