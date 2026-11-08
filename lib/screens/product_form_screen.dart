
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/product_service.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;

  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() =>
      _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ProductService _service = ProductService();

  final _nameController = TextEditingController();
  final _skuController = TextEditingController();
  final _categoryController = TextEditingController();
  final _quantityController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _salePriceController = TextEditingController();

  bool _saving = false;

  @override
  void initState() {
    super.initState();

    final product = widget.product;

    if (product != null) {
      _nameController.text = product.name;
      _skuController.text = product.sku;
      _categoryController.text = product.category;
      _quantityController.text = product.quantity.toString();
      _purchasePriceController.text =
          product.purchasePrice.toString();
      _salePriceController.text = product.salePrice.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _skuController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    _purchasePriceController.dispose();
    _salePriceController.dispose();

    super.dispose();
  }

  String? _validateText(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo obrigatório';
    }

    if (double.tryParse(value.replaceAll(',', '.')) == null) {
      return 'Informe um número válido';
    }

    return null;
  }

  Future<void> _saveProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    try {
      final product = Product(
        id: widget.product?.id,
        name: _nameController.text.trim(),
        sku: _skuController.text.trim(),
        category: _categoryController.text.trim(),
        quantity: int.parse(_quantityController.text.trim()),
        purchasePrice: double.parse(
          _purchasePriceController.text.replaceAll(',', '.'),
        ),
        salePrice: double.parse(
          _salePriceController.text.replaceAll(',', '.'),
        ),
      );

      if (widget.product == null) {
        await _service.createProduct(product);
      } else {
        await _service.updateProduct(product);
      }

      if (!mounted) return;

      Navigator.pop(context, true);
    } catch (e) {
  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Erro ao salvar produto: $e'),
      duration: const Duration(seconds: 8),
    ),
  );
} finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Editar produto' : 'Novo produto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField(
                label: 'Nome do produto',
                controller: _nameController,
                validator: _validateText,
              ),
              _buildField(
                label: 'Código SKU',
                controller: _skuController,
                validator: _validateText,
              ),
              _buildField(
                label: 'Categoria',
                controller: _categoryController,
                validator: _validateText,
              ),
              _buildField(
                label: 'Quantidade em estoque',
                controller: _quantityController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }

                  final number = int.tryParse(value);

                  if (number == null || number < 0) {
                    return 'Informe um inteiro maior ou igual a zero';
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              _buildField(
                label: 'Preço de compra',
                controller: _purchasePriceController,
                validator: _validateNumber,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              _buildField(
                label: 'Preço de venda',
                controller: _salePriceController,
                validator: _validateNumber,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saving ? null : _saveProduct,
                  child: _saving
                      ? const CircularProgressIndicator()
                      : Text(editing ? 'Atualizar produto' : 'Salvar produto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
