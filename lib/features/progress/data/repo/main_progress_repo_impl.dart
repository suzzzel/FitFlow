abstract class MainProgressRepoImpl {
  Future<void> getMainProgressAboutUser({required String idUser});

  Future<void> getProgressByDay({required String idUser, required String date});
}
