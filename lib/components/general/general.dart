import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'initiated':
      return Color(0xFFE3B644);
    case 'completed':
      return Color(0xFF1C811E);
    case 'requested':
      return Color(0xFFE3B644);
    case 'pending':
      return Color(0xFFE3B644);
    case 'failed':
      return Color(0xFFFF7072);
    default:
      return Color(0xFF9A9A9A);
  }
}
