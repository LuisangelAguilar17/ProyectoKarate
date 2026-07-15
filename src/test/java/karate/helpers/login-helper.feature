@ignore
Feature: Helper de sesión reutilizable

  Scenario: Crear sesión de prueba simulada
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request { title: 'session_token', body: 'auth_success', userId: 1 }
    When method post
    Then status 201