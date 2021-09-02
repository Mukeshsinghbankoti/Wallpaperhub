import 'package:wallpaper_hub/models/categries_model.dart';

String apikey = "563492ad6f917000010000010bc7b770b12b458bbb4e4ce0c2cd99fd";

List<CategoriesModels> getCategories() {
  List<CategoriesModels> categories = [];

  CategoriesModels categoriesModels1 = new CategoriesModels();
  categoriesModels1.categoriesName = "Plant";
  categoriesModels1.imageUrl =
      "https://images.pexels.com/photos/5858235/pexels-photo-5858235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categories.add(categoriesModels1);

  CategoriesModels categoriesModels2 = new CategoriesModels();
  categoriesModels2.categoriesName = "Cars";
  categoriesModels2.imageUrl =
      "https://images.pexels.com/photos/3156482/pexels-photo-3156482.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categoriesModels2);

  CategoriesModels categoriesModels3 = new CategoriesModels();
  categoriesModels3.categoriesName = "Parking";
  categoriesModels3.imageUrl =
      "https://images.pexels.com/photos/63294/autos-technology-vw-multi-storey-car-park-63294.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categories.add(categoriesModels3);

  CategoriesModels categoriesModels4 = new CategoriesModels();
  categoriesModels4.categoriesName = "Rail";
  categoriesModels4.imageUrl =
      "https://images.pexels.com/photos/302428/pexels-photo-302428.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categories.add(categoriesModels4);

  CategoriesModels categoriesModels5 = new CategoriesModels();
  categoriesModels5.categoriesName = "Street Art";
  categoriesModels5.imageUrl =
      "https://images.pexels.com/photos/5858235/pexels-photo-5858235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categories.add(categoriesModels5);

  return categories;
}
