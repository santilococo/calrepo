# calrepo

Personal Arch Linux package repository.

## Table of contents
  - [Usage <a name="usage"></a>](#usage-)
  - [Contributing <a name="contributing"></a>](#contributing-)
  - [License <a name="license"></a>](#license-)

## Usage <a name="usage"></a>

First, you need to locally sign my PGP key:

```bash
sudo pacman-key --add public.key
sudo pacman-key --lsign-key 199980CE93F18E62
```

Then, you need to add

```bash
[calrepo]
SigLevel = Required DatabaseOptional
Server = https://slococo.com.ar/$repo/$arch
```

to the end of `/etc/pacman.conf`.

Now, you must sync the repositories:

```
sudo pacman -Sy
```

Finally, to install, for example `zaread-git`:

```bash
sudo pacman -S zaread-git
```

or

```bash
sudo pacman -S calread/zaread-git
```

## Contributing <a name="contributing"></a>
PRs are welcome.

## License <a name="license"></a>
[MIT](https://raw.githubusercontent.com/santilococo/calrepo/master/LICENSE.md)
