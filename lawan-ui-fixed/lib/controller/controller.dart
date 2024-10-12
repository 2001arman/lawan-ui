import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs; // Menyimpan indeks halaman yang dipilih

  // Fungsi untuk mengubah halaman berdasarkan indeks
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
