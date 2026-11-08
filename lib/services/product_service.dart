
import '../database/database_helper.dart';
import '../models/product.dart';

class ProductService {

  // CREATE - Cadastrar produto
  Future<int> createProduct(Product product) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert(
      'products',
      product.toMap(),
    );
  }

  // READ - Listar produtos
  Future<List<Product>> getProducts() async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'products',
      orderBy: 'name ASC',
    );

    return result.map((map) => Product.fromMap(map)).toList();
  }

  // UPDATE - Atualizar produto
  Future<int> updateProduct(Product product) async {
    final db = await DatabaseHelper.instance.database;

    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  // DELETE - Excluir produto
  Future<int> deleteProduct(int id) async {
    final db = await DatabaseHelper.instance.database;

    return await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
