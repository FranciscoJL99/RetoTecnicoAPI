#author Francisco Leon
@E2E
Feature: Creacion de Usuarios

  Background:

    * string apiPath = '/users'
    * url urlApi = 'https://fakestoreapi.com'
    * path apiPath
    * string method = 'POST'
    * def FakeData = Java.type('fakestore.api.utils.FakeDataGenerator')
    * configure headers = { User-Agent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', Accept: '*/*' }

  #Dado un usuario que requiere ser creado
  #Cuando se ingresa los datos del usuario
  #Y Consume el servicio
  #Entonces se crea el usuario con los datos ingresados
  @happyPath
  Scenario: 1. Creacion de usuario exitosa

    * configure headers = { 'Content-Type': 'application/json'}
    * def apiRequest = {'username': '#(FakeData.randomUsername())', 'email': '#(FakeData.randomEmail())', 'password': '#(FakeData.randomPassword())'}
    * print apiRequest

    Given request apiRequest
    When method post
    Then status 200

    * print response
    * def id =  response.id

    * match response contains { id: '#notnull' }


  #Dado un usuario que requiere ser creado
  #Cuando se ingresa los datos del usuario errados
  #Y Consume el servicio
  #Entonces no se crea el usuario
  #Y se retorna un status de error
  @unhappyPath
  Scenario: 2. Creacion de usuario fallido

    * configure headers = { 'Content-Type': 'application/json'}
    * def apiRequest = {'id': '', 'username': '#(FakeData.randomUsername())', 'email': '#(FakeData.randomEmail())', 'password': '#(FakeData.randomPassword())'}
    * print apiRequest

    Given request apiRequest
    When method post
    #Then status 400

    * print response