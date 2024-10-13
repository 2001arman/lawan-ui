import 'package:flutter/material.dart';

// Tombol kustom besar dan panjang
class CustomButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isSmall;

  const CustomButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7), 
      padding: EdgeInsets.symmetric(horizontal: 21), // Padding horizontal untuk ruang
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8), // Ukuran lebih kecil
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.black54,
            fontSize: 15.7, // Ukuran font lebih kecil
          ),
        ),
      ),
    );
  }
}