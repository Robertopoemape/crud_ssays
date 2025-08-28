# 📦 CRUD Descriptions - Flutter + Riverpod + DDD

Este proyecto es un ejemplo de **CRUD (Create, Read, Update, Delete)** en Flutter utilizando:

- **DDD (Domain-Driven Design)**
- **Clean Architecture**
- **Riverpod** para la gestión del estado

## 🚀 Estructura del proyecto

1. **UI (presentation/screens)** → Interactúa con los `providers`.
2. **Provider (presentation/providers)** → Llama a los casos de uso en la capa `application`.
3. **Application (src/description/application)** → Contiene la lógica de negocio y orquesta el flujo.
4. **Domain (src/description/domain)** → Define la entidad `Description` y el contrato del repositorio.
5. **Data (src/description/data)** → Implementa el repositorio

## 📋 Funcionalidad del CRUD

- **Create:** Agregar una nueva `description`.
- **Read:** Listar todas las `description`.
- **Update:** Editar una `description` existente.
- **Delete:** Eliminar una `description`.

## 🛠️ Dependencias principales

- `flutter_riverpod` → State management
