// ignore_for_file: constant_identifier_names

final class RouterPath {
  // аутентентификация
  static const String NOTLOGIN = '/auth';

  // пункты домашнего навигационного бара
  static const String HOME = '/home';
  static const String PROGRESSHOME = '/progresshome';
  static const String SEARCHHOME = '/searchhome';
  static const String PROFILEHOME = '/profilehome';
  // пункты домашнего навигационного бара

  // сплэш для загрузок
  static const String LOADING = '/loading';
  // сплэш для загрузок

  // этапы регистрации
  static const String SIGNIN = 'signin';
  static const String SIGNUP = 'signup';
  static const String GENDER = 'gender';
  static const String HEIGHT = 'height';
  static const String WEIGHT = 'weight';
  static const String AGE = 'age';
  static const String GOAL = 'goal';
  static const String LEVEL = 'level';
  // этапы регистрации

  // этапы восстановления пароля
  static const String RESETPASSWORD = 'resetpass';
  static const String ENTERRECOVERYCODETOUPDATEPASS = 'enterrecoverycode';
  static const String UPDATEPASS = 'updatepass';
  // этапы восстановления пароля

  // обновление ПД
  static const String UPDATEAGE = 'updateage';
  static const String UPDATEHEIGHT = 'updateheight';
  static const String UPDATEWEIGHT = 'updateweight';
  // обновление ПД

  // создание тренировочного плана
  static const String SELECTTRAININGPLAN = 'newtrainplan';
  static const String SELECTREADYTRAININGPLAN = 'readytrainplan';
  static const String VIEWSELECTEDPLAN = 'viewselectedplan';
  static const String EDITDAYINPLAN = 'editdayinplan';
  static const String SELECTCUSTOMTRAININGPLAN = 'customtrainplan';
  static const String VIEWCUSTOMPLAN = 'viewcustomplan';
  static const String EDITDAYINCUSTOMPLAN = 'editdayincustomplan';
  // создание тренировочного плана

  // поиск любого упражнения
  static const String FINDNEWEXERCISEWHENEDITPLAN =
      'findnewexercisewheneditplan';
  static const String FINDNEWEXERCISEINCUSTOMPLAN =
      'findnewexercisewheneditcustomplan';
  // поиск любого упражнения
}
