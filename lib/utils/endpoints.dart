/// An enum to represent all available endpoints.
enum Endpoints {
  base(value: "https://fakestoreapi.com"),
  products(value: "/products"),
  categories(value: "/products/categories"),
  users(value: "/users"),
  login(value: "/auth/login");

  final String value;

  const Endpoints({
    required this.value,
  });
}
