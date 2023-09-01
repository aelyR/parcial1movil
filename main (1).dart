class Producto {
  String nombre;
  DateTime fechaVencimiento;
  double precio;

  Producto(this.nombre, this.fechaVencimiento, this.precio);
}

class Venta {
  List<Producto> _productos = [];

  void agregarProducto(Producto producto) {
    _productos.add(producto);
  }

  double calcularTotal() {
    double total = 0;
    for (var producto in _productos) {
      if (producto.fechaVencimiento.difference(DateTime.now()).inDays <= 15) {
        total += producto.precio * 0.85; 
      } else {
        total += producto.precio;
      }
    }
    return total;
  }
}

void main() {
  var venta = Venta();

  venta.agregarProducto(Producto('Naranjas', DateTime(2023, 3, 17), 2.700));
  venta.agregarProducto(Producto('Peras', DateTime(2023, 3, 24), 1.400));
  venta.agregarProducto(Producto('Sandias', DateTime(2023, 4, 12), 3.100));
  venta.agregarProducto(Producto('Bombones', DateTime(2023, 4, 14), 2.200));
  venta.agregarProducto(Producto('Chocolate', DateTime(2023, 4, 19), 5.000));
  venta.agregarProducto(Producto('Gaseosa', DateTime(2023, 5, 17), 5.500));

  print('El total a pagar por los productos es de: \$${venta.calcularTotal()}');
}