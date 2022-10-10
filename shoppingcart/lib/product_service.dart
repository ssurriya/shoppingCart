class ProductService {
  static ProductService? instance;
  ProductService._();
  static ProductService getInstance() {
    instance = instance ?? ProductService._();
    return instance!;
  }

  // For Mobile Phones
  List _mobilePhones = [];
  List get getMobilePhones => _mobilePhones;
  setMobilePhones(mobilePhone) => _mobilePhones.add(mobilePhone);
  deleteMobilePhone(String uuid) =>
      _mobilePhones.removeWhere((element) => element["uuid"] == uuid);

  // For Ac Details
  List _acList = [];
  List get getAcList => _acList;
  setAcList(acDetail) => _acList.add(acDetail);
  deleteAcDetail(String uuid) =>
      _acList.removeWhere((element) => element["uuid"] == uuid);

  // For Laptop
  List _laptops = [];
  List get getLaptop => _laptops;
  setLaptop(laptop) => _laptops.add(laptop);
  deleteLaptop(String uuid) =>
      _laptops.removeWhere((element) => element["uuid"] == uuid);

  // For Headphones
  List _headphones = [];
  List get getHeadphones => _headphones;
  setHeadphone(headphone) => _headphones.add(headphone);
  deleteHeadphones(String uuid) =>
      _headphones.removeWhere((element) => element["uuid"] == uuid);

  // For TV
  List _tvList = [];
  List get getTvList => _tvList;
  setTvDetail(tv) => _tvList.add(tv);
  deleteTvDetail(String uuid) =>
      _tvList.removeWhere((element) => element["uuid"] == uuid);
}
