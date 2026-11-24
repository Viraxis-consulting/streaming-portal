# Mi Portal de Streaming

Un único lugar para abrir **Netflix, Disney+, HBO Max, Apple TV+, TV Azteca, Pluto TV y VIX** en tu Chromebook.

**URL pública:** https://viraxis-consulting.github.io/streaming-portal/

## Instalar como aplicación (ChromeOS / Chromebook)

1. Abre la URL pública en Chrome.
2. Menú ⋮ → **Guardar y compartir → Instalar página como app** (o el ícono ⊕ en la barra de direcciones).
3. Aparecerá **"Mi Portal de Streaming"** en el Lanzador, con su ícono ▶.

La app funciona **sin depender del entorno Linux** y puede abrirse en ventana propia.

## Uso

- Haz clic en una tarjeta: el servicio se abre **directamente en su propia app/pestaña oficial**, con tu sesión ya iniciada.
- Pasa el cursor para ver la **vista preliminar** (portada + descripción).
- Teclas `1`–`7`: abrir servicio al instante.
- Botón **⛶ Pantalla completa** para modo kiosco.

## Cómo funciona

- Es una **PWA**: incluye `manifest.webmanifest` y `sw.js` (service worker).
- El portal **no guarda contraseñas**; usa la sesión ya iniciada en Chrome.
- Algunos servicios bloquean mostrarse en `iframe` (X-Frame-Options). El portal lo detecta y abre el servicio en pestaña nueva automáticamente. También hay un botón **↗ Abrir en pestaña**.

## Publicar / actualizar

```bash
git add .
git commit -m "Actualizar portal"
git push
```

GitHub Pages publica automáticamente desde la rama `main` (carpeta raíz).
