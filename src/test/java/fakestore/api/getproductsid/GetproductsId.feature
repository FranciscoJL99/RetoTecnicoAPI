#author Francisco Leon
@E2E
Feature: Consulta de producto por id

  Background:

    * string apiPathProductId = '/products/'
    * url urlApi = 'https://fakestoreapi.com'
    * string method = 'GET'

  Scenario: Obtener producto por id

    * def getProduct = call read('classpath:fakestore/api/getproducts/Getproducts.feature@getProducts')

    * path apiPathProductId + getProduct.idProduct
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 200

    * print response

  Scenario: Obtener producto que no existe

    * def getProduct = call read('classpath:fakestore/api/getproducts/Getproducts.feature@getProducts')

    * path apiPathProductId + 50
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 200

    * print response

  Scenario: consulta con un path no existente

    * def getProduct = call read('classpath:fakestore/api/getproducts/Getproducts.feature@getProducts')

    * string apiPathProductIdBad = '/product/'

    * path apiPathProductIdBad + getProduct.idProduct
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 404

    * print response





