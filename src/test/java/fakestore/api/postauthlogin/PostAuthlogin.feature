#author Francisco Leon
@E2E
Feature: Autenticacion de Usuarios

  Background:

    * string apiPath = '/auth/login'
    * url urlApi = 'https://fakestoreapi.com'
    * string method = 'post'
    * configure headers = { User-Agent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', Accept: '*/*' }

  #Dado que tengo un usuario registrado
  #Cuando intento iniciar sesión con credenciales correctas
  #Entonces el sistema debe responder con un status 200 y un token
  @happyPath
  Scenario: 1. Autenticacion exitosa de un usuario

    * def getUser = call read('classpath:fakestore/api/resources/GetUsers.feature@getUser')

    * path apiPath

    * configure headers = { 'Content-Type': 'application/json'}
    * def apiRequest = { 'username': '#(getUser.user)', 'password': '#(getUser.password)'}
    * print apiRequest

    Given request apiRequest
    When method post
    Then status 200

    * print response
    * match response contains { token: '#notnull' }

  #Dado que tengo un usuario registrado
  #Cuando intento iniciar sesión con credenciales incorrectas
  #Entonces el sistema debe responder con un código de error 401 (No autorizado)
  @unhappyPath
  Scenario: 2. Autenticacion fallida de un usuario

    * def getUser = call read('classpath:fakestore/api/resources/GetUsers.feature@getUser')

    * path apiPath

    * configure headers = { 'Content-Type': 'application/json'}
    * def apiRequest = { 'username': '#(getUser.user)', 'password': 'password123'}
    * print apiRequest

    Given request apiRequest
    When method post
    Then status 401

    * print response

