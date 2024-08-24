import 'package:flutter/material.dart';
import 'package:state_app/model/presentation/int_representation.dart';

class ValueDescription extends StatelessWidget {
  final String value;
  final String label;

  const ValueDescription({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          IntRepresentation.toReadableValue(value),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          IntRepresentation.toReadableValue(label),
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF757575),
          ),
        ),
      ],
    );
  }
}