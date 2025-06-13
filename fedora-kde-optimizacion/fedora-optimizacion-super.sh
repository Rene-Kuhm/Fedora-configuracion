#!/bin/bash
set -e

echo "🚀 Iniciando optimización completa de Fedora KDE Plasma..."

# 1. Configurar Flathub
echo "📦 Añadiendo repositorio Flathub si no existe..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 2. Actualizar sistema
echo "⬆️ Actualizando sistema con DNF..."
sudo dnf upgrade --refresh -y

# 3. Instalar drivers y herramientas clave
echo "🛠 Instalando drivers, Vulkan, herramientas y utilidades..."
sudo dnf install -y \
    gamemode mangohud \
    vulkan-tools mesa-demos mesa-vulkan-drivers \
    tlp tlp-rdw lm_sensors \
    dnf-automatic dnf-plugins-core dnf-fastestmirror \
    gnome-disk-utility neofetch htop \
    kernel-devel kernel-headers \
    steam obs-studio discord

# 4. Instalar apps via Flatpak
echo "📲 Instalando apps Flatpak esenciales (Steam, Discord, OBS, WhatsApp)..."
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub io.github.mimbrero.WhatsAppDesktop

# 5. Activar y configurar GameMode
echo "🎮 Activando GameMode para juegos..."
systemctl --user enable --now gamemoded.service || true

# 6. Activar MangoHUD (solo instalacion, usar 'mangohud <app>' para ejecutar)
echo "📊 MangoHUD instalado, úsalo para monitorear FPS y recursos."

# 7. Activar ZRAM para mejorar swap y rendimiento de memoria
echo "🧠 Activando ZRAM con compresión zstd..."
if ! grep -q "zram" /proc/swaps; then
    sudo bash -c 'cat > /etc/systemd/zram-generator.conf <<EOF
[zram0]
zram-size = ram
compression-algorithm = zstd
EOF'
    sudo systemctl daemon-reexec
    sudo systemctl restart systemd-zram-setup@zram0.service
fi

# 8. Desactivar NetworkManager-wait-online para acelerar inicio
echo "🚀 Desactivando NetworkManager-wait-online.service para arranque rápido..."
sudo systemctl disable NetworkManager-wait-online.service || true

# 9. Optimizar parámetros sysctl para gaming y rendimiento general
echo "⚙️ Aplicando parámetros sysctl para rendimiento..."

sudo bash -c 'cat >> /etc/sysctl.d/99-performance.conf <<EOF
vm.swappiness=10
vm.vfs_cache_pressure=50
fs.inotify.max_user_watches=524288
net.core.somaxconn=1024
net.ipv4.tcp_fin_timeout=15
EOF'

sudo sysctl --system

# 10. Configurar TLP para ahorro de energía en laptops (opcional)
echo "⚡ Activando y configurando TLP para gestión energía..."
sudo systemctl enable --now tlp.service

# 11. Limpieza y autoremove
echo "🧹 Limpiando paquetes y cache..."
sudo dnf autoremove -y
sudo dnf clean all

# 12. Opciones extra para KDE Plasma en Wayland
echo "✨ Configurando opciones recomendadas para KDE Plasma (Wayland)..."
kwriteconfig5 --file kwinrc --group Compositing --key ScaleMethod "Smooth"
kwriteconfig5 --file kwinrc --group Compositing --key AnimationSpeed 0.5
kwriteconfig5 --file kwinrc --group Wayland --key EnableSmoothEdges true
kwriteconfig5 --file kwinrc --group Wayland --key EnableHighDpi true

echo "✅ Optimización completada. Por favor reinicia el sistema para aplicar todos los cambios."
