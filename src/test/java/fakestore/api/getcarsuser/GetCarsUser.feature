#author Francisco Leon
@E2E
Feature: Consulta de carrito

  Background:

    * string apiPathCarts = '/carts/'
    * url urlApi = 'https://fakestoreapi.com'
    * string method = 'GET'
    * def random = function(){ return Math.floor(Math.random() * 7) + 1; }
    * configure headers = { User-Agent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', Accept: '*/*' }

  Scenario: Obtener informacion de carrito de compras

    * def id = random()
    * print id

    * path apiPathCarts + id
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 200

    * print response

  Scenario: Obtener informacion de carrito de compras sin productos

    * def id = random()
    * print id

    * path apiPathCarts + 8
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 200

    * print response

