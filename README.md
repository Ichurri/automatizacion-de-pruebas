# 🧪 Automatización de Pruebas - SauceDemo

## 📋 Descripción del Proyecto

Este proyecto implementa un framework de automatización de pruebas para la aplicación web [SauceDemo](https://www.saucedemo.com) utilizando metodología **BDD (Behavior Driven Development)** con Ruby, Cucumber y Capybara.

## 👥 Equipo QA

- **Santiago Iturri** - QA Engineer
- **Alejandro Bustamante** - QA Engineer

## 🛠️ Tecnologías Utilizadas

- **Ruby** - Lenguaje de programación
- **Cucumber** - Framework BDD para escribir y ejecutar pruebas
- **Capybara** - DSL para interactuar con aplicaciones web
- **Selenium WebDriver** - Automatización de navegadores web
- **RSpec** - Framework de testing para assertions

## 📁 Estructura del Proyecto

```
├── README.md
├── Gemfile                     # Dependencias de Ruby
├── features/                   # Archivos de características (Gherkin)
│   ├── saucedemo.[module].feature    # Archivo gherkin para la descripción de las pruebas
│   ├── step_definitions/       # Definiciones de pasos
│       └── saucedemoSteps.rb     # Implementación de los casos de prueba
│   └── support/               # Configuración y helpers
│       ├── env.rb    # Variables de entorno
│       └── hooks.rb     # Implementación de hooks
└── reports/               # Reportes de ejecución
```

## 🎯 Funcionalidades Cubiertas

- ✅ **Login de usuarios** - Autenticación con diferentes tipos de usuarios
- ✅ **Logout de usuarios** - Cerrado de sesión para usuarios
- ✅ **Catologo de productos** - Interacción con el catálogo de productos
- ✅ **Filtrado de productos** - Pruebas de funcionalidad de filtros
- ✅ **Carrito de compras** - Pruebas a funcionamiento del carrito de compras
- ✅ **Chechout en una compra** - Pruebas al proceso de checkout de una compra
- ✅ **Menú hamburguesa** - Validación de navegación lateral
- ✅ **Links del footer** - Prueba a enlaces del footer

## 🚀 Configuración del Entorno

### Prerrequisitos

- Ruby 2.7 o superior
- Bundler
- Google Chrome o Firefox
- ChromeDriver o GeckoDriver

### Instalación

1. **Clonar el repositorio:**

   ```bash
   git clone <url-del-repositorio>
   cd autmatizacion-de-pruebas
   ```

2. **Instalar dependencias:**

   ```bash
   bundle install
   ```

3. **Configurar WebDriver:**
   - Asegúrate de tener ChromeDriver en tu PATH
   - O instala webdriver-manager si está configurado

## 🏃‍♂️ Ejecución de Pruebas

### Ejecutar todas las pruebas

```bash
cucumber
```

### Ejecutar pruebas específicas por archivo

```bash
#Para ejecución de un feature file específico
cucumber features/saucedemo.[module].feature
#Para ejecución de todos los features files
cucumber features/saucedemo*
```

### Ejecutar pruebas por tags

```bash
cucumber --tags @maximize
cucumber --tags @login
```

### Generar reportes HTML

```bash
cucumber --format html --out reports/report.html
```

## 📝 Escribiendo Nuevas Pruebas

### Estructura de un Feature File

```gherkin
Feature: Nombre de la funcionalidad
  As a <tipo de usuario>
  I want to <acción que quiero realizar>
  So that <beneficio que obtengo>

  @tag
  Scenario: Descripción del escenario
    Given <precondición>
    When <acción>
    Then <resultado esperado>
```

### Mejores Prácticas

- Utilizar tags para categorizar escenarios (`@smoke`, `@regression`, `@critical`)
- Escribir scenarios descriptivos y fáciles de entender
- Mantener los pasos reutilizables
- Usar Page Object Model para mantener el código organizado

## 🌐 Aplicación Bajo Prueba

**URL:** https://www.saucedemo.com

### Usuarios de Prueba Disponibles:

- `standard_user`
- `locked_out_user`
- `problem_user`
- `performance_glitch_user`

**Contraseña:** `secret_sauce`

## 📊 Reportes

Los reportes de ejecución se generan en la carpeta `testresults/` con:

- Resultados detallados por escenario
- Screenshots en caso de fallos
- Tiempo de ejecución
- Estadísticas de cobertura

## 🐛 Debugging

### Para ejecutar en modo debug:

```bash
cucumber --format pretty --verbose
```

### Para ejecutar con screenshots:

```bash
cucumber --format html --out testresults/report.html
```

## 🤝 Contribución

1. Crear una rama para la nueva funcionalidad
2. Escribir los tests siguiendo BDD
3. Implementar los step definitions
4. Ejecutar las pruebas y verificar que pasen
5. Crear un Pull Request

## 📞 Contacto

Para dudas o sugerencias, contactar al equipo QA:

- Santiago Iturri
- Alejandro Bustamante

---

**Fecha de creación:** Mayo 2025  
**Versión:** 1.0  
**Estado:** En desarrollo activo
