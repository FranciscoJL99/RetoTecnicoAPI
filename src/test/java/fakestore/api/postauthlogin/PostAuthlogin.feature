#author Francisco Leon
Feature: Autenticacion de Usuarios

  Background:

    * string pathProducts = '/auth/login'
    * url urlApi = 'https://fakestoreapi.com'
    * string method = 'post'

  #Dado un usuario que requiere eliminar un producto
  #Cuando ingresa el identificador del producto
  #Y Consume el servicio
  #Entonces se eliminar el producto exitosamente
  @happyPath
  Scenario: 1. Autenticacion exitosa de un usuario

    * configure headers = { 'Content-Type': 'application/json'}
    * def apiRequest = { 'username': '#(nameRandom)', 'password': <price>}
    * print apiRequest

    Given request apiRequest
    When method post
    Then status 200

    * print response
    * def id =  response.id

    * match response.name == nameRandom
    * match response.price == <price>
    * match response.description == '<description>'

