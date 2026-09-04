# 📚 Misiones Libro — Backend

API REST para un sistema de punto de venta e inventario de una librería. Maneja autenticación de usuarios, control de stock de productos y registro de ventas con historial y ganancias.

Este es el backend del proyecto. El frontend (React + Vite) está en [misiones-libro](https://github.com/benja3086/misiones-libro).

## 🚀 Tecnologías utilizadas

- Node.js + Express
- MongoDB (driver oficial `mongodb`)
- JWT (`jsonwebtoken`) para autenticación
- bcrypt para hash de contraseñas
- Docker
- Despliegue en Railway

## 👀 ¿Qué hace esta API?

- **Autenticación de usuarios** con JWT, vía cookie httpOnly o header `Authorization: Bearer`.
- **Roles** (admin / vendedor) con rutas protegidas según permisos.
- **Gestión de productos**: alta, baja, modificación y listado del catálogo de libros.
- **Registro de ventas**: descuenta stock automáticamente, guarda método de pago, comprador, comentario y vendedor que la realizó.
- **Historial de ventas** ordenado por fecha, con posibilidad de marcar ventas con un color (para seguimiento) y eliminarlas.
- **Gestión de usuarios** (solo admin): listado y eliminación.

## 🔌 Endpoints principales

### Auth
| Método | Ruta | Descripción |
|--------|------|-------------|
| POST | `/login` | Inicia sesión y devuelve un JWT |
| POST | `/register` | Crea un nuevo usuario |
| POST | `/logout` | Cierra sesión |
| GET | `/me` | Devuelve el usuario autenticado |

### Productos
| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/productos` | Lista todos los productos |
| GET | `/productos/:id` | Obtiene un producto por ID |
| POST | `/productos` | Crea un producto *(requiere auth)* |
| PUT | `/productos/:id` | Actualiza un producto *(requiere auth)* |
| DELETE | `/productos/:id` | Elimina un producto *(requiere auth)* |

### Ventas
| Método | Ruta | Descripción |
|--------|------|-------------|
| POST | `/ventas` | Registra una venta y descuenta stock *(requiere auth)* |
| GET | `/ventas` | Lista el historial de ventas *(requiere auth)* |
| PATCH | `/ventas/:id` | Marca una venta con un color *(solo admin)* |
| DELETE | `/ventas/:id` | Elimina una venta *(requiere auth)* |

### Usuarios
| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/usuarios` | Lista usuarios *(solo admin)* |
| DELETE | `/usuarios/:id` | Elimina un usuario *(solo admin)* |

## ⚙️ Variables de entorno

Crear un archivo `.env` en la raíz con:

```
PORT=3000
MONGO_URI=tu_uri_de_mongodb
SECRET_JWT_KEY=tu_clave_secreta
SALT_ROUNDS=10
```

## 🐳 Correr con Docker

```bash
docker build -t misiones-back .
docker run -p 8080:8080 --env-file .env misiones-back
```

## 💻 Correr en local

```bash
npm install
npm run dev
```

## 🌐 Despliegue

Desplegado en [Railway](https://railway.app).

## 👨‍💻 Autor

- Benjamin Quinteros Tacconi ([@benja3086](https://github.com/benja3086))