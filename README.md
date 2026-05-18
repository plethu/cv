canonical repo for this project is available on [codeberg](https://codeberg.org/plethu/cv). [github](https://github.com/plethu/cv) is available as a read-only mirror.

# CV

LaTeX source for Allie Mari Jones' CV.

## Build

Requires a TeX Live installation with `latexmk` and LuaLaTeX. The CV vendors its
OFL-licensed fonts under `fonts/` so builds do not depend on locally installed
desktop fonts.

```sh
make
```

The compiled PDF is written to `dist/allie-mari-jones-cv.pdf`.

Useful targets:

- `make pdf` builds the PDF.
- `make watch` rebuilds continuously while editing.
- `make clean` removes generated LaTeX output.
