import 'package:admin_startupfunding/startup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeScreenController extends GetxController {
  final selectedPage = 0.obs;
  final isLoading = false.obs;
  List<StartupModel> newStartups = <StartupModel>[].obs;
  List<StartupModel> approvedStartups = <StartupModel>[].obs;

  final AutoScrollController scrollController = new AutoScrollController();
  List<StartupModel> foundNewStartups = <StartupModel>[].obs;
  List<StartupModel> foundApprovedStartups = <StartupModel>[].obs;

  void changePage(int pageNum) {
    selectedPage.value = pageNum;
  }

  void removeStartupFromNew(String uid) {
    newStartups.removeWhere((element) => element.uid == uid);
  }

  void addStartupToApprove(String uid) {
    int index = newStartups.indexWhere((element) => element.uid == uid);
    StartupModel newApprovedStartup = newStartups[index];
    approvedStartups.add(newApprovedStartup);

    approvedStartups.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
  }

  void fetchStartups() async {
    isLoading.toggle();

    await FirebaseFirestore.instance
        .collection("Startups")
        .where("isVerified", isEqualTo: false)
        .where("isRejected", isEqualTo: false)
        .where("isFieldAnswered", isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .get()
        .then((val) {
      if (val.docs.isNotEmpty) {
        val.docs.forEach((element) {
          newStartups.add(StartupModel.fromJson(element.data()));
        });
      }
    });

    await FirebaseFirestore.instance
        .collection("Startups")
        .where("isVerified", isEqualTo: true)
        .orderBy("createdAt", descending: true)
        .get()
        .then((val) {
      if (val.docs.isNotEmpty) {
        val.docs.forEach((element) {
          approvedStartups.add(StartupModel.fromJson(element.data()));
        });
      }
    });
    print(newStartups);
    print(approvedStartups);

    foundNewStartups = newStartups;
    foundApprovedStartups = approvedStartups;
    isLoading.toggle();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchStartups();
    super.onInit();
  }
}
