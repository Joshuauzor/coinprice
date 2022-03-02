import 'package:stacked/stacked.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/features/home/presentation/services/home_services.dart';
import 'package:todo/locator.dart';

class HomeViewModel extends ReactiveViewModel {
  final HomeService _homeService = sl<HomeService>();

  List<Stocks>? get stocks => _homeService.stocks;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_homeService];
}
