================================================================================
  SETUP OPENBOX ESTILO WINDOWS XP
  Gepeto Edition
================================================================================

ESTRUTURA DE ARQUIVOS
─────────────────────
Copie os arquivos para os seguintes destinos:

  rc.xml      → ~/.config/openbox/rc.xml
  menu.xml    → ~/.config/openbox/menu.xml
  autostart   → ~/.config/openbox/autostart
  tint2rc     → ~/.config/tint2/tint2rc
  picom.conf  → ~/.config/picom.conf

Crie os diretórios se não existirem:
  mkdir -p ~/.config/openbox ~/.config/tint2


DEPENDÊNCIAS
────────────
Essenciais:
  sudo apt install openbox tint2 feh picom

Recomendados:
  sudo apt install xterm thunar lxappearance arandr \
                   nm-applet pasystray dunst numlockx \
                   scrot xscreensaver gmrun

Opcional (fontes Tahoma-like):
  sudo apt install ttf-mscorefonts-installer
  # ou: sudo apt install fonts-wine   (inclui Tahoma)


BOTÃO "INICIAR" NA TASKBAR
──────────────────────────
O tint2 usa um arquivo .desktop como launcher.
Crie o arquivo abaixo:

  mkdir -p ~/.local/share/applications
  
  Conteúdo de ~/.local/share/applications/openbox-start.desktop:
  ┌──────────────────────────────────────────────────────────────┐
  │ [Desktop Entry]                                              │
  │ Name=Iniciar                                                 │
  │ Comment=Menu Iniciar                                         │
  │ Exec=openbox --reconfigure                                   │
  │ Icon=start-here                                              │
  │ Type=Application                                             │
  │ Categories=System;                                           │
  │ NoDisplay=false                                              │
  └──────────────────────────────────────────────────────────────┘

  O ícone "start-here" existe na maioria dos temas GTK/icon.
  Alternativas: "distributor-logo", "emblem-system", "go-home"

  IMPORTANTE: Clique no ícone "Iniciar" no tint2 NÃO abre o menu
  automaticamente por limitação do tint2 (launchers executam
  comandos, não ShowMenu do Openbox).

  SOLUÇÃO: Use um script como launcher:
  ─────────────────────────────────────
  Crie ~/.local/bin/openbox-menu-trigger:

    #!/bin/bash
    # Simula clique no canto inferior esquerdo para acionar o menu
    # Requer: xdotool  (sudo apt install xdotool)
    xdotool key super

  Exec= no .desktop aponta para esse script.
  Ou simplesmente use a tecla Super (Win) diretamente — já
  está configurada no rc.xml para abrir o menu.


PAPEL DE PAREDE
───────────────
  # Wallpaper estático:
  feh --bg-fill ~/Pictures/wallpaper.jpg

  # Wallpaper aleatório de uma pasta:
  feh --randomize --bg-fill ~/Pictures/Wallpapers/

  # Cor sólida azul XP (sem imagem):
  xsetroot -solid "#3A6EA5"

  O autostart já inclui o feh — edite o caminho conforme necessário.


RELÓGIO
───────
  O tint2rc já inclui relógio digital no canto inferior direito:
    - Linha 1: HH:MM  (fonte maior)
    - Linha 2: DD/MM/YYYY  (fonte menor)
    - Tooltip: dia da semana por extenso
    - Clique esquerdo: tenta abrir calendário (orage, gnome-calendar, etc.)


MENU INICIAR (acesso)
─────────────────────
  3 formas de abrir:
    1. Tecla Super (Win)       ← configurado no rc.xml
    2. Alt+F2 → gmrun          ← para executar programas
    3. Ícone na taskbar tint2  ← via launcher .desktop


APLICAR CONFIGURAÇÕES
─────────────────────
  # Reconfigura Openbox sem sair:
  openbox --reconfigure

  # Reinicia tint2:
  pkill tint2 && tint2 &

  # Reinicia picom:
  pkill picom && picom --config ~/.config/picom.conf --daemon &

  # Define wallpaper:
  feh --bg-fill ~/Pictures/wallpaper.jpg


TEMA VISUAL ESTILO XP
─────────────────────
  Para o visual mais próximo do XP:
  
  1. Tema GTK: "Redmond XP" ou "Luna"
     - Baixe de: https://www.gnome-look.org
     - Instale em ~/.themes/
     - Aplique via lxappearance

  2. Ícones: "Windows XP" icon pack
     - Instale em ~/.icons/

  3. Cursor: "DMZ-White" ou "Vanilla DMZ"
     sudo apt install dmz-cursor-theme

  4. Fonte: Tahoma (incluída nos pacotes acima)
     Fallback configurado no rc.xml: Sans

================================================================================
