import 'package:cloning_dribbble_designs/util/coffee_tile.dart';
import 'package:cloning_dribbble_designs/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List coffee
  final List coffeeType = [
    ['Cappucino', true],
    ['Iced', false],
    ['Coffee', false],
    ['Milk', false],
  ];

  final List listAllItens = [
    [
      //Cappucino
      [
        'lib/images/capuccino.jpg',
        'Milk n/ Milk',
        'R\$ 4,60',
      ],
      [
        'lib/images/capuccino.jpg',
        'Milk with Milk',
        'R\$ 4,90',
      ]
    ],
    [
      //Iced
      [
        'lib/images/iced.jpg',
        'Coffee Iced',
        'R\$ 6,60',
      ],
      [
        'lib/images/iced.jpg',
        'Coffee Iced n/Milk',
        'R\$ 6,40',
      ],
    ],
    [
      //Coffee
      [
        'lib/images/coffee-express.jpg',
        'Coffee Express',
        'R\$ 4,60',
      ],
      [
        'lib/images/coffee.jpg',
        'Coffee pure',
        'R\$ 4,20',
      ],
    ],
    [
      //Milk
      [
        'lib/images/milk.jpg',
        'Coffee Express',
        'R\$ 4,60',
      ],
    ]
  ];

  // ignore: prefer_typing_uninitialized_variables
  List indexViewItens = [];

  //user tapped type coffee
  void coffeeTypesSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
      indexViewItens = listAllItens[index];
    });
  }

  @override
  void initState() {
    super.initState();
    //Initi first list
    indexViewItens = listAllItens[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Encontre o melhor café aqui!",
              style: GoogleFonts.bebasNeue(
                fontSize: 36,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            // child: TextField(
            //   decoration: InputDecoration(
            //     prefixIcon: const Icon(Icons.search),
            //     hintText: 'Buscar café..',
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey.shade600),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey.shade600),
            //     ),
            //   ),
            // ),
          ),
          const SizedBox(height: 25),

          //Horizontal listview of coffee types
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypesSelected(index);
                  },
                );
              },
            ),
          ),

          //Horizontal listview of coffee tile

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: indexViewItens.length,
              itemBuilder: (BuildContext context, int index) {
                var indexViewItens2 = indexViewItens;
                return CoffeeTile(
                  coffeeImagePath: indexViewItens2[index][0].toString(),
                  coffeeName: indexViewItens2[index][1].toString(),
                  coffeePrice: indexViewItens2[index][2].toString(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
