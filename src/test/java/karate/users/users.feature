Feature: Gestión de Usuarios - API JSONPlaceholder
  Como QA Automation, valido el comportamiento del CRUD de usuarios.

  Background:
    * url baseUrl
    * def userSchema = read('classpath:karate/users/schemas/user-schema.json')

  Scenario: Obtener detalle de usuario y validar contrato (Schema Validation)
    Given path 'users', '2'
    When method get
    Then status 200
    # Validación directa de datos exactos + Schema
    And match response.id == 2
    And match response == userSchema

  Scenario Outline: Carga y creación masiva de usuarios (Data Driven Testing)
    Given path 'users'
    And request { "name": "<name>", "username": "<job>" }
    When method post
    Then status 201
    And match response.name == "<name>"
    And assert responseTime < 3000

    Examples:
      # Carga automática desde tu archivo CSV externo
      | read('classpath:karate/users/data/users-data.csv') |

  Scenario: Invocar Helper Reutilizable
    # Llamamos al helper de logins simulado en JSONPlaceholder
    * def authResult = call read('classpath:karate/helpers/login-helper.feature')
    * print 'Resultado obtenido del helper:', authResult.response
    * match authResult.response.id == 101