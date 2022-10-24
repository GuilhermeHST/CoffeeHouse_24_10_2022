import 'package:flutter/material.dart';
import 'package:coffee_house/pages/destaques.dart';
import 'package:coffee_house/pages/grid_pacotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:coffee_house/data/shared_pref_helper.dart';
import 'package:coffee_house/domain/cafes.dart';
import 'package:coffee_house/pages/login_page.dart';
import 'package:coffee_house/pages/detalhes_sessao.dart';
import 'package:coffee_house/widget/card_cafe_recomendado.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List paginas = const [
    DestaquesPage(),
    GridPacotes(),
    GridPacotes(),
    GridPacotes(),
    GridPacotes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EFE9),
      appBar: AppBar(
        centerTitle: false,
        title: const Icon(Icons.local_cafe),
        backgroundColor: const Color(0xFF3E2723),
        actions: [
          IconButton(
              onPressed: (){
                SharedPrefHelper().logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return const LoginPage();
                      }
                  ),
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: paginas[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.brown,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Catálogo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Compras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Pagamentos',
          ),
        ],
      ),
    );
  }
}