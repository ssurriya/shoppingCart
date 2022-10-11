class ProductService {
  static ProductService? instance;
  ProductService._();
  static ProductService getInstance() {
    instance = instance ?? ProductService._();
    return instance!;
  }

  // Default Json For Mobile Phones
  String jsonForMobilePhones =
      '[{"uuid":"ce596f00-4912-11ed-8875-7348bc07b242","product_name":"POCO","model_number":"M2 PRO","price":"12000","manufacture_date":"2022-10-11 03:14:23.857379","manufacture_address":"Banglore. India."},{"uuid":"a54a6ab0-4912-11ed-8875-7348bc07b242","product_name":"Redmi","model_number":"5A","price":"6000","manufacture_date":"2022-10-11 03:13:14.971410","manufacture_address":"China"},{"uuid":"8c1133d0-4912-11ed-8875-7348bc07b242","product_name":"Apple","model_number":"M123YZ","price":"120000","manufacture_date":"2022-10-11 03:12:32.656045","manufacture_address":"Newyork, America"},{"uuid":"f329df40-4912-11ed-8875-7348bc07b242","product_name":"OnePlus","model_number":"Nord","price":"35000","manufacture_date":"2022-10-11 03:15:25.620393","manufacture_address":"JinJiang, China"}]';

  // Default Json For Ac Details
  String jsonForAcDetails =
      '[{"uuid":"170f8f70-4915-11ed-9a24-bdccf0c4bd09","product_name":"Godrei","model_number":"GTY654Z","price":"24560","manufacture_date":"2022-10-11 03:30:44.840589","manufacture_address":"India"},{"uuid":"f1aaa760-4914-11ed-9a24-bdccf0c4bd09","product_name":"Samsung","model_number":"WER8765","price":"45000","manufacture_date":"2022-10-11 03:29:42.102995","manufacture_address":"South Korea"},{"uuid":"e425a7c0-4914-11ed-9a24-bdccf0c4bd09","product_name":"Whirlpool","model_number":"IGT3456","price":"34000","manufacture_date":"2022-10-11 03:29:19.421547","manufacture_address":"London"}]';

  // Default Json For Laptops
  String jsonForLaptops =
      '[{"uuid":"d4d02680-4917-11ed-bd1b-51ad50b0cdbb","product_name":"DELL","model_number":"123ERTY","price":"75000","manufacture_date":"2022-10-11 03:50:22.185060","manufacture_address":"India"},{"uuid":"c06b8220-4917-11ed-bd1b-51ad50b0cdbb","product_name":"MAC BOOK","model_number":"M1 Chip","price":"135000","manufacture_date":"2022-10-11 03:49:47.970204","manufacture_address":"Newyork, America"},{"uuid":"ae3667f0-4917-11ed-bd1b-51ad50b0cdbb","product_name":"HP Pavilion","model_number":"MWER1234","price":"62500","manufacture_date":"2022-10-11 03:49:17.423148","manufacture_address":"China"}]';

  // Default Json For Headphones
  String jsonForHeadphones =
      '[{"uuid":"26269960-4918-11ed-bd1b-51ad50b0cdbb","product_name":"One Plus","model_number":"RES1234","price":"2000","manufacture_date":"2022-10-11 03:52:38.646320","manufacture_address":"China"},{"uuid":"18f956b0-4918-11ed-bd1b-51ad50b0cdbb","product_name":"Boat Rockerz","model_number":"250+ Plus","price":"1500","manufacture_date":"2022-10-11 03:52:16.539641","manufacture_address":"JinJiang, China"}]';

  // Default Json For Tv
  String jsonForTv =
      '[{"uuid":"8d032630-4918-11ed-bd1b-51ad50b0cdbb","product_name":"Panasonic","model_number":"POI235","price":"45000","manufacture_date":"2022-10-11 03:55:31.219490","manufacture_address":"South Korea"},{"uuid":"7cbf0690-4918-11ed-bd1b-51ad50b0cdbb","product_name":"Sony","model_number":"WSON123","price":"56000","manufacture_date":"2022-10-11 03:55:03.932988","manufacture_address":"Japan"}]';

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
