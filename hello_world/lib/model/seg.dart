class SegmentedButtonModel {
  final List<String> optionList;
  final int selectedId;
  final void Function(int) action;

  const SegmentedButtonModel({
    required this.optionList,
    required this.selectedId,
    required this.action,
  });
}
