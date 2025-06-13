
# Optimización completa Fedora KDE Plasma para gaming y productividad

Este proyecto automatiza la configuración de un sistema Fedora 42 KDE Plasma con enfoque en rendimiento, juegos y productividad.

---

## Sistema base

- Fedora 42 KDE Plasma (Wayland)
- Kernel 6.14.x
- CPU Intel i7-14700F
- GPU AMD Radeon RX 6600 XT (driver amdgpu y Vulkan RADV)
- 32 GB RAM DDR4
- Monitor 3440x1440 @120Hz

---

## Objetivos

- Maximizar rendimiento en juegos y aplicaciones pesadas
- Mejorar gestión de memoria y tiempos de respuesta
- Instalar software clave y optimizado para multimedia y comunicación
- Limpiar software innecesario y optimizar servicios de fondo
- Ajustar entorno KDE y Wayland para mejor experiencia visual y estabilidad

---

## Pasos realizados por el script

### Repositorios y Flatpak

- Añade Flathub para instalar apps Flatpak
- Actualiza todo el sistema con DNF

### Drivers y rendimiento gráfico

- Instala drivers Vulkan y Mesa optimizados
- Activa GameMode para mejorar rendimiento en juegos
- Activa MangoHUD para monitoreo FPS y recursos

### Gestión de memoria y kernel

- Activa ZRAM con compresión zstd para mejorar swap
- Desactiva NetworkManager-wait-online para arranque más rápido
- Ajusta parámetros de sysctl para mejor rendimiento general

### Software esencial instalado (vía DNF y Flatpak)

- Steam, OBS Studio, Discord, WhatsApp Desktop (Flatpak)
- Neofetch, Htop, Gnome Disk Utility, lm_sensors, TLP (gestión energía)
- DNF plugins y herramientas para gestión de paquetes

### Limpieza y mantenimiento

- Ejecuta limpieza automática de paquetes y cache
- Actualiza y sincroniza repositorios

---

## Uso del script

```bash
chmod +x fedora-optimizacion-super.sh
./fedora-optimizacion-super.sh
```

Reiniciar al final para aplicar todos los cambios.

---

## Personalización extra

El script también configura algunas opciones recomendadas para KDE Plasma en Wayland:

- Activación de efectos visuales optimizados
- Configuración de atajos de teclado para productividad
- Ajustes para monitor ultrawide 3440x1440 a 120 Hz

---

## Resultados esperados

- Mejor rendimiento gráfico y estabilidad en juegos
- Menor consumo de memoria y mejor gestión de swap
- Sistema más rápido en arranque y ejecución
- Software multimedia y de comunicación siempre actualizado y funcional
- Experiencia fluida en KDE Plasma Wayland

---

# ¡Disfruta tu Fedora optimizado!
