# PHP dockerben

konzolos PHP szkriptek futtatásához.

## TLDR;

### Futtatás konténerben

```bash
make
docker run --rm -v "$(pwd):/app" -it --entrypoint /bin/bash rcsnjszg/php-cli
```

### Build, Alias és Futtatás

```bash
docker build -t rcsnjszg/php-cli -f Dockerfile  .
alias php='docker run --rm -v "$(pwd):/app" rcsnjszg/php-cli'
php a.php
```

## Build

A `Dockerfile` fordítását a `Makefile` teszi egyszerűvé.

Megfelelő környezetben elegendő a `make` parancsot kiadni a docker image buildeléséhez.

```bash
make
```

Amennyiben nem áll rendelkezésre, úgy az alábbi sor futtatásával lehet buildelni:

```bash
docker build -t rcsnjszg/php-cli -f Dockerfile  .
```

## Futtatás

Legyen az `a.php` fájl, amit szeretnénk tesztelni. A fájl egy lehetséges tartalma:

```php
<?php
echo "Hello";
?>
```

A fájlt tesztelni az alábbi parancs kiadásával lehet:

```bash
docker run --rm -v $(pwd):/app rcsnjszg/php-cli a.php
```

A `docker run` a megadott imageből (`rcsnjszg/php-cli`) létrehoz egy konténert, majd a `Dockerfileban` megadott belépési pontotban (`ENTRYPOINT ["php"]`) meghatározott parancsot indítja el, jelen esetben a `php`-t. Ennek az első paramétere a fájl tesztelendő fájl neve (`a.php`) lesz.

 - A `--rm` miatt a docker konténer törlésre kerül a parancs lefuttatása után, mondhatni tiszavirág életű

 - A `-v` határozza meg, hogy a konténerhez melyik mappát kell felcsatolni
    - A `$(pwd)` az aktuális mappát (Path Working Directory) takarja a hoszt gépen
    - A `/app` a konténeren belüli helyet jelöli

## Alias

Ezek után célszerű lehet egy aliast létrehozni a könnyebb kezelhetőség kedvéért.
Ehhez kezdetként a projekt mappába kell navigálni, hogy az abban található fájlokat lehessen majd futtatni a `php` által.

```bash
cd projekt
```

Az alias parancs felparaméterezése:

```bash
alias php="docker run --rm -v $(pwd):/app rcsnjszg/php-cli"
```

Innentől kezdve a `php` használható lesz az adott shellben, de csak az azott mappában működik helyesen!

Például:

```bash
php a.php
```