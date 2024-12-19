String toCamelCase(String input) {
  if (input.isEmpty) return input;

  List<String> words = input
      .split(RegExp(r'[^a-zA-Z0-9]')) 
      .where((word) => word.isNotEmpty) 
      .toList();

  if (words.isEmpty) return '';

  return words[0].toLowerCase() +
      words
          .skip(1) 
          .map((word) =>
              word[0].toUpperCase() + word.substring(1).toLowerCase()) 
          .join();
}
