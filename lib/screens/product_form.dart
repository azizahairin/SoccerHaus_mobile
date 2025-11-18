import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:soccerhaus_mobile/widgets/left_drawer.dart';
import 'package:soccerhaus_mobile/screens/menu.dart';

const Color brandBlue = Color(0xFF3F5A83);
const Color brandPink = Color(0xFFE2A7B6);
const Color successGreen = Color(0xFF16A34A);

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "jersey";
  bool _isFeatured = false;

  final List<String> _categories = [
    'jersey',
    'shoes',
    'ball',
    'accessories',
    'equipment',
  ];

  bool _isValidURL(String url) {
    final urlPattern = r'^(http|https):\/\/[^\s$.?#].[^\s]*$';
    return RegExp(urlPattern, caseSensitive: false).hasMatch(url);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Product',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: brandBlue,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      // Card
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add New Product',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Fill in the details below to add a product to SoccerHaus.',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      // === Name ===
                      const Text(
                        "Nama Produk",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nama Produk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _name = value ?? "";
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Nama produk tidak boleh kosong!";
                          }
                          if (value.length < 3) {
                            return "Nama produk minimal 3 karakter!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // === Price ===
                      const Text(
                        "Harga Produk",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Harga Produk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _price = int.tryParse(value ?? "") ?? 0;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Harga tidak boleh kosong!";
                          }
                          final parsed = int.tryParse(value);
                          if (parsed == null) {
                            return "Harga harus berupa angka!";
                          }
                          if (parsed <= 0) {
                            return "Harga harus lebih dari 0!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // === Description ===
                      const Text(
                        "Deskripsi Produk",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Deskripsi Produk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value ?? "";
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // === Thumbnail (URL) ===
                      const Text(
                        "URL Thumbnail (opsional)",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "https://contoh-gambar.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _thumbnail = value ?? "";
                          });
                        },
                        validator: (String? value) {
                          if (value != null && value.isNotEmpty) {
                            if (!_isValidURL(value)) {
                              return "URL tidak valid! Harus dimulai dengan http/https.";
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // === Category ===
                      const Text(
                        "Kategori Produk",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        value: _category,
                        items: _categories
                            .map(
                              (cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(
                                  cat[0].toUpperCase() + cat.substring(1),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _category = newValue ?? "jersey";
                          });
                        },
                      ),
                      const SizedBox(height: 12.0),

                      // === Is Featured ===
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Tandai sebagai Produk Unggulan"),
                        activeColor: successGreen,
                        value: _isFeatured,
                        onChanged: (bool value) {
                          setState(() {
                            _isFeatured = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20.0),

                      // === Tombol Save ===
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: brandBlue,
                            foregroundColor: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(vertical: 14.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await request.postJson(
                                "http://localhost:8000/create-flutter/",
                                jsonEncode({
                                  "title": _name,
                                  "content": _description,
                                  "category": _category,
                                  "thumbnail": _thumbnail,
                                  "price": _price,
                                  "is_featured": _isFeatured,
                                }),
                              );

                              if (!context.mounted) return;

                              if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Product successfully saved!"),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Something went wrong, please try again.",
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
