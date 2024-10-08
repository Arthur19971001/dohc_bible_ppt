class OptionFilter {
  final SelectBibleVersion selectBibleVersion;
  final bool hasVerseName;

  OptionFilter({required this.selectBibleVersion, required this.hasVerseName});

  factory OptionFilter.initial() {
    return OptionFilter(
      selectBibleVersion: SelectBibleVersion.both,
      hasVerseName: true,
    );
  }

  OptionFilter copyWith({
    SelectBibleVersion? selectBibleVersion,
    bool? hasVerseName,
  }) {
    return OptionFilter(
      selectBibleVersion: selectBibleVersion ?? this.selectBibleVersion,
      hasVerseName: hasVerseName ?? this.hasVerseName,
    );
  }
}

enum SelectBibleVersion {
  both(0),
  gae(1),
  niv(2),
  ;

  final int value;
  const SelectBibleVersion(this.value);

  String get label {
    switch (this) {
      case SelectBibleVersion.gae:
        return '개역개정';
      case SelectBibleVersion.niv:
        return 'NIV';
      case SelectBibleVersion.both:
        return '둘다';
    }
  }
}
