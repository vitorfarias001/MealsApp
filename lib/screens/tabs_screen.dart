import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';

/// Widget principal da home, que possui o gerenciamento das abas
class TabsScreen extends StatefulWidget {
  /// Lista de receitas favoritas recebidas da main
  final List<Meal> favoriteMeals;

  /// Construtor
  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  /// Índice de inicialização das tabs
  int _selectedScreenIndex = 0;

  /// Inicializa as telas utilizadas como tabs, o conteúdo é preenchido no iniState
  /// pois neste ponto não é possível obter o parâmetro widget.favoriteMeals (lista de favoritos)
  List<Map<String, Object>> _screens = [];

  /// Inicializa o estado do widget
  @override
  void initState() {
    super.initState();
    setState(() {
      _screens = [
        {
          'title': 'Categorias',
          'screen': CategoriesScreen(),
        },
        {
          'title': 'Meus favoritos',
          'screen': FavoriteScreen(widget.favoriteMeals),
        },
      ];
    });
  }

  /// Método utilizado para alterar a tab selecionada
  void _selectTab(int tabIndex) {
    setState(() {
      _selectedScreenIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex]['screen'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
