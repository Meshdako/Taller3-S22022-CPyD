import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/constant.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';
import '../widget/aboutpokemon_widget.dart';
import '../widget/basestats_widget.dart';

class PokemonScreen extends StatefulWidget {
  final PokemonDetailModel pokemon;
  const PokemonScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

_getTranslate(String? type) {
    if (type == "normal") {
      return "Normal";
    } else if (type == "fire") {
      return "Fuego";
    } else if (type == "water") {
      return "Agua";
    } else if (type == "electric") {
      return "Eléctrico";
    } else if (type == "grass") {
      return "Planta";
    } else if (type == "ice") {
      return "Hielo";
    } else if (type == "fighting") {
      return "Lucha";
    } else if (type == "poison") {
      return "Veneno";
    } else if (type == "ground") {
      return "Tierra";
    } else if (type == "flying") {
      return "Volador";
    } else if (type == "psychic") {
      return "Psíquico";
    } else if (type == "bug") {
      return "Bicho";
    } else if (type == "rock") {
      return "Roca";
    } else if (type == "ghost") {
      return "Fantasma";
    } else if (type == "dragon") {
      return "Dragón";
    } else if (type == "dark") {
      return "Siniestro";
    } else if (type == "steel") {
      return "Acero";
    } else if (type == "fairy") {
      return "Hada";
    } 
  }

class _PokemonScreenState extends State<PokemonScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  void init(TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void initState() {
    super.initState();
    init(this);
  }

  Image appLogo = const Image(
      image: ExactAssetImage("lib/assets/Icons/Pokeball.png"),
      height: 30,
      width: 30,
      alignment: FractionalOffset.center);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: appLogo,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 250,
                width: double.infinity,
                color: getBackGroundColor(widget.pokemon.types![0].type!.name!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#${widget.pokemon.id.toString()} - ${widget.pokemon.name!.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: widget.pokemon.types!
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                color: getBackGroundColor2(
                                  widget.pokemon.types![0].type!.name!,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(_getTranslate(e.type!.name!)),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color:
                      getBackGroundColor(widget.pokemon.types![0].type!.name!),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: TabBar(
                            labelPadding: const EdgeInsets.all(10),
                            indicatorColor: getBackGroundColor(
                                widget.pokemon.types![0].type!.name!),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            tabs: const [
                              Text('Datos'),
                              Text('Estadisticas'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                AboutPokemonWidget(pokemon: widget.pokemon),
                                BaseStatsWidget(pokemon: widget.pokemon),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.width * 0.25,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(widget
                  .pokemon.sprites!.other!.officialArtwork!.frontDefault!),
            ),
          )
        ],
      ),
    );
  }
}
