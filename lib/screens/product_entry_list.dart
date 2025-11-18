import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:soccerhaus_mobile/models/product_entry.dart';
import 'package:soccerhaus_mobile/widgets/left_drawer.dart';
import 'package:soccerhaus_mobile/widgets/product_entry_card.dart';
import 'package:soccerhaus_mobile/screens/product_detail.dart';

const Color brandBlue = Color(0xFF3F5A83);

class ProductEntryListPage extends StatefulWidget {
  final bool onlyMyProducts;

  const ProductEntryListPage({
    super.key,
    this.onlyMyProducts = false,
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    const baseUrl = 'http://localhost:8000';

    final String url = widget.onlyMyProducts
        ? '$baseUrl/json/?filter=my'
        : '$baseUrl/json/';

    final response = await request.get(url);

    List<ProductEntry> products = [];
    for (var d in response) {
      if (d != null) {
        products.add(ProductEntry.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.onlyMyProducts ? 'My Products' : 'All Products',
        ),
        centerTitle: true,
        backgroundColor: brandBlue,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<ProductEntry>>(
        future: fetchProducts(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return Center(
              child: Text(
                widget.onlyMyProducts
                    ? "You don't have any products yet."
                    : "No products available.",
                style: const TextStyle(fontSize: 16),
              ),
            );
          }
          final products = data.reversed.toList();

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
