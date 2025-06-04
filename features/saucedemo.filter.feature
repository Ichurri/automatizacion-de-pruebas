Feature: Filter items
    As a user authenticated in SauceDemo 
    I want to be able to filter the products of the inventory 
    To easily find the products I am looking for according to different criteria

Background
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    And I click the Add to cart for the item "backpack"
    And debería ver todos los productos disponibles
    And debería ver el dropdown de filtros disponible
    And que estoy en la vista del inventario


Scenario: Filtrar productos por nombre de A a Z
    When hago clic en el dropdown de filtros
    And selecciono "Name (A to Z)"
    Then los productos deberían ordenarse alfabéticamente de A a Z
    And el filtro seleccionado debería mostrarse como "Name (A to Z)"

Scenario: Filtrar productos por nombre de Z a A
    When hago clic en el dropdown de filtros
    And selecciono "Name (Z to A)"
    Then los productos deberían ordenarse alfabéticamente de Z a A
    And el primer producto debería comenzar con una letra posterior al último producto
    And el filtro seleccionado debería mostrarse como "Name (Z to A)"

Scenario: Filtrar productos por precio de menor a mayor
    When hago clic en el dropdown de filtros
    And selecciono "Price (low to high)"
    Then los productos deberían ordenarse por precio ascendente
    And el precio del primer producto debería ser menor o igual al precio del último producto
    And el filtro seleccionado debería mostrarse como "Price (low to high)"

Scenario: Filtrar productos por precio de mayor a menor
    When hago clic en el dropdown de filtros
    And selecciono "Price (high to low)"
    Then los productos deberían ordenarse por precio descendente
    And el precio del primer producto debería ser mayor o igual al precio del último producto
    And el filtro seleccionado debería mostrarse como "Price (high to low)"

Scenario: Cambiar entre diferentes filtros
    And he aplicado el filtro "Name (A to Z)"
    When cambio el filtro a "Price (low to high)"
    Then los productos deberían reordenarse según el nuevo filtro aplicado
    And el filtro anterior debería ser reemplazado por el nuevo
    And debería ver todos los productos con el nuevo ordenamiento

Scenario Outline: Verificar que los filtros mantienen todos los productos
    And cuento el número total de productos mostrados
    When aplico el filtro "<filtro>"
    Then debería ver la misma cantidad de productos
    And ningún producto debería desaparecer o duplicarse
    And solo el orden de los productos debería cambiar

Examples:
  | filtro              |
  | Name (A to Z)       |
  | Name (Z to A)       |
  | Price (low to high) |
  | Price (high to low) |

Scenario Outline: Validar todos los filtros disponibles
    When hago clic en el dropdown de filtros
    Then debería ver la opción "<opcion_filtro>" disponible
    And debería poder seleccionar "<opcion_filtro>"

Examples:
  | opcion_filtro       |
  | Name (A to Z)       |
  | Name (Z to A)       |
  | Price (low to high) |
  | Price (high to low) |

Scenario: Verificar orden por defecto al cargar la página
    Given que estoy en la vista del inventario
    Then los productos deberían mostrarse en el orden por defecto
    And el filtro debería mostrar la Name (A to Z)
    And debería ver todos los productos disponibles

Scenario: Validar orden alfabético correcto (A to Z)
    When aplico el filtro "Name (A to Z)"
    Then el producto "Sauce Labs Backpack" debería aparecer antes que "Sauce Labs Onesie"
    And los nombres de productos deberían seguir el orden alfabético estricto
    And no debería haber errores en la secuencia alfabética

Scenario: Validar orden de precios correcto (low to high)
    When aplico el filtro "Price (low to high)"
    Then debería obtener los precios de todos los productos visibles
    And cada precio debería ser menor o igual al siguiente precio en la lista
    And el producto más barato debería aparecer primero
    And el producto más caro debería aparecer último

Scenario: Verificar persistencia del filtro al navegar
    And he aplicado el filtro "Price (high to low)"
    When hago clic en un producto para ver sus detalles
    And regreso a la vista del inventario usando el botón "Back to products"
    Then el filtro "Price (high to low)" debería seguir aplicado
    And los productos deberían mantener el orden por precio descendente