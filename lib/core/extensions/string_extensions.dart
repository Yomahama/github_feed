extension StringExtension on String {
  String get snakeToTitleCase => split('_').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
}
