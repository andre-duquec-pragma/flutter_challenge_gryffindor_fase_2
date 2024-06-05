
# flutter_challenge_gryffindor_fase_2

Para la solución de este reto se usó la Librería "Dio" para realizar el consumo de
los diferentes endpoints de la api "fakestore". Además de esto se implementó la librería "Dartz" y de esta se usó el tipo de dato "Either" para manejar las respuestas de datos y encapsular los posibles errores.

El proyecto usa el patron "Repository" para manejar el acceso a los datos de api.

La estructura del proyecto es la siguiente:

- base
- models
  - responses
  - request
- repositories
- utils

Dentro de la carpeta "base" se encuentran las clases de configuración del proyecto, dentro de las cuales se realiza la inyección de dependencias y se expone una clase abstracta que es necesaria para configurar la url base de la api.

Dentro de la carpeta "models" se encuentran modelados todos los datos referentes a las respuestas y peticiones que están relacionados con el consumo de la api.
Cada uno de los modelos es inmutable y cuenta con los métodos necesarios para realizar serializaciones y hacerlo comparable con otros modelos.

Dentro de la carpeta "repositories" se encuentran las abstracciones e implementaciones de cada una de las representaciones de acceso a datos.
Además de esto, también se encuentra con una sub carpeta llamada "base" donde se encuentra una implementación genérica de un repositorio. Esta es usada para encapsular lógica común de todos los repos.

Dentro de la carpeta "utils" se encuentran funcionalidades transversales para el resto de los módulos.

El proyecto también usa el patrón "Criteria". Así que dependiendo del repo se pueden filtrar y ordenar los datos de diferente manera.

Dentro de la clase main.dart se encuentra un ejemplo concreto del uso de cada uno de los repositorios creados en el proyecto.

Para comenzar a usar el proyecto es necesario agregar una configuración inicial. Para esto se debe crear una implementación de la clase abstracta 'RepositoryGlobalConfig'. Dentro de esta es necesario que expongamos la url del servicio a consumir.

```dart
class RepositoryGlobalConfigImpl implements RepositoryGlobalConfig {
  @override
  String get baseUrl => "https://fakestoreapi.com";
}
```

Luego de tener esto es necesario registrar esta implementación para que pueda ser usada en todo el proyecto.

```dart
RepositoryPackageBuilder.start(
  config: RepositoryGlobalConfigImpl(),
);
```

Ahora, teniendo esto listo podemos comenzar a usar los repositorios para consumir la api de FakeStore.

Algunos de los servicios admiten criterios de filtrado. Así que veamos como usarlos:

```dart
    ProductsRepository productsRepository = ProductsRepositoryImpl();

    // Products limit by 2 and desc order

    final productsResponseByCategories = await productsRepository.get(
      criteria: [
        const LimitCriteria(limit: 3),
      ],
      filters: [
        const FilterByCategoryCriteria(category: "electronics"),
      ],
    );
```

Estos criterios no son obligatorios al momento de realizar una petición a la api, sin embargo los podemos combinar de la manera que deseemos para obtener resultados mas ordenados.

El consumo de un servicio sin criterios de busquedad sería el siguiente:

```dart
AuthRepository authRepository = AuthRepositoryImpl();

const loginRequest = LoginRequest(
  username: "mor_2314",
  password: "83r5^_",
);

final loginResponse = await authRepository.login(request: loginRequest);
```
