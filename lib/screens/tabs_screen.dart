import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';


// this is the default screen
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
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
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _selectPage,
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   unselectedItemColor: Colors.white,
      //   selectedItemColor: Theme.of(context).colorScheme.secondary,
      //   currentIndex: _selectedPageIndex,
      //   // type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //         backgroundColor: Theme.of(context).colorScheme.primary,
      //         icon: const Icon(Icons.category),
      //         label: 'Categories'),
      //     BottomNavigationBarItem(
      //         backgroundColor: Theme.of(context).colorScheme.primary,
      //         icon: const Icon(Icons.star),
      //         label: 'Favorites'),
      //   ],
      // ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
        return _buildOriginDesign();
  }

  Widget _buildBorderRadiusDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(20.0),
      items: [
        CustomNavigationBarItem(
          icon: Icon(                     
            AntDesign.home
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.shoppingcart
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.cloudo
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.search1
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.user
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }  

Widget _buildBlurEffect() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.black,
      borderRadius: Radius.circular(20.0),
      blurEffect: true,
      opacity: 0.8,
      items: [
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.home,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.shoppingcart,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.cloudo,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.search1,
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            AntDesign.user
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: true,
    );
  }  
  
  Widget _buildOriginDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Color(0xff040307),
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.search),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.account_circle),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }  
}
