# Etapa 1: Build
FROM node:20-alpine AS builder

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --omit=dev

# Etapa 2: Production
FROM node:20-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Crear usuario no-root para seguridad
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Copiar dependencias desde builder
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules

# Copiar código fuente
COPY --chown=nodejs:nodejs . .

# Cambiar al usuario no-root
USER nodejs

# Exponer el puerto
EXPOSE 8080

# Variables de entorno por defecto (se pueden sobrescribir)
ENV NODE_ENV=production \
    PORT=8080

# Comando para iniciar la aplicación
CMD ["node", "src/index.js"]
