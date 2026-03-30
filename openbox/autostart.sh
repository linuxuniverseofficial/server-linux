#!/bin/bash
# ~/.config/openbox/autostart
# Executado automaticamente pelo Openbox na inicialização da sessão
# NÃO precisa de shebang pois é sourced, mas mantemos por clareza

# ================================================================
# PAPEL DE PAREDE
# Usa feh. Instale com: sudo apt install feh
# Troque o caminho pelo seu wallpaper.
# ================================================================
# Opção 1: imagem específica
feh --bg-fill ~/Pictures/wallpaper.jpg &

# Opção 2: aleatório de uma pasta (descomente se quiser)
# feh --randomize --bg-fill ~/Pictures/Wallpapers/ &

# Opção 3: cor sólida azul XP (se não tiver imagem)
# xsetroot -solid "#3A6EA5" &

# Caso feh não esteja disponível, tenta nitrogen
# nitrogen --restore &


# ================================================================
# COMPOSITOR (sombras, transparência, sem tearing)
# Instale: sudo apt install picom
# Remove o & no final do picom se quiser modo daemon manual
# ================================================================
picom --config ~/.config/picom.conf --daemon &
# Alternativa leve sem config:
# picom -b --shadow --fading &


# ================================================================
# TINT2 - Taskbar estilo XP (inferior, menu esquerda, relógio dir)
# Instale: sudo apt install tint2
# Configuração em ~/.config/tint2/tint2rc  (gerada abaixo via script)
# ================================================================
tint2 &


# ================================================================
# ÍCONES NA ÁREA DE TRABALHO (opcional)
# ================================================================
# Opção A: conky para exibir info no desktop
# conky &

# Opção B: rox-filer como gerenciador do desktop
# rox --pinboard=Default &

# Opção C: pcmanfm gerenciando desktop
# pcmanfm --daemon-mode &


# ================================================================
# NETWORK MANAGER APPLET (ícone de rede na system tray)
# ================================================================
nm-applet &


# ================================================================
# VOLUME NA SYSTEM TRAY
# ================================================================
# Opção A: xfce4-volumed (PulseAudio)
# xfce4-volumed &

# Opção B: pasystray
pasystray &


# ================================================================
# NOTIFICAÇÕES
# ================================================================
dunst &
# Alternativa: xfce4-notifyd


# ================================================================
# XSCREENSAVER (protetor de tela / lock)
# ================================================================
xscreensaver -nosplash &


# ================================================================
# CLIPBOARD MANAGER
# ================================================================
# clipit &
# xfce4-clipman &


# ================================================================
# SINCRONIZAR TECLAS ESPECIAIS / X CONFIG
# ================================================================
# Corrige o comportamento de teclas numéricas
numlockx on &

# Velocidade do mouse (opcional, ajuste os valores)
# xset m 2 4 &


# ================================================================
# JAVA / SWING APPS (fix de foco em apps Java no Openbox)
# ================================================================
export _JAVA_AWT_WM_NONREPARENTING=1
