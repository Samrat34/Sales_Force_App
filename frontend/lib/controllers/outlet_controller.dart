// controllers/outlet_controller.dart
import 'package:get/get.dart';
import 'package:sales_force_app/models/outlet_model.dart';

class OutletController extends GetxController {
  var outlets = <Outlet>[].obs;
  var filteredOutlets = <Outlet>[].obs;
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadOutlets();
  }

  void loadOutlets() {
    isLoading.value = true;

    // Mock data with new fields
    final mockOutlets = [
      Outlet(
        id: '1',
        name: 'Super Mart Express',
        location: 'Connaught Place, Delhi',
        category: 'A',
        sales: 45,
        credit: 25,
        distance: 2.3,
        nextVisit: 'Today',
        progress: 92,
        status: 'active',
        rating: 4.5,
        isOpen: true,
      ),
      Outlet(
        id: '2',
        name: 'City General Store',
        location: 'Khan Market, Delhi',
        category: 'B',
        sales: 32,
        credit: 18,
        distance: 1.8,
        nextVisit: 'Tomorrow',
        progress: 88,
        status: 'active',
        rating: 4.2,
        isOpen: true,
      ),
      Outlet(
        id: '3',
        name: 'Metro Pharmacy',
        location: 'Lajpat Nagar, Delhi',
        category: 'A',
        sales: 28,
        credit: 12,
        distance: 3.1,
        nextVisit: 'Today',
        progress: 95,
        status: 'active',
        rating: 4.7,
        isOpen: true,
      ),
      Outlet(
        id: '4',
        name: 'Corner Shop',
        location: 'Karol Bagh, Delhi',
        category: 'C',
        sales: 15,
        credit: 8,
        distance: 4.2,
        nextVisit: 'Overdue',
        progress: 76,
        status: 'inactive',
        rating: 3.8,
        isOpen: false,
      ),
    ];

    outlets.assignAll(mockOutlets);
    filteredOutlets.assignAll(mockOutlets);
    isLoading.value = false;
  }

  void searchOutlets(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    applyFilters();
  }

  void applyFilters() {
    var results = outlets;

    // Apply category filter
    if (selectedCategory.value != 'All') {
      results = results
          .where((outlet) => outlet.category == selectedCategory.value)
          .toList()
          .obs;
    }

    // Apply search filter
    if (searchQuery.value.isNotEmpty) {
      results = results
          .where((outlet) =>
              outlet.name
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              outlet.location
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList()
          .obs;
    }

    filteredOutlets.assignAll(results);
  }
}
