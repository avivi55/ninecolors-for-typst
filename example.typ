#import "lib.typ": palette


#set page(paper: "a4", margin: 1.5cm)
#set par(justify: true)
#set text(size: 10.5pt, font: "Museo Sans")

#let families = (
	"gray",
	"red",
	"brown",
	"yellow",
	"olive",
	"green",
	"teal",
	"cyan",
	"azure",
	"blue",
	"violet",
	"magenta",
	"purple",
)

#let chromatic-families = families.slice(1)

#let shade-label-color(level) = if level < 5 { white } else { black }

#let swatch(label, fill-color, fg-color: black, width: 100%/13, height: 1.5em) = {
	box(
		fill: fill-color,
		inset: (x: 4pt, y: 2pt),
		width: width,
		height: height,

		align(center+horizon,(text(size: 8pt, fill: fg-color, weight: "bold")[#label])),
	)
}

#let test-back(palette) = {
	for level in range(1, 10) {
		for family in families {
			let name = family + str(level)
			swatch(name, palette.at(name), fg-color: shade-label-color(level))
		}
		linebreak()
    v(-1em)
	}
}

#let test-fore(palette) = {
	for level in range(1, 10) {
		for family in families {
			let name = family + str(level)
			let bg = if level < 5 { palette.gray9 } else { black }
			swatch(name, bg, fg-color: palette.at(name))
		}
		linebreak()
    v(-1em)
	}
}

#let contrast-line(bg, fg) = {
	box(
		width: 100%,
		fill: bg,
		inset: 5pt,
		text(fill: fg)[
			The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.
		],
	)
}

#let test-contrast(palette) = {
	contrast-line(palette.blue9, palette.green3) 
	v(-1em)
	contrast-line(palette.green3, palette.blue9)
	v(-1em)
	contrast-line(palette.violet9, palette.brown3)
	v(-1em)
	contrast-line(palette.brown3, palette.violet9)
}

#let saturation-row(label, palette) = {
	swatch(label, white, width: 100%/14, height: 100%/20)
	h(4pt)
	for family in chromatic-families {
		swatch("TEST", palette.at(family + "5"), width: 100%/14, height: 100%/20)
	}
	linebreak()
	v(-1em)
}

#let test-all-saturations() = {
	saturation-row("high", palette.high)
	saturation-row("medium", palette.medium)
	saturation-row("low", palette.low)
}

#let test-draw(palette) = {
	for level in range(1, 10) {
		let mirror = 10 - level
		for family in families {
			let fill-name = family + str(level)
			let stroke-name = family + str(mirror)
			circle(
				radius: 8pt,
				fill: palette.at(fill-name),
				stroke: 1.4pt + palette.at(stroke-name),
			)
			h(0.85em)
		}
		linebreak()
		v(0.3em)
	}
}

#align(center)[
	#text(size: 18pt, fill: palette.medium.blue3)[
		Ninecolors: Select Colors with Proper WCAG Color Contrast
	]
  
	#text(size: 10pt)[
		originally by\ Jianrui Lyu (tolvjr\@163.com)\
    Nan Geng (nangeng\@nwafu.edu.cn)\
    ported to Typst by\ Jacques Soghomonyan (jsoghomonyan164\@gmail.com)
	]
]

#v(1.2em)

== Colors with Medium Saturation

#text(fill: palette.medium.red4)[Ninecolors] carefully selects and defines 9 colors for 13 hues each.
All colors with the same suffix number have equal luminance level.
Also color black is of level 0, and color white is of level 10.

#v(0.8em)
#test-back(palette.medium)
#v(0.8em)
#test-fore(palette.medium)

By simply choosing two colors in the above list, which differ in level by at least 5,
as foreground and background colors, you will get proper
#link("https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html")[WCAG Color Contrast].

#test-contrast(palette.medium)

If you need to select more contrasting foreground and background colors, which may have other hues,
you could visit the
#link("https://lvjr.bitbucket.io/contrast.html")[WCAG Color Contrast Tool]
designed by the first author.

#pagebreak()

== Colors with Low Saturation

You can compare saturation choices across the same hue and level.

#v(0.7em)
#test-all-saturations()

#v(0.7em)
Below, the color samples use the low-saturation palette.

#v(0.7em)
#text(fill: palette.low.red4)[Ninecolors] carefully selects and defines 9 colors for 13 hues each.
All colors with the same suffix number have equal luminance level.
Also color black is of level 0, and color white is of level 10.

#v(0.8em)
#test-back(palette.low)

#v(0.6em)
#test-fore(palette.low)

#v(0.8em)
By simply choosing two colors in the above list, which differ in level by at least 5,
as foreground and background colors, you will get proper
#link("https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html")[WCAG Color Contrast].

#v(0.8em)
#test-contrast(palette.low)

#v(0.8em)
If you need to select more contrasting foreground and background colors, which may have other hues,
you could visit the
#link("https://lvjr.bitbucket.io/contrast.html")[WCAG Color Contrast Tool]
designed by the first author.

#pagebreak()

== Colors with High Saturation

You can compare saturation choices across the same hue and level.

#v(0.7em)
#test-all-saturations()

#v(0.7em)
Below, the color samples use the high-saturation palette.

#v(0.7em)
#text(fill: palette.high.red4)[Ninecolors] carefully selects and defines 9 colors for 13 hues each.
All colors with the same suffix number have equal luminance level.
Also color black is of level 0, and color white is of level 10.

#v(0.8em)
#test-back(palette.high)

#v(0.6em)
#test-fore(palette.high)

#v(0.8em)
By simply choosing two colors in the above list, which differ in level by at least 5,
as foreground and background colors, you will get proper
#link("https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html")[WCAG Color Contrast].

#v(0.8em)
#test-contrast(palette.high)

#v(0.8em)
If you need to select more contrasting foreground and background colors, which may have other hues,
you could visit the
#link("https://lvjr.bitbucket.io/contrast.html")[WCAG Color Contrast Tool]
designed by the first author.
