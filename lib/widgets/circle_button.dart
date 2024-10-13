import 'package:flutter/material.dart';

// Tombol bulat kecil untuk Line-Up
class CircleButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CircleButton({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.black54,
          ),
          iconSize: 20, // Ukuran ikon lebih kecil
          padding: EdgeInsets.all(12), // Menambahkan padding agar tombolnya bulat
        ),
      ),
    );
  }
}
