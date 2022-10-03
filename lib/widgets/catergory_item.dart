import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({ Key? key ,required this.item}) : super(key: key);
    final String item;
  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
  }
}