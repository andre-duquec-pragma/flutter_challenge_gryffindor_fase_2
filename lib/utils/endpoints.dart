enum Endpoints {
  products(value: "/products"),
  categories(value: "/products/categories"),
  users(value: "/users"),
  login(value: "/auth/login");

  final String value;

  const Endpoints({
    required this.value,
  });
}
