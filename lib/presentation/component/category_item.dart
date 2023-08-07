import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String value;
  final bool isSelected;
  final Function(String) onClick;

  const CategoryItem({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        color: isSelected
            ? Colors.redAccent
            : const Color(0xffffcbcb),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          onTap: () { onClick(value); },
          splashColor: isSelected
            ? const Color(0xffffcbcb)
            : Colors.redAccent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                value,
                style: TextStyle(
                    color: isSelected
                        ? const Color(0xffffcbcb)
                        : Colors.redAccent
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
