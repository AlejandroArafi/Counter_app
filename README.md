# Contador App

Este proyecto creado en Flutter demuestra el uso básico de estados a través de una aplicación simple de contador. Permite al usuario incrementar, decrementar y resetear un contador, así como cambiar el color de fondo.

## Características

- **Incremento y Decremento**: Los botones permiten modificar el valor del contador, aumentándolo o disminuyéndolo respectivamente.
- **Reseteo**: Un botón adicional permite restablecer el contador a 0.
- **Cambio de Color**: La aplicación cambia el color de fondo de la AppBar y del cuerpo principal según la selección del usuario en la barra de navegación inferior.

## Cómo empezar

Para ejecutar este proyecto, asegúrate de tener Flutter instalado en tu sistema. 

Una vez que tengas Flutter configurado, sigue estos pasos:

1. Clona este repositorio a tu máquina local.
2. Abre un terminal y navega al directorio del proyecto.
3. Ejecuta `flutter pub get` para instalar todas las dependencias necesarias.
4. Ejecuta `flutter run` para iniciar la aplicación en un dispositivo conectado o emulador.

## Estructura del Proyecto

El proyecto se estructura principalmente alrededor de dos widgets de estado:

- `MainApp`: Es el widget principal que maneja la navegación y los cambios de estado global, como el cambio de color.
- `CounterWidget`: Maneja el estado del contador, permitiendo incrementar, decrementar y resetear el contador.

La lógica de cambio de color se maneja en `MainApp`, basada en la selección del usuario en la `BottomNavigationBar`.

## Contribuir

Si tienes alguna sugerencia para mejorar este proyecto, no dudes en crear un pull request o abrir un issue. Todas las contribuciones son bienvenidas.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.
