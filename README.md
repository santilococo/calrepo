# calrepo

Personal Arch Linux package repository.

## Table of contents
  - [Usage <a name="usage"></a>](#usage-)
  - [Contributing <a name="contributing"></a>](#contributing-)
  - [License <a name="license"></a>](#license-)

## Usage <a name="usage"></a>

First, you need to add

```bash
[calrepo]
SigLevel = Required DatabaseOptional
Server = https://slococo.com.ar/$repo/$arch
```

to the end of `/etc/pacman.conf`.

Then, you must sync the repositories:

```
sudo pacman -Sy
```

Now, to install, for example `zaread-git`:

```bash
sudo pacman -S zaread-git
```

or

```bash
sudo pacman -S calread/zaread-git
```

Finally, `pacman` will ask you if you want to import my PGP key:

```bash
:: Import PGP key 199980CE93F18E62, "Santiago Lo Coco <santilococo.01 at gmail dot com>"? [Y/n]
```

So accept it by typing a `Y`.

## Contributing <a name="contributing"></a>
PRs are welcome.

## License <a name="license"></a>
[MIT](https://raw.githubusercontent.com/santilococo/calrepo/master/LICENSE.md)
