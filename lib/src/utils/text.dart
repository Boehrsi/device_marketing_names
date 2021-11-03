extension Format on String {
  String sentenceCase() {
    if (isEmpty) {
      return this;
    } else if (length == 1) {
      return _upperCaseFirstLetter();
    } else {
      return "${_upperCaseFirstLetter()}${substring(1)}";
    }
  }

  String _upperCaseFirstLetter() => this[0].toUpperCase();
}
