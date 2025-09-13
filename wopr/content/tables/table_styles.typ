// --- Style helpers ---
#import "@preview/booktabs:0.0.4": toprule, midrule, bottomrule, cmidrule

// Quadrant palette (your current colors)
#let qcol = (
  I: rgb(0, 114, 178),
  II: rgb(230, 159, 0),
  III: rgb(0, 158, 115),
  IV: rgb(204, 121, 167),
)

// Compact "badge" for Quadrant letters (much shorter than your boxes)
#let qtag(q) = box(
  fill: qcol.at(q).lighten(72%),
  radius: 1.5pt,
  stroke: none,
  inset: (x: 3pt, y: 0.2em),
  align: center,
)[
  #text(size: 7pt, weight: "bold")[#q]
]

// Short link label: pass a URL and a fallback label
#let linktag(url, label: "Link") = link(url)[
  #text(size: 7pt, weight: "semibold")[#label]
]

// Smallcaps section row that spans all columns (for Quadrant banners)
#let section_row(label, cols: 2, fill: luma(96)) = table.cell(colspan: cols)[
  #box(fill: fill, inset: (x: 4pt, y: 2pt), radius: 2pt)[
    #text(weight: "semibold")[#label]
  ]
]



// -------------------------------------
//version 1 is just using the 2 column format

// Page is already 2-column in your doc; keep using that.
// Keep text size >= 9pt for readability in proceedings.
#set text(size: 9pt)

// Breakable table with repeating header; no vertical grid; compact padding.
#table(
  columns: (1fr, 9mm),           // flex title + narrow Q column
  align: (left, center),
  inset: (x: 4pt, y: 2pt),       // tighter than 5pt
  column-gutter: 4pt,
  row-gutter: 0pt,
  stroke: none,

  toprule(),
  table.header(repeat: true)[*Paper Title*][*Q*],
  midrule(),

  // --- your rows (examples, keep adding) ---
  ["A Land-Based War-Gaming Simulation Method Based on Multi-Agent Proximal Policy Optimization"], [#qtag("I")],
  ["Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II"], [#qtag("I")],
  ["Ares: A System-Oriented Wargame Framework for Adversarial ML"], [#qtag("I")],
  // ...
  bottomrule(),
)
// -------------------------------------
// version 2 is the medium ground
#table(
  columns: (11mm, 1fr, auto, 8mm),  // Year fixed, Title flex, Link narrow, Q narrow
  align: (right, left, left, center),
  inset: (x: 4pt, y: 2pt),
  column-gutter: 4pt,
  row-gutter: 0pt,
  stroke: none,

  toprule(),
  table.header(repeat: true)[*Year*][*Paper Title*][*Link*][*Q*],
  midrule(),

  // Example rows — put small "role" tags inside the Title cell to save columns
  [2025], [
    #text(size: 9pt)[Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II]
    \  #box(fill: luma(95), inset: (x: 3pt, y: .1em), radius: 1.5pt)[
      #text(size: 7pt)[Player: Analytical]
    ]
    \  #box(fill: luma(95), inset: (x: 3pt, y: .1em), radius: 1.5pt)[
      #text(size: 7pt)[Adj: Analytical]
    ]
  ], [#linktag("https://arxiv.org/abs/2508.16580", "arXiv")], [#qtag("I")],

  [2024], [
    #text(size: 9pt)[BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of LLMs in MAS]
    \  #box(fill: luma(95), inset: (x: 3pt, y: .1em), radius: 1.5pt)[#text(size: 7pt)[Player: Analytical]]
    \  #box(fill: luma(95), inset: (x: 3pt, y: .1em), radius: 1.5pt)[#text(size: 7pt)[Adj: Analytical]]
  ], [#linktag("https://arxiv.org/abs/2408.15971", "arXiv")], [#qtag("I")],

  // Quadrant section separator (spans all 4 columns)
  table.cell(colspan: 4)[#box(fill: qcol.at("II").lighten(85%), inset: (x: 4pt, y: 2pt), radius: 2pt)[*Quadrant II*]],

  // ...more rows...
  bottomrule(),
)

// -------------------------------------
// version 3 is full width 6 columns 
// Make the figure breakable so long tables can span pages
#show figure: set block(breakable: true)

#figure(
  scope: "parent",        // span both columns in a 2-col doc
  placement: top,         // suggest top placement
  caption: [Selected AI-in-Wargames Papers (by year).],
  {
    table(
      columns: (11mm, 1fr, auto, 10mm, 16mm, 17mm), // Year, Title, Link, Q, Player, Adjudicator
      align: (right, left, left, center, center, center),
      inset: (x: 4pt, y: 2pt),
      column-gutter: 5pt,
      row-gutter: 0pt,
      stroke: none,

      toprule(),
      table.header(repeat: true)[*Year*][*Paper Title*][*Link*][*Q*][*Player*][*Adjud.*],
      midrule(),

      // Optional quadrant banner row:
      table.cell(colspan: 6)[#box(
        fill: qcol.at("I").lighten(86%), inset: (x: 4pt, y: 2pt), radius: 2pt
      )[*Quadrant I*]],

      // Example rows:
      [2025], [Adaptive Command: Real-Time Policy Adjustment via Language Models in StarCraft II],
      [#linktag("https://arxiv.org/abs/2508.16580", "arXiv")], [#qtag("I")],
      [#text(size: 8pt, weight: "semibold", fill: qcol.at("I"))[Analytical]],
      [#text(size: 8pt, weight: "semibold", fill: qcol.at("I"))[Analytical]],

      [2024], [BattleAgentBench: A Benchmark for Evaluating Cooperation and Competition Capabilities of LLMs in MAS],
      [#linktag("https://arxiv.org/abs/2408.15971", "arXiv")], [#qtag("I")],
      [#text(size: 8pt, weight: "semibold", fill: qcol.at("I"))[Analytical]],
      [#text(size: 8pt, weight: "semibold", fill: qcol.at("I"))[Analytical]],

      // Repeat for II/III/IV; insert section banners as needed:
      table.cell(colspan: 6)[#box(fill: qcol.at("II").lighten(86%), inset: (x: 4pt, y: 2pt), radius: 2pt)[*Quadrant II*]],

      // ...
      bottomrule(),
    )
  }
)

