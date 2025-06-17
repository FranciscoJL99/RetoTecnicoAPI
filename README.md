# Proyecto de Automatización de API con Karate - FakeStoreAPI

Este proyecto realiza pruebas automatizadas sobre la API pública [FakeStoreAPI](https://fakestoreapi.com) utilizando el framework **Karate DSL**. Las pruebas están organizadas por funcionalidades clave de la API: carritos, productos, autenticación y usuarios.

## Estructura del Proyecto

```
fakestore/
├── api/
│   ├── getcarsuser/
│   │   └── GetCarsUser.feature
│   ├── getproducts/
│   │   └── Getproducts.feature
│   ├── getproductsid/
│   │   └── GetproductsId.feature
│   ├── postauthlogin/
│   │   └── PostAuthlogin.feature
│   └── postusers/
│       └── PostUsers.feature
├── resources/
│   └── GetUsers.feature
└── utils/
    └── FakeDataGenerator.java
```

## Escenarios Cubiertos

### 🔹 Carritos (`GetCarsUser.feature`)
- Obtener información de un carrito de compras con productos.
- Obtener información de un carrito vacío.

### 🔹 Productos (`Getproducts.feature` y `GetproductsId.feature`)
- Obtener un listado de productos.
- Obtener un producto por ID.
- Validar respuesta para un ID inexistente.
- Validar respuesta con una ruta incorrecta.

### 🔹 Autenticación (`PostAuthlogin.feature`)
- Autenticación exitosa de un usuario (retorna un token).
- Autenticación fallida con credenciales incorrectas.

### 🔹 Usuarios (`PostUsers.feature`)
- Creación exitosa de un usuario con datos generados dinámicamente.
- Intento fallido de creación con datos erróneos.

## Ejecución de Pruebas

Las pruebas se ejecutan utilizando un **Runner personalizado en Java** con JUnit5 y Karate Runner API.

```java
import static org.junit.jupiter.api.Assertions.assertEquals;

public class E2ERunner {
    @Test
    @Order(1)
    public void testUsers() { ... }

    @Test
    @Order(2)
    public void testLogin() { ... }

    @Test
    @Order(3)
    public void testGetProducts() { ... }

    @Test
    @Order(4)
    public void testGetProductsId() { ... }

    @Test
    @Order(5)
    public void testGetCarts() { ... }
}
```

📂 Los reportes generados se almacenan en:
```
target/cucumber-reports/E2E Runner/
```

## Requisitos

- Java 11+
- Maven o Gradle
- Karate DSL
- JUnit 5

## Cómo ejecutar

```bash
mvn test
```

---