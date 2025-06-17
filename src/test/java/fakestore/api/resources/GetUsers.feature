#author Francisco Leon
Feature: Consulta de usuarios

  Background:

    * string apiPathUser = '/users/'
    * url urlApi = 'https://fakestoreapi.com'
    * string method = 'GET'
    * def random = function(){ var temp = ''; karate.repeat(1, function(){ temp += Math.floor(Math.random() * 10) + 1 }); return temp; }
    * configure headers = { User-Agent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', Accept: '*/*' }

  @getUser
  Scenario: Obtener producto

    * path apiPathUser + random()
    * configure headers = { 'Content-Type': 'application/json'}

    When method get
    Then status 200

    * def user = response.username
    * def password = response.password
