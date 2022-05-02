import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/screens/categories_screen.dart';
import 'package:navigation/screens/favorite_screen.dart';
import 'package:navigation/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favMeals;
  const TabScreen({Key? key, required this.favMeals}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [];
  int _selectedPageIndex = 0;

  @override
  initState() {
    _pages = [
      const CategoriesScreen(),
      FavoriteScreen(favMeals: widget.favMeals)
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          // bottom: const TabBar(tabs: <Widget>[
          //   Tab(
          //     icon: Icon(Icons.category),
          //     text: 'Category',
          //   ),
          //   Tab(
          //     icon: Icon(Icons.star),
          //     text: 'Favorite',
          //   )
          // ]),
        ),
        drawer: const MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amberAccent,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.category),
                  label: 'Category'),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.star),
                  label: 'Favorite')
            ]),
        body: _pages[_selectedPageIndex]
        // body: TabBarView(
        //     children: <Widget>[CategoriesScreen(), FavoriteScreen()]),
        );
  }
}
