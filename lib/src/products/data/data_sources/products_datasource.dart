import 'package:app/src/products/data/models/product_dto.dart';
import 'package:app/src/products/presentation/view/widgets/products_item.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/utils/constants.dart';

part 'products_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  ProductsDatasource{

  @factoryMethod
  factory ProductsDatasource(Dio dio) = _ProductsDatasource;

  @GET('/v1/products')
  Future<List<ProductDto>> fetchProducts();
}