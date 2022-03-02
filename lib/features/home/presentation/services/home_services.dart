import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/core/networks/api_request.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/locator.dart';
import 'package:observable_ish/observable_ish.dart';

abstract class HomeService with ReactiveServiceMixin {
  HomeService() {
    listenToReactiveValues([_stocks]);
  }

  final RxValue<List<Stocks>>? _stocks = RxValue([]);
  List<Stocks>? get stocks => _stocks!.value;

  Future<void> getStock();
}

class HomeServiceImpl extends HomeService {
  final ApiServiceRequester _apiServiceRequester = sl<ApiServiceRequester>();

  @override
  Future<void> getStock() async {
    try {
      final res = await _apiServiceRequester.getRequest(
          url:
              'api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
      var stockData = <Stocks>[];
      for (var item in res.data) {
        stockData.add(Stocks.fromJson(item));
      }
      _stocks!.value = stockData;
      notifyListeners();
    } catch (e) {
      Logger().d('$e');
    }
  }
}
