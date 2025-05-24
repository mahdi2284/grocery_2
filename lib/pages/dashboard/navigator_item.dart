import 'package:flutter/widgets.dart';
import 'package:grocery/pages/categories/categories_page.dart';

class NavigatorItem {
  final String labal,iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.labal,this.iconPath,this.index,this.screen);
}

List<NavigatorItem> navigatorItem = [
  NavigatorItem('Shop','assets/icons/shop_icon.svg',0,SizedBox()),
  NavigatorItem('Categories','assets/icons/category_icon.svg',0,CategoriesPage()),
  NavigatorItem('Card','assets/icons/card_icon.svg',0,SizedBox()),
  NavigatorItem('Account','assets/icons/account_icon.svg',0,SizedBox()),
];