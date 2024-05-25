typedef PaginatorLoad<T> = Future<PaginatorLoadResult<T>> Function(int);

class PaginatorLoadResult<T> {
  final List<T> data;
  late int currentPage;
  late int totalPages = 1;

  PaginatorLoadResult({
    required this.data,
    required this.currentPage,
    required this.totalPages,
  });
}

class Paginator<T> {
  final _data = <T>[];
  late int _currentPage;
  late int _totalPages = 1;
  bool _isLoadingInProgress = false;
  final PaginatorLoad<T> load;

  List<T> get data => _data;

  Paginator(this.load);

  Future<void> resetList() async {
    _currentPage = 0;
    _totalPages = 1;
    _data.clear();
    await loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPages) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final result = await load(nextPage);

      _data.addAll(result.data);
      _currentPage = result.currentPage;
      _totalPages = result.totalPages;
      _isLoadingInProgress = false;
    } catch (_) {
      _isLoadingInProgress = false;
    }
  }
}
