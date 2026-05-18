# CV

This is the LaTeX source for my CV.

The canonical repository lives on [Codeberg](https://codeberg.org/plethu/cv).
[GitHub](https://github.com/plethu/cv) is available as a read-only mirror.

## Download

The latest compiled PDF is available on the [Codeberg releases page](https://codeberg.org/plethu/cv/releases/tag/latest).

## Build

The build expects a TeX Live installation with `latexmk` and LuaLaTeX. Fonts are
vendored under `fonts/` using their OFL licences, so the PDF does not depend on
whatever desktop fonts happen to be installed locally.

```sh
make
```

The compiled PDF is built to `dist/allie-mari-jones-cv.pdf`.

Useful targets:

- `make pdf` builds the PDF.
- `make watch` rebuilds continuously while editing.
- `make clean` removes generated LaTeX output.
