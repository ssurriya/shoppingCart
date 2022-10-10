import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shoppingcart/product_service.dart';
import 'package:uuid/uuid.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen();

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int _currentTabIndex = 0;
  List tabs = [
    {"id": 1, "icon": Icons.mobile_friendly, "title": "Mobile Phones"},
    {"id": 2, "icon": Icons.ac_unit, "title": "AC"},
    {"id": 3, "icon": Icons.laptop, "title": "Laptop"},
    {"id": 4, "icon": Icons.headset, "title": "Headphones"},
    {"id": 5, "icon": Icons.tv, "title": "TV"}
  ];

  List _products = [];

  String _dateFormat(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: AppBar(
          leading: const Icon(Icons.supervised_user_circle_rounded),
          title: const Text("Customer Name"),
          actions: [
            IconButton(
                onPressed: () {
                  _showModalDialog();
                },
                icon: const Icon(Icons.add))
          ],
          bottom: TabBar(
              onTap: (index) {
                setState(() {
                  _currentTabIndex = index;
                  _getValuesFromService();
                });
              },
              tabs: tabs.map((e) {
                return Tab(
                  icon: Icon(e['icon']),
                  text: e['title'],
                );
              }).toList()),
        ),
        body: _products.isEmpty
            ? const Center(
                child: Text("No Data Found"),
              )
            : ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_products[index]['uuid'].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: ((direction) {
                      _deleteProduct(_products[index]['uuid'].toString());
                      _getValuesFromService();
                      _showToaster("Deleted Added Successfully");
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: ExpansionTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _products[index]['product_name'],
                                      style: const TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "\u{20B9} ${_products[index]['price']}",
                                        style: const TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  _products[index]['model_number'],
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                    "Manufacture Date :${_dateFormat(_products[index]['manufacture_date'])}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                    "Manufacture Address :${_products[index]['manufacture_address']}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // Set Product Values
  _getValuesFromService() {
    setState(() {
      switch (_currentTabIndex) {
        case 0:
          _products = ProductService.getInstance().getMobilePhones;
          break;
        case 1:
          _products = ProductService.getInstance().getAcList;
          break;
        case 2:
          _products = ProductService.getInstance().getLaptop;
          break;
        case 3:
          _products = ProductService.getInstance().getHeadphones;
          break;
        case 4:
          _products = ProductService.getInstance().getTvList;
          break;
      }
    });
  }

  _setValueToService(Map json) {
    setState(() {
      switch (_currentTabIndex) {
        case 0:
          ProductService.getInstance().setMobilePhones(json);
          break;
        case 1:
          ProductService.getInstance().setAcList(json);
          break;
        case 2:
          ProductService.getInstance().setLaptop(json);
          break;
        case 3:
          ProductService.getInstance().setHeadphone(json);
          break;
        case 4:
          ProductService.getInstance().setTvDetail(json);
          break;
      }
    });
  }

  _deleteProduct(String uuid) {
    setState(() {
      switch (_currentTabIndex) {
        case 0:
          ProductService.getInstance().deleteMobilePhone(uuid);
          break;
        case 1:
          ProductService.getInstance().deleteAcDetail(uuid);
          break;
        case 2:
          ProductService.getInstance().deleteLaptop(uuid);
          break;
        case 3:
          ProductService.getInstance().deleteHeadphones(uuid);
          break;
        case 4:
          ProductService.getInstance().deleteTvDetail(uuid);
          break;
      }
    });
  }

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _modelNoController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  _showModalDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 2,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'Inter-Medium'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _textField(_productNameController, "Product Name"),
                  _textField(_modelNoController, "Model Number"),
                  _textField(_addressController, "Manufacture Address"),
                  _textField(_priceController, "Price"),
                  ElevatedButton(
                      onPressed: (() {
                        if (_globalKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          Map json = {
                            "uuid": const Uuid().v1(),
                            "product_name": _productNameController.text,
                            "model_number": _modelNoController.text,
                            "price": _priceController.text,
                            "manufacture_date": DateTime.now(),
                            "manufacture_address": _addressController.text,
                          };
                          _setValueToService(json);
                          _clear();
                          _showToaster("Product Added Successfully");
                        }
                      }),
                      child: const Text("Submit"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _clear() {
    _productNameController = TextEditingController();
    _modelNoController = TextEditingController();
    _priceController = TextEditingController();
    _addressController = TextEditingController();
  }

  Widget _textField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "$labelText is empty";
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffA4A9B3),
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Color(0xff006BD6),
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Color(0xffA4A9B3),
                //width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Color(0xffA4A9B3),
                //width: 2.0,
              ),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Color(0xffA6A6A6),
                fontSize: 16.0,
                fontFamily: 'Inter-Medium'),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5)),
      ),
    );
  }

  _showToaster(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
