# Instalación de Arch Linux

Estos son mis scripts para la instalación de Arch Linux en mi computador.

## Uso

1. Realizar la partición del disco /dev/sda con cuatro particiones:
  - EFI
  - Swap
  - Root
  - Home

2. Ingresar el siguiente comando:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/yesiddev/dotfiles/main/arch-install/100-install-base.sh)"
```

Con esto estará instalado un sistema base sin WM o DE, completamente funcional.

3. Instalar el WM o DE

Para Qtile:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/yesiddev/dotfiles/main/arch-install/101-qtile.sh)"
```

Para bspwm:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/yesiddev/dotfiles/main/arch-install/101-bspwm.sh)"
```
