import 'package:get/state_manager.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Models/turkey_diesel.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Services/list_diesel.dart';

class NutritionistController extends GetxController {
  // ignore: deprecated_member_use
  var dieselPriceList = <ResultClass>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNutritionist();
    super.onInit();
  }

  void fetchNutritionist() async {
    try {
      isLoading(true);
      var dieselPrice = await DieselService().getDieselPrice();
      dieselPriceList.value = dieselPrice;
    } finally {
      isLoading(false);
    }
  }
}
