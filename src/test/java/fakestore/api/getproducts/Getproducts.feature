#author Francisco Leon
@E2E
Feature: Consulta de productos

  Background:

    * string apiPathProduct = '/products/'
    * url urlApi = 'https://fakestoreapi.com'
    * string method = 'GET'
    * def random = function(){ return Math.floor(Math.random() * 10) + 1; }
    * configure headers = { User-Agent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', Accept: '*/*' }

  @getProducts
  Scenario: Obtener producto

    * def id = random()
    * print id

    * path apiPathProduct
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 200

    * def product = response[id]
    * print product
    * def idProduct = product.id
    * print idProduct

