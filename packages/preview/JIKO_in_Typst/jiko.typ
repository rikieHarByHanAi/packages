// =============================================================================
//  jiko.typ  -  Template JIKO (Jurnal Informatika dan Komputer) untuk Typst 0.15.x
//  Port dari JIKO.cls (adaptasi cup-journal). Pakai:
//      #import "jiko.typ": *
//      #show: jiko.with( ... )
// =============================================================================

// ---------- Font (urutan = prioritas; font berikutnya dipakai bila yang pertama tidak ada) ----------
#let font-serif = ("Linux Libertine", "Libertinus Serif")
#let font-sans = ("Source Sans 3", "Source Sans Pro", "Carlito", "DejaVu Sans")
#let font-mono = ("Inconsolata", "DejaVu Sans Mono")
#let font-math = ("Libertinus Math", "New Computer Modern Math")

// ---------- Warna struktur per jenis naskah (setara colorlet structure@color) ----------
#let structure-colors = (
  article: rgb(9, 70, 153),         // NavyBlue!60!black
  rescience: rgb(61, 12, 0),        // Brown!60!black
  data: rgb(57, 75, 57),            // DarkSeaGreen!40!black
  "Special Issue": rgb(92, 30, 122),// DarkOrchid!60!black
  SpecialIssue: rgb(92, 30, 122),
  editorial: rgb(153, 0, 0),        // Red!60!black
)

// ---------- Ukuran huruf LaTeX 11pt ----------
#let sz-scriptsize = 8pt
#let sz-footnotesize = 9pt
#let sz-small = 10pt
#let sz-large = 12pt
#let sz-Large = 14.4pt

#let jiko-meta = state("jiko-meta", (:))

// ---------- Aturan tabel ala booktabs ----------
#let toprule = table.hline(stroke: 0.9pt)
#let midrule = table.hline(stroke: 0.5pt)
#let bottomrule = table.hline(stroke: 0.9pt)
#let hl = table.hline(stroke: 0.5pt)
// pengganti \hline\hline: baris tipis dengan dua garis
#let hl2(cols) = table.cell(
  colspan: cols,
  inset: 0pt,
  stroke: (top: 0.5pt, bottom: 0.5pt),
  box(height: 1.6pt),
)

// ---------- Catatan tabel (threeparttable / tablenotes) ----------
// Pemakaian: tablenotes[Note][a][First Note][b][Other note]  -> pasangan (tag, isi); tag boleh [].
#let tablenotes(..items) = {
  let it = items.pos()
  set text(size: sz-scriptsize)
  set align(left)
  set par(justify: false)
  let rows = ()
  let i = 0
  while i < it.len() {
    rows.push(if it.at(i) == [] { it.at(i + 1) } else { super(it.at(i)) + it.at(i + 1) })
    i += 2
  }
  v(0.4em)
  rows.join(linebreak())
}

// ---------- Pseudocode (pengganti algorithm + algpseudocode) ----------
#let State(body) = ((lvl: 0, c: body),)
#let _indent(lines) = lines.map(l => (lvl: l.lvl + 1, c: l.c))
#let While(cond, ..body) = (
  ((lvl: 0, c: [*while* #cond *do*]),)
    + _indent(body.pos().flatten())
    + ((lvl: 0, c: [*end while*]),)
)
#let If(cond, ..body) = (
  ((lvl: 0, c: [*if* #cond *then*]),)
    + _indent(body.pos().flatten())
    + ((lvl: 0, c: [*end if*]),)
)
#let For(cond, ..body) = (
  ((lvl: 0, c: [*for* #cond *do*]),)
    + _indent(body.pos().flatten())
    + ((lvl: 0, c: [*end for*]),)
)
#let Else(..body) = (
  ((lvl: 0, c: [*else*]),) + _indent(body.pos().flatten())
)
#let algorithm(caption: none, ..lines) = {
  let ls = lines.pos().flatten()
  figure(
    kind: "algorithm",
    supplement: [Algorithm],
    caption: caption,
    placement: none,
    {
      set align(left)
      set text(size: 11pt)
      set par(justify: false)
      block(
        width: 100%,
        above: 0pt,
        below: 0pt,
        stroke: (top: 0.8pt, bottom: 0.8pt),
        inset: (y: 4pt),
        grid(
          columns: (1.6em, 1fr),
          row-gutter: 0.55em,
          ..ls
            .enumerate()
            .map(((i, l)) => (
              text(size: sz-scriptsize)[#(i + 1):],
              pad(left: 1.3em * l.lvl, l.c),
            ))
            .flatten()
        ),
      )
    },
  )
}

// ---------- Sub-gambar (pengganti \subfloat) ----------
#let subfig(width, img, caption) = box(
  width: width,
  figure(
    image(img, width: 100%),
    kind: "subfig",
    supplement: none,
    numbering: "(a)",
    caption: caption,
  ),
)

// ---------- Paragraf berjudul (pengganti \paragraph) ----------
#let paragraph(title) = context {
  let c = jiko-meta.get().at("color", default: black)
  text(fill: c, weight: "bold", title) + h(1em)
}

// ---------- Rumus bernomor tanpa tanda kurung (setara \ref pada persamaan) ----------
#let eqnum(lbl) = link(lbl, context counter(math.equation).at(lbl).first())   // \ref  -> 1
#let eqref(lbl) = link(lbl)[(#context counter(math.equation).at(lbl).first())] // \eqref -> (1)

// ---------- Kotak abstrak ----------
#let _abstract-box(title, body, kw-label, kw) = context {
  let m = jiko-meta.get()
  let c = m.at("color", default: black)
  align(center, block(
    width: 100% - 6mm,
    fill: color.mix((c, 14%), (white, 86%)),
    inset: (x: 10pt, top: 3mm, bottom: 3mm),
    {
      set align(left)
      text(font: font-sans, size: sz-small)[#title]
      v(0pt)
      set text(size: sz-small)
      par(justify: true, body)
    },
  ))
  if kw != none {
    set text(size: sz-footnotesize)
    set par(justify: false)
    par[*#kw-label:* #kw]
  }
}

#let abstracting(body) = context {
  let m = jiko-meta.get()
  _abstract-box([Abstract], body, "KeyWords", m.at("keywords-en", default: none))
}

#let abstrak(body) = context {
  let m = jiko-meta.get()
  _abstract-box([Abstrak], body, "Kata kunci", m.at("keywords", default: none))
}

// ---------- Biografi penulis ----------
#let biography(photo: none, body) = {
  v(-0.7em)
  grid(
    columns: (2.4cm, 12.7cm),
    column-gutter: 0.9em,
    align: (center + top, left + top),
    if type(photo) == str { image(photo, width: 2.5cm) } else { photo },
    {
      v(0.5em)
      set text(size: sz-small)
      par(justify: true, body)
    },
  )
  v(0.6em)
}

// =============================================================================
//  Fungsi utama template
// =============================================================================
#let jiko(
  manuscript: "article",
  layout: "publish",          // "preprint" mengaktifkan nomor baris
  year: none,
  month: none,
  volume: none,
  number: none,
  article-id: "xxx",
  doi-prefix: "10.26798/jiko.",
  first-page: 1,
  journal-name: "JIKO (JURNAL INFORMATIKA DAN KOMPUTER)",
  issn: [e-ISSN : 2477-3964 -- p-ISSN : 2477-4413],
  title: [],
  short-title: none,          // \judul
  cite-name: none,            // \refnama, mis. "F. Author"
  authors: (),                // (name:, affil: 1 atau (1,2), email: "...")
  affiliations: (),
  received: none,
  accepted: none,
  published: none,
  keywords: none,
  keywords-en: none,
  logo: "jiko-logo.png",
  crossmark: "CROSSMARK_Color.png",
  and-word: "and",
  show-dates: true,
  show-copyright: true,
  show-howtocite: true,
  body,
) = {
  let struct = structure-colors.at(manuscript, default: structure-colors.article)
  let doi-full = doi-prefix + "v" + str(volume) + "i" + str(number) + "." + article-id
  let doi-url = "http://dx.doi.org/" + doi-full
  let first-author = if authors.len() > 0 { authors.first().name } else { "" }

  jiko-meta.update((color: struct, keywords: keywords, keywords-en: keywords-en))

  // ---------------- Dokumen & halaman ----------------
  set document(title: if short-title != none { short-title } else { "" })
  set text(font: font-serif, size: 11pt, lang: "en", fill: black)
  set par(justify: true, first-line-indent: 0pt, leading: 0.6em, spacing: 13.4pt)  // parskip: 0.5\baselineskip di atas jarak baris

  set page(
    paper: "a4",
    margin: (top: 2.3cm, bottom: 1.6cm, inside: 2.3cm, outside: 2.2cm),
    binding: left,
    header-ascent: 0.8cm,
    numbering: "1",
    footer: none,
    header: context {
      let pg = counter(page).get().first()
      if here().page() == 1 { return none }
      set text(size: 11pt)
      if calc.odd(pg) {
        align(right)[#text(size: sz-footnotesize, style: "italic")[#journal-name] #h(2em) #pg]
      } else {
        align(left)[#pg #h(2em) #text(size: sz-footnotesize)[#first-author _et al._]]
      }
    },
  )
  counter(page).update(first-page)

  if layout == "preprint" {
    set par.line(numbering: "1", number-align: end)
  }

  // ---------------- Gaya heading ----------------
  set heading(numbering: (..n) => {
    let s = n.pos().map(str).join(".")
    if n.pos().len() == 1 { s + "." } else { s }
  })
  show heading: it => {
    let size = if it.level == 1 { sz-large } else { 11pt }
    let weight = if it.level <= 2 { "bold" } else { "regular" }
    let above = if it.level == 1 { 16pt } else { 15pt }
    let below = if it.level == 1 { 9.4pt } else if it.level == 2 { 4.7pt } else { 2.4pt }
    let gap = if it.level == 1 { 0.65em } else { 1em }
    block(
      above: above,
      below: below,
      sticky: true,
      width: 100%,
      {
        set text(size: size, weight: weight, fill: struct)
        set par(justify: false)
        if it.numbering != none {
          counter(heading).display(it.numbering)
          h(gap)
        }
        it.body
      },
    )
  }

  // ---------------- Tautan, sitasi, referensi ----------------
  show link: set text(fill: struct)
  show ref: set text(fill: struct)
  show cite: set text(fill: struct)

  // ---------------- Daftar ----------------
  set list(marker: ([•], [–], [∗], [·]), indent: 0pt, body-indent: 0.55em, tight: true)
  set enum(indent: 0pt, body-indent: 0.55em, tight: true)

  // ---------------- Matematika & kode ----------------
  set math.equation(numbering: "(1)")
  show math.equation: set text(font: font-math)
  set raw(theme: none)
  show raw: set text(font: font-mono, size: sz-small)

  // ---------------- Gambar, tabel, caption ----------------
  set figure(gap: 0.9em)
  set figure.caption(separator: [. ])
  show figure: set block(above: 1em, below: 1em)
  show figure.where(kind: "subfig"): set block(above: 0pt, below: 0pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: raw): set figure.caption(position: top)
  show figure.where(kind: "algorithm"): set figure.caption(position: top)
  show figure.where(kind: table): set text(font: font-sans, size: sz-small)
  set table(stroke: none, inset: (x: 6pt, y: 3.6pt), align: left)
  show table: set par(justify: false)
  show figure.caption: it => {
    set text(font: font-sans, size: sz-footnotesize)
    set par(justify: true)
    if it.kind == "subfig" {
      // sub-gambar: "(a) keterangan"
      strong(it.counter.display(it.numbering)) + [ ] + it.body
    } else if it.kind == "algorithm" {
      set text(font: font-serif, size: 11pt)
      block(
        width: 100%,
        stroke: (top: 0.8pt),
        inset: (top: 4pt, bottom: 3pt),
        strong(it.supplement + [ ] + it.counter.display(it.numbering)) + h(0.6em) + it.body,
      )
    } else {
      strong(it.supplement + [ ] + it.counter.display(it.numbering)) + it.separator + it.body
    }
  }

  // ---------------- Daftar pustaka ----------------
  set bibliography(style: "ieee")
  show bibliography: set heading(numbering: none)

  // =============== Blok judul (setara \maketitle) ===============
  v(-1.22cm)   // \vspace*{-\headsep-\headheight}
  {
    set par(justify: false, spacing: 1pt, leading: 0.5em)
    grid(
      columns: (1fr, 25mm),
      align: (left + bottom, right + bottom),
      {
        set text(size: sz-footnotesize)
        text(weight: "bold", style: "italic")[#journal-name]
        linebreak()
        [#month #year, Volume: #strong[#volume], No. #strong[#number] | Pages
          #context counter(page).get().first()--#context counter(page).final().first()]
        linebreak()
        [doi: #link(doi-url)[#doi-full]]
        linebreak()
        issn
      },
      image(logo, width: 25mm),
    )
    align(right, link(
      "https://crossmark.crossref.org/dialog/?doi=" + doi-full + "&domain=pdf",
      image(crossmark, width: 25mm),
    ))
    v(0.9em)

    text(font: font-sans, weight: "bold", fill: struct)[#upper(manuscript.replace("-", " "))]
    v(1em)

    // judul
    {
      set text(font: font-sans, weight: "bold", size: sz-Large, fill: struct)
      set par(justify: false)
      align(left, title)
    }
    v(1em)

    // penulis
    let multi = affiliations.len() > 1
    let n = authors.len()
    {
      set text(size: 11pt)
      for (i, a) in authors.enumerate() {
        let marks = ()
        if a.at("email", default: none) != none { marks.push("*") }
        if multi {
          let af = a.at("affil", default: 1)
          let af = if type(af) == array { af } else { (af,) }
          marks += af.map(str)
        }
        if i > 0 and i == n - 1 and n > 1 { [ #and-word] }
        [ #a.name]
        if n > 2 and i < n - 1 { [,] }
        if marks.len() > 0 { super(marks.join(",")) }
      }
    }
    v(0.7em)

    // afiliasi
    {
      set text(size: sz-footnotesize)
      for (i, af) in affiliations.enumerate() {
        if multi { super(str(i + 1)) + [ ] }
        af
        linebreak()
      }
    }
    v(0.2em)

    // korespondensi
    let emails = authors.filter(a => a.at("email", default: none) != none)
    if emails.len() > 0 {
      set text(size: sz-footnotesize)
      [\*Correspondence Author: #emails.map(a => link("mailto:" + a.email, a.email)).join("; ")]
      v(1em)
    }

    // tanggal
    if show-dates and received != none {
      set text(size: sz-footnotesize)
      [(Submitted #received\; Accepted #accepted\; Published on #published)]
      v(0.5em)
    }
  }

  // catatan kaki halaman pertama (copyright & how to cite)
  place(
    bottom + left,
    float: true,
    clearance: 0.8em,
    {
      set par(justify: true, leading: 0.5em)
      set text(size: sz-scriptsize)
      line(length: 40%, stroke: 0.4pt)
      v(0.2em)
      if show-copyright [
        This is an Open Access article - copyright on authors, distributed under the terms of the
        Creative Commons Attribution-ShareAlike 4.0 International License (CC BY SA)
        (#link("http://creativecommons.org/licenses/by-sa/4.0/")).
        #parbreak()
      ]
      if show-howtocite [
        *How to Cite:* #cite-name _et al._, "#short-title", #emph(journal-name),
        Volume: #strong[#volume], No. #strong[#number], Pages
        #context counter(page).get().first()--#context counter(page).final().first(),
        #month #year, doi: #link(doi-url)[#doi-full].
      ]
    },
  )

  body
}


// =============================================================================
//  paper: membaca paper.toml lalu menyusun seluruh naskah.
//  Pemakaian di main.typ:   #import "jiko.typ": *   lalu   #show: paper
// =============================================================================
#let paper(body) = {
  let p = toml("paper.toml")
  let md(s) = eval(s.trim(), mode: "markup")
  let j = p.journal
  let d = p.at("dates", default: (:))

  jiko(
    manuscript: j.at("manuscript", default: "article"),
    layout: j.at("layout", default: "publish"),
    year: j.year,
    month: j.month,
    volume: j.volume,
    number: j.number,
    article-id: j.at("article_id", default: "xxx"),
    first-page: j.at("first_page", default: 1),
    logo: j.at("logo", default: "jiko-logo.png"),
    crossmark: j.at("crossmark", default: "CROSSMARK_Color.png"),
    title: [
      #text(style: "italic")[#p.title]
      #if p.at("subtitle", default: none) != none [ \ #text(style: "italic", size: 12pt)[#p.subtitle]]
    ],
    short-title: p.short_title,
    cite-name: p.cite_name,
    affiliations: p.affiliations,
    authors: p.authors,
    received: d.at("received", default: none),
    accepted: d.at("accepted", default: none),
    published: d.at("published", default: none),
    keywords-en: if "keywords_en" in p { md(p.keywords_en) } else { none },
    keywords: if "keywords_id" in p { md(p.keywords_id) } else { none },
    {
      if "abstract" in p { abstracting(md(p.abstract)) }
      if "abstract_id" in p { abstrak(md(p.abstract_id)) }
      body
      if "biography" in p {
        pagebreak()
        heading(numbering: none)[BIOGRAPHIES OF AUTHORS]
        for b in p.biography {
          biography(photo: b.photo)[*#b.name* #md(b.text)]
        }
      }
    },
  )
}
