# Mi Portal de Streaming

[![GitHub Pages](https://img.shields.io/badge/Deployed-GitHub%20Pages-blue)](https://viraxis-consulting.github.io/streaming-portal/)
[![Status](https://img.shields.io/badge/Status-Completed-brightgreen)](https://github.com/Viraxis-consulting/streaming-portal)

Un único lugar para abrir **Netflix, Disney+, HBO Max, Apple TV+, TV Azteca, Pluto TV y VIX** en tu Chromebook.

**URL pública:** https://viraxis-consulting.github.io/streaming-portal/

## ✅ Milestone completado (24 nov 2026)

- [x] Portal con los 7 servicios
- [x] Vistas preliminares (portadas SVG + descripción)
- [x] Apertura directa en la app oficial de cada servicio
- [x] PWA (manifest + service worker)
- [x] Publicado en GitHub Pages (HTTPS)
- [x] Instalado como app en el Lanzador de ChromeOS
- [x] Independiente del entorno Linux

## Instalar como aplicación (ChromeOS / Chromebook)

1. Abre la URL pública en Chrome.
2. Menú ⋮ → **Guardar y compartir → Instalar página como app** (o el ícono ⊕ en la barra de direcciones).
3. Aparecerá **"Mi Portal de Streaming"** en el Lanzador, con su ícono ▶.

La app funciona **sin depender del entorno Linux** y se abre en ventana propia.

## Uso

- Haz clic en una tarjeta: el servicio se abre **directamente en su propia app/pestaña oficial**, con tu sesión ya iniciada.
- Pasa el cursor para ver la **vista preliminar** (portada + descripción).
- Teclas `1`–`7`: abrir servicio al instante.
- Botón **⛶ Pantalla completa** para modo kiosco.

## Seguridad y privacidad

- El portal **no guarda contraseñas**; usa la sesión ya iniciada en Chrome.
- Los servicios que bloquean `iframe` (Netflix, Disney+, HBO, Apple TV) se abren en su app oficial con su reproductor y DRM propios.
- El service worker solo se registra bajo HTTPS; las credenciales nunca pasan por el portal.

## Estructura

| Archivo | Función |
|---------|---------|
| `index.html` | Portal completo (HTML, CSS, JS y portadas SVG) |
| `manifest.webmanifest` | Configuración PWA |
| `sw.js` | Service worker |
| `streaming-portal.svg` | Ícono de la app |
| `LEEME.md` | Documentación detallada del milestone |

## Publicar / actualizar

```bash
git add .
git commit -m "Actualizar portal"
git push
```

GitHub Pages publica automáticamente desde la rama `main` (carpeta raíz) en 1–2 minutos.
