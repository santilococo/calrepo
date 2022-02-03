# calrepo

Personal Arch Linux package repository.

## Table of contents
  - [Usage <a name="usage"></a>](#usage-)
  - [Contributing <a name="contributing"></a>](#contributing-)
  - [License <a name="license"></a>](#license-)

## Usage <a name="usage"></a>

First, you need to locally sign my PGP key:

```
sudo pacman-key --lsign-key 199980CE93F18E62
```

Then, add

```bash
[calrepo]
SigLevel = Required DatabaseOptional
Server = https://slococo.com.ar/$repo/$arch
```

to the end of `/etc/pacman.conf`.

Finally, you must sync the repositories:

```
sudo pacman -Sy
```

Now you can install any of the packages from the `calrepo` repo.

## Contributing <a name="contributing"></a>
PRs are welcome.

## License <a name="license"></a>
[MIT](https://raw.githubusercontent.com/santilococo/calrepo/master/LICENSE.md)
