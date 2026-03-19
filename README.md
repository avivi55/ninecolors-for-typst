# Ninecolors for Typst

A port of the [Ninecolors LaTeX package](https://github.com/lvjr/ninecolors) to [Typst](https://typst.app/), providing color palettes with proper WCAG color contrast.

## Usage

```typst
#import "lib.typ": palette-low, palette-medium, palette-high

#let my-color = palette-medium.at("blue7", default: black)
```

## License

This port is released under the Unlicense (public domain), while the original LaTeX package is licensed under the [LaTeX Project Public License 1.3](https://www.latex-project.org/lppl.txt).

## Original Work

- **Authors**: Jianrui Lyu and Nan Geng
- **Repository**: https://github.com/lvjr/ninecolors
- **License**: The LaTeX Project Public License 1.3
