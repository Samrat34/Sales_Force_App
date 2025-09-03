import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search outlets...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey[100]!, Colors.grey[200]!],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: IconButton(
                  icon: const Icon(Icons.filter_list,
                      size: 20, color: Colors.grey),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: IconButton(
                  icon: const Icon(Icons.location_pin,
                      size: 20, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('Route Planning', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '12.4 km optimized',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF059669)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
