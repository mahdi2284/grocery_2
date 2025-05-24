import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery/api/api_services.dart';
import 'package:grocery/models/category_model.dart';
import 'package:grocery/pages/categories/category_item_card_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<String> gridColors = [
    '#53b175',
    '#f8a4c',
    '#f7a593',
    '#d3b0e0',
    '#b7dff5',
    '#836af6',
    '#d73b77',
    '#d73b77',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            const Center(
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: _categoriesList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getStaggeredGrid(List<CategoryModel> data) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 1.0,
      children: data.asMap().entries.map<Widget>((e) {
        int index = e.key;
        CategoryModel categoeyItem = e.value;
        return GestureDetector(
          onTap: () => {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: CategoryItemCardWidget(
              item: categoeyItem,
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _categoriesList() {
    return FutureBuilder<List<CategoryModel>?>(
      future: ApiServices.getCategories(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryModel>?> model) {
            if (model.hasData) {
              return getStaggeredGrid(model.data!);
            }
            return const Center(child: CircularProgressIndicator());
          },
    );
  }
}
