# Mi Portal de Streaming

Un único lugar para abrir Netflix, Disney+, HBO Max, Apple TV+, TV Azteca, Pluto TV y VIX en tu Chromebook.

---

## ✅ Estado: MILESTONE COMPLETADO (24 nov 2026)

| Hito | Estado |
|------|--------|
| Portal creado con los 7 servicios | ✅ |
| Vistas preliminares (portadas SVG + descripción) | ✅ |
| Apertura directa en la app oficial de cada servicio | ✅ |
| PWA (manifest + service worker) | ✅ |
| Publicado en GitHub Pages (HTTPS) | ✅ |
| Instalado como app en el Lanzador de ChromeOS | ✅ |
| Funciona sin depender del entorno Linux | ✅ |

**URL pública (producción):**
```
https://viraxis-consulting.github.io/streaming-portal/
```

**Repositorio:**
```
https://github.com/Viraxis-consulting/streaming-portal
```

---

## Uso

1. Abre **"Mi Portal de Streaming"** desde el Lanzador de ChromeOS (ícono ▶ morado/verde), o visita la URL pública.
2. Pasa el cursor sobre una tarjeta para ver su **vista preliminar** (portada + descripción).
3. Haz clic en un servicio, o usa las teclas `1`–`7`: se abre **directamente en su propia app/pestaña oficial**, con tu sesión ya iniciada.
4. Botón **⛶ Pantalla completa** para modo kiosco.

### ¿Por qué se abre en pestaña y no dentro del portal?

Netflix, Disney+, HBO Max y Apple TV+ **bloquean explícitamente** mostrarse dentro de un `iframe` (`X-Frame-Options` / CSP). Chrome respeta ese bloqueo por seguridad. Por eso el portal abre cada servicio en su app oficial:

- Tu sesión se usa automáticamente (no vuelves a escribir credenciales).
- La reproducción usa el reproductor y DRM oficiales del servicio.
- **El portal nunca ve, guarda ni transmite tus contraseñas.**

No existe configuración segura para incrustar estos servicios dentro del portal; cualquier "truco" implicaría desactivar protecciones del navegador y pondría en riesgo tus credenciales.

---

## Vista preliminar

Cada tarjeta muestra una **portada cinematográfica** en su parte superior. Al pasar el cursor:

- La portada se amplía suavemente.
- Aparece un botón **↗** de apertura.
- Se despliega una **descripción** del servicio.

Las portadas son **SVG generados por código**, incluidos en el propio `index.html`. No son archivos externos: no se descarga nada y no tienen problemas de derechos de autor. Para cambiarlas, edita el objeto `ART` dentro del `<script>`.

---

## Estructura del proyecto

| Archivo | Función |
|---------|---------|
| `index.html` | Portal completo (HTML, CSS, JS y portadas SVG) |
| `manifest.webmanifest` | Configuración PWA (nombre, ícono, standalone) |
| `sw.js` | Service worker (permite instalación y caché offline) |
| `streaming-portal.svg` | Ícono de la app |
| `README.md` | Documentación en GitHub |
| `LEEME.md` | Este archivo |
| `lanzar.sh` | (Legado) Lanzador del método Linux, ya no necesario |
| `streaming-portal.desktop` | (Legado) Acceso directo Linux, ya no necesario |

> Los archivos `lanzar.sh` y `streaming-portal.desktop` se conservan solo como registro histórico del método inicial. **La forma definitiva es la PWA instalada desde la URL pública.**

---

## Actualizar el portal

```bash
cd "/home/rabrahamlopez/Default Project/streaming-portal"
git add .
git commit -m "Actualizar portal"
git push
```

GitHub Pages republica automáticamente en 1–2 minutos. Si usas un token, recuerda no sharedirlo ni dejarlo en la URL del remote.

---

## Notas importantes

- El portal **no guarda contraseñas**. Cada servicio usa la sesión ya iniciada en Chrome.
- Para agregar o cambiar servicios, edita el arreglo `SERVICIOS` dentro de `index.html`. Cada entrada tiene: `key` (tecla 1–7), `name`, `cat`, `color`, `short`, `badge`, `desc`, `url` y `art`.
- El service worker solo se registra bajo HTTPS (en GitHub Pages). En `file://` se omite automáticamente.
