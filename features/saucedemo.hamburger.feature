Feature: Saucedemo hamburger menu
    As a user authenticated in SauceDemo 
    I want to be able to navigate using the hamburger menu 
    To access the different functionalities of the application
    
Background
	Given I am on the login page
	When I enter "standard_user" in the Username field
	And I enter "secret_sauce" in the Password field
	And I click on the Login button
	Then I should be able to see the Product page
    And debería ver el menú hamburguesa disponible

Scenario: Navegar a All Items desde el menú hamburguesa
    Given que estoy en la vista principal de Swag Labs
    When hago clic en el menú hamburguesa
    And el menú se despliega
    And hago clic en "All Items"
    Then debería permanecer en la vista principal del inventario
    And debería ver todos los productos disponibles
    And el menú hamburguesa debería cerrarse

Scenario: Navegar a la página About
    Given que estoy en la vista principal de Swag Labs  
    When hago clic en el menú hamburguesa
    And el menú se despliega
    And hago clic en "About"
    Then debería ser redirigido a "https://saucelabs.com"
    And debería ver información sobre los desarrolladores de SauceDemo
    And debería estar en una nueva pestaña o ventana

Scenario: Cerrar sesión usando Logout
    Given que estoy en la vista principal de Swag Labs
    When hago clic en el menú hamburguesa  
    And el menú se despliega
    And hago clic en "Logout"
    Then debería ser redirigido a la página de login
    And debería ver los campos de usuario y contraseña vacíos
    And no debería tener acceso a las páginas protegidas

Scenario: Resetear el estado de la aplicación
    Given que estoy en la vista principal de Swag Labs
    And he agregado algunos productos al carrito de compras
    When hago clic en el menú hamburguesa
    And el menú se despliega  
    And hago clic en "Reset App State"
    Then el estado de la aplicación debería reiniciarse
    And el carrito de compras debería estar vacío
    And cualquier filtro aplicado debería restablecerse
    And debería permanecer en la vista actual

Scenario: Verificar que el menú se cierra al hacer clic fuera
    Given que estoy en la vista principal de Swag Labs
    When hago clic en el menú hamburguesa
    And el menú se despliega mostrando todas las opciones
    When hago clic fuera del área del menú
    Then el menú hamburguesa debería cerrarse
    And debería permanecer en la vista actual

Scenario Outline: Validar todas las opciones del menú hamburguesa
    Given que estoy en la vista principal de Swag Labs
    When hago clic en el menú hamburguesa
    Then debería ver la opción "<opcion>" disponible
    And la opción "<opcion>" debería ser clickeable

Examples:
  | opcion           |
  | All Items        |
  | About            |
  | Logout           |
  | Reset App State  |
      
