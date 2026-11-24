# Mi Portal de Streaming

Un único lugar para abrir Netflix, Disney+, HBO Max, Apple TV+, TV Azteca, Pluto TV y VIX en tu Chromebook.

## Cómo usarlo

1. Abre `index.html` en Chrome (doble clic desde el administrador de archivos, o arrástralo a una pestaña).
2. Haz clic en el servicio que quieras, o usa las teclas `1` a `7`: se abre **directamente en su propia app/pestaña oficial**, con tu sesión ya iniciada.
3. Pasa el cursor sobre una tarjeta para ver su **vista preliminar** (portada + descripción).
4. Usa el botón **⛶ Pantalla completa** para que ocupe toda la pantalla.

### ¿Por qué se abre en pestaña y no dentro del portal?

Netflix, Disney+, HBO Max y Apple TV+ **bloquean explícitamente** mostrarse dentro de un `iframe` (`X-Frame-Options` / CSP). Chrome respeta ese bloqueo por seguridad. Por eso el portal abre cada servicio en su app oficial: tu sesión se usa automáticamente (no vuelves a escribir credenciales), la reproducción usa el reproductor y DRM oficiales, y **el portal nunca ve, guarda ni transmite tus contraseñas**.

No existe configuración segura para incrustar estos servicios dentro del portal; cualquier "truco" implicaría desactivar protecciones del navegador y pondría en riesgo tus credenciales.

## Instalarlo como app en Chromebook (FORMA DEFINITIVA)

Chrome **no permite** "Instalar página como app" con archivos `file://` (solo con URLs https). Por eso la forma correcta de que el portal **no dependa de Linux** es publicarlo en **GitHub Pages** e instalarlo desde su URL pública.

**URL del portal:**
```
https://viraxis-consulting.github.io/streaming-portal/
```

### Instalación (sin Linux)

1. Abre esa URL en el **Chrome normal de ChromeOS**.
2. Menú ⋮ → **Guardar y compartir → Instalar página como app** (o ícono ⊕ en la barra de direcciones).
3. Se instalará como **"Mi Portal de Streaming"** con su ícono en el Lanzador.

A partir de ahí funciona aunque el contenedor Linux esté apagado.

### Método antiguo (requiere Linux, ya no recomendado)

Se creó un acceso directo `.desktop` que abre el portal en una ventana propia, sin pestañas ni bordes de navegador. Solo sirve dentro del entorno Linux.

El portal quedó instalado en:
```
~/.local/share/applications/streaming-portal.desktop   <- acceso directo
~/.local/share/icons/streaming-portal.svg             <- ícono
```
Y dentro de la carpeta del proyecto:
```
lanzar.sh                 <- script que detecta Chrome/Chromium y abre en modo app
streaming-portal.desktop  <- copia de respaldo del acceso directo
streaming-portal.svg      <- copia del ícono
```

### Para usarlo

1. Presiona la tecla del **Lanzador** (la del círculo con puntos) y busca **"Mi Portal de Streaming"**.
2. Haz clic en el ícono ▶ morado/verde.
3. Se abrirá una ventana limpia del portal (modo app), sin barra de direcciones.

### Si no aparece en el Lanzador

ChromeOS sometimes necesita reiniciarse para detectar nuevos `.desktop`. Si no aparece:

- Cierra sesión y vuelve a entrar, o reinicia el Chromebook.
- Verifica que el archivo exista: `~/.local/share/applications/streaming-portal.desktop`

### Alternativa rápida (sin Lanzador)

Abre el administrador de archivos, entra a esta carpeta y haz doble clic en **`streaming-portal.desktop`**. O abre `index.html` directamente y usa menú ⋮ → **Más herramientas → Fijar pestaña** para tenerlo siempre a la izquierda.

### Cambiar la ruta del portal

Si mueves la carpeta, edita las tres rutas dentro de `Exec=` en el archivo `.desktop` (también está el original en esta carpeta para respaldo).

## Vista preliminar

Cada tarjeta muestra una **portada cinematográfica** en su parte superior. Al pasar el cursor:

- La portada se amplía suavemente.
- Aparece un botón **▶** de reproducción.
- Se despliega una **descripción** del servicio (categoría, tipo de contenido, etc.).

Las portadas son **SVG generados por código**, incluidos en el propio `index.html`. No son archivos externos: no se descarga nada, no dependen de internet y no tienen problemas de derechos de autor. Si quieres cambiarlas, edita el objeto `ART` dentro del `<script>`.

## Notas importantes

- El portal **no guarda contraseñas**. Cada servicio usa la sesión que ya tengas iniciada en Chrome.
- Algunos servicios (Netflix, Disney+, HBO, Apple TV) **bloquean mostrarse dentro de un iframe** por seguridad. Cuando eso pasa, el portal detecta el bloqueo y **abre el servicio automáticamente en una pestaña nueva**, para que nunca te quedes en blanco. Si prefieres que siempre se abra en pestaña, usa el botón **↗ Abrir en pestaña**.
- Pluto TV, VIX y TV Azteca suelen funcionar mejor dentro del recuadro.
- Para cambiar o agregar servicios, edita el arreglo `SERVICIOS` dentro de `index.html` (línea ~228).

## Personalizar

En `index.html`, dentro del arreglo `SERVICIOS`, cada servicio tiene:
- `key`: tecla de acceso rápido
- `name`, `cat`: textos que se muestran
- `color`: color de la tarjeta
- `short`: siglas del ícono
- `url`: dirección del servicio
