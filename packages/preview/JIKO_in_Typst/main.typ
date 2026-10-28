#import "jiko.typ": *
#show: paper

// ------------------------------ INTRODUCTION ------------------------------
= Introduction
*To improve and maintain the quality of JIKO and to achieve international accreditation for JIKO, several changes have been made to the manuscript submission process. Authors are asked to take careful note of these changes.* Authors are asked to take careful note of these changes. Starting with Volume 11, Issue 1 and onwards, JIKO will be published in English and will include several mandatory sections, such as “Author Contributions.” Additionally, JIKO will include an author profile at the end of the full manuscript, complete with a photo of the author.

The introduction is well-structured and consists of three key sections: the first provides a clear background, starting with a general overview and moving on to a specific context, The introduction is organized into three key sections: the first provides a clear background, starting with the general context and moving toward the specific context; the second explains the references relevant to the research so that the position of the study and the latest research on the main topic can be understood; and the third outlines the research objectives and *once again emphasizes the novelty of the research* @Rikie, @adha2021, @alden2020.

Set the page layout to 1 column, justified, and set the paper size to A4. Also, set all margins according to the template. Edit the text using LaTeX _(highly recommended)_ or another commonly used _word processing_ program, with single spacing, 11 pt font size, and no more than 16 pages @condon2022.

The introduction should explain the background of the research, the proposed solution, and comparable related work. If there are
citations in the _script_, use [x], [y], or [x, y, z], and so on. Use citation tools such as _Mendeley_, _EndNote_, or _Jabref_ to help you create proper citations. Terms in languages other than Indonesian should be written in _italics_ or #text(fill: blue)[a different color] to make it easier for the layout team @chung2014.

Make sure each paragraph consists of more than one sentence. Do not include theories that are widely known or easily found. If you wish to include a theory, make sure it specifically influences your research.

You must write the article in English. Terms in languages other than English should be written in _italics_ or #text(fill: blue)[a different color] to make it easier for the layout team to work with.

Use this latest edition of the _LaTeX template_ when writing your article; it will help you produce a high-quality article. *The editorial board reserves the right to reject articles that are not well-structured, do not conform to the provided template, or show signs of plagiarism without undergoing the review process* @hosseinmotlagh2020.

*Title*. Keep it concise and informative. Titles are often used in information retrieval systems. Avoid abbreviations and formulas whenever possible; *NO MORE THAN 12 WORDS*; use uppercase letters@basconcillo2023. Please choose your paper’s title carefully, using as few words as
possible while still adequately describing the content.

*Author Names and Affiliations*. Clearly state the first and last names
of each author and verify that all names are spelled accurately; *DO NOT   INCLUDE ACADEMIC TITLES WITH AUTHOR NAMES!!*.
Provide a brief address for each affiliation, including the country name, and
the email address of the corresponding author.

*Corresponding author.* Indicate who will handle correspondence at all stages
of publication, as well as post-publication. This responsibility includes answering any future questions regarding
methodology and materials. Ensure that an email address is provided, and mark it with *(\*)*.

// ------------------------------ METHOD ------------------------------
= Method

The Methods section describes the research steps, outlining the logical sequence for obtaining the study’s results in accordance with expectations and the system description. If there are figures and tables, they must be presented with table and figure captions accompanied by sequential numbers. In the manuscript, citations are numbered sequentially
in square brackets @chung2014 @condon2022 @fard2022 @Rikie @g2024 @hafeez2020, and the table and figure numbers must be sequential, as shown in @contohtabel and @subfigure.

Use high-quality images, such as in @fig:logo. Equations must be edited using an equation editor. Equation numbers should be listed sequentially in parentheses, tabulated, and precisely aligned as shown in Equation~#eqref(<eq:cauchy_momentum>) @hafeez2020.

#figure(
  {
    counter(figure.where(kind: "subfig")).update(0)
    align(center, stack(
      dir: ltr,
      subfig(25%, "3a.png")[$rho^2 - theta_1$ and $rho^2 - theta_2$],
      subfig(30%, "3b.png")[$delta_1 - theta_1$ and $delta_1 - theta_2$],
    ))
    v(0.4em)
    align(center, stack(
      dir: ltr,
      subfig(30%, "3c.png")[The variation of $theta_1$],
      subfig(25%, "3a.png")[The variation of $rho^2$ and $delta_1$],
    ))
    v(0.8em)
    align(center, block(width: 90%, align(center, text(size: sz-small)[
      (a) Evaluated on $(delta_0, delta_1) = (0.1, 0.01)$ and $(alpha, beta) = (1, 1)$, \
      (b) Ecaluated on $(delta_0, rho^2) = (0.1, 1)$ and $(alpha, beta) = (1, 1)$, \
      and (c) (d) Ecaluated on $delta_0 = 0.1$ and $(alpha, beta) = (1, 1)$.
    ])))
  },
  caption: [The variations in $theta_1$ and $theta_2$ are related to $rho^2$ and $delta_1$],
) <subfigure>

Make sure all captions, legends, or data descriptions in the images are in English. Figures do not always have to appear below or above their captions; be sure to refer to figures using a reference, for example, “... as shown in @subfigure...,” “as seen in @fig:logo...

== subsection1

Some examples of open-source research data @goudarzi2021 and the tools used @Rikie @condon2022 @fard2022.
*_SUBFIGURES MAY BE USED IN THIS ARTICLE_*; be sure to explain each image in the subfigure and provide a caption that adequately describes the entire subfigure. You can see an example of a subfigure in @subfigure. \
*_For your references, include at least 2 articles from JIKO that are relevant to your article._* You must cite at least 15 references, and *you must add the DOI of article that you cite* on your references @hosseinmotlagh2020, @hafeez2020, @Rikie.

== subsection2

The final result is shown in @fig:logo. There is no need to force the figure to appear on the same page as the text; simply ensure that the figure can be easily located even if it appears on a different page@kardi2021, @mahjoub2022, @ramani2019, @tastan2019.

#figure(
  image("JIKOlogo.png", width: 30%),
  caption: [JIKO],
) <fig:logo>

*The image size can be adjusted—it shouldn’t be too large, so it takes up too much space, or too small, so it’s blurry and hard to read.*

Use the table format below if you want to add a note to a table, as shown in @contohtabel.

#figure(
  box({
    table(
      columns: 3,
      toprule,
      [*Parameter*], [*Notation*], [*Remarks*],
      midrule,
      [name], [-], [engine common identifier],
      [manufacture], [-], [name of the manufacture],
      [bpr], [$lambda$], [bypass ratio],
      [pr], [-], [pressure ratio],
      [thrust], [$T_0$], [maximum static thrust],
      bottomrule,
    )
    tablenotes([], [Note], [a], [First Note], [b], [Other table notes.])
  }),
  caption: [An Example Table with a Table Legend],
) <contohtabel>

=== Subsubsection1

Reference to Equation~#eqnum(<eq:cauchy_momentum>), or you can use the (eqref) format equation~#eqref(<eq:cauchy_momentum>) to reference the equation.

$ d_(i j) = sqrt(sum_(k=1)^p (x_(i k) - y_(j k))^2) $ <eq:cauchy_momentum>

Where the values of: \
#grid(
  columns: 3,
  align: (left, center, left),
  column-gutter: 0.35em,
  row-gutter: 0.55em,
  [$d_(i j)$], [:], [Distance between object i and object j],
  [$P$], [:], [Number of factors in the cluster],
  [$x_(i k)$], [:], [Data for subject i on variable k],
  [$y_(j k)$], [:], [Data for subject j on variable k],
)

Don’t forget to include a description of your formula, including notation and any other details needed to clarify the formula you’ve written@vishwakarma2019 @vats2024 @Khanji.

If you include code in your article, you can format it as shown in the @lst1 example below. It’s fine if your code is written in a language other than English; there’s no need to italicize it—just format it according to the code you’ve written @maxwell1881treatise @jacobs1963fine @yorozu1987electron.

#figure(
  kind: raw,
  supplement: [Code],
  caption: [HTML Code Example],
  align(left, ```html
  <!DOCTYPE html>
  <html>
  <body>

  <h1>My First Heading</h1>
  <p>My first paragraph.</p>

  </body>
  </html>
  ```),
) <lst1>

If you need to write code in algorithm form, as shown in @alg1:

#algorithm(
  caption: [Soil Moisture Control System],
  State[Initialize and calibrate the YL-69 sensor and the Arduino Mega 2560 microcontroller.],
  While(
    [true],
    State[Continuously measure soil moisture levels using the YL-69 sensor.],
    State[Send the soil moisture data to the microcontroller for processing.],
    If(
      [soil moisture level $<$ threshold],
      State[Activate the DC water pump to add water to the soil.],
    ),
    State[Display the current soil moisture level on the 16x2 LCD screen.],
  ),
  State[Repeat steps 2–6 continuously to maintain the proper soil moisture level for the agarwood tree.],
) <alg1>

=== Subsubsection2

Authors must ensure that they have written a completely original work, and if they have used the work and/or words of others, that these have been properly cited or quoted. The datasets used must be traceable, and the research must be fully replicable using standard procedur @mahjoub2022 @vishwakarma2019.

// \blindtext

@tb:example_table shows an example from @ramani2019 @Rikie @condon2022.

#figure(
  table(
    columns: 3,
    toprule,
    [*Parameter*], [*Notation*], [*Remarks*],
    midrule,
    [name], [-], [common engine identifier],
    [manufacture], [-], [name of the manufacturer],
    [bpr], [$lambda$], [bypass ratio],
    [pr], [-], [pressure ratio],
    [thrust], [$T_0$], [maximum static thrust],
    bottomrule,
  ),
  caption: [Example table],
) <tb:example_table>

Alternatively, you can use a different table format (not intended for long tables), as shown in @standard. If you must use a longtable, add `\usepackage{longtable}` before `\begin{document}` in your LaTeX source, and make sure the longtable does not exceed 2 pages.

#figure(
  table(
    columns: (2cm + 12pt, 2cm + 12pt, 4cm + 12pt), // p{2cm}p{2cm}p{4cm} + tabcolsep
    hl,
    [*Parameter*], [*Notation*], [*Remarks*],
    hl2(3),
    [name], [-], [engine common identifier],
    [manufacture], [-], [name of the manufacturer],
    [bpr], [$lambda$], [bypass ratio],
    [pr], [-], [pressure ratio],
    [thrust], [$T_0$], [maximum static thrust],
    hl,
    table.cell(colspan: 3)[#text(size: sz-scriptsize)[Source: @Rikie]],
  ),
  caption: [Standard table, not a longtable],
) <standard>

If you need a table with multiple columns and rows, you can use and refer to the example in @multitab; make sure to add horizontal lines (other than those in the table header and at the end of the table) only if necessary to clarify the table.

#figure(
  table(
    columns: 5,
    hl,
    [*Header 1*], [*Header 2*], table.cell(colspan: 2, align: center)[*Header 3*], [*Result*],
    hl2(5),
    table.cell(rowspan: 2)[1], [col2], [col3], [col4], [123],
    [row2], [row2], [--], [321],
    hl,
  ),
  caption: [Multicol and Multirow Table],
) <multitab>

You can add references in the form of `\bibitem{citekey}` or by using a .bib file. Be sure to format your references correctly and use the _IEEE style_. The citations in this template are for illustrative purposes only.

=== About References
Ensure that your references are formatted correctly according to IEEE style, are traceable, and are highly relevant. It is also strongly recommended that more than 90% of your references be primary sources; include the article’s DOI link (highly recommended). Do not use outdated references; use the most recent ones (from the last 5 years) and ensure that there are at least 20 references relevant to the article.

// ------------------------------ RESULTS ------------------------------
= Results
A well-written Results section should present factual findings objectively, without interpretation, in a logical sequence that aligns with the research objectives. It must include a narrative summary highlighting the most important findings, supported by properly cited tables and figures that display relevant numerical or visual data. All statistical results should be reported with appropriate test names, values, degrees of freedom, and exact p-values where applicable, while maintaining consistency in decimal places. The text should guide readers through the key findings without repeating every value from tables, and every table and figure must be mentioned in the text. Interpretation and comparison with previous studies belong strictly in the Discussion, not in the Results.

#paragraph[Paragraph title]This is a titled paragraph if you wish to use the function described in the papers @ramani2019 @Rikie @condon2022. Please do not include excessive or repetitive content in this section. In particular, avoid repeating information that readers can already obtain from tables, graphs, etc. @Rikie.

It is important to provide information on statistical methods so that readers can continue to properly reference the research results.
Regarding statistical tests, necessary information such as the significance level, degrees of freedom, etc., must be provided, while formulas and related information should be mentioned in the methodology section@ramani2019 @Rikie @condon2022.
Rather than providing many numbers, it is better to present them as averages.

This section includes tables, graphs, bar charts, and others. They are presented concisely and succinctly to help readers understand the topic quickly and clearly. Be sure to include a description of your graphs, and ensure that your graphs are clearly legible.
Results should be presented in an order that corresponds to the order of the hypotheses.
You should not attempt to argue the reasons for rejecting or accepting a hypothesis; leave that for the discussion section.
If your findings can be fully explained in a few sentences of text, you do not need to include a table.

*Separate the results from the discussion* so that we can see how you discuss your research findings.

+ This is an enumeration
  - This is item 1
  - This is item 2
+ Enumeration 2

- one
- two
- three

== How to Make Revisions
Make revisions according to the reviewers’ feedback. In addition to revising your manuscript, submit a response table separately from the manuscript (in a supplementary file). This file is mandatory; the editor reserves the right to consider that you have not made revisions in accordance with the reviewers’ instructions if this file is not included. Ensure that the table includes feedback from reviewers A, B, and C, along with your responses and the locations of your revisions in the manuscript.
== Ethics and maximum number of pages
Do not fabricate, falsify, or plagiarize your articles; we will not tolerate these violations. You may use AI solely as a tool to assist you in conducting research and supporting the claims in your manuscript. Make sure the number of pages does not exceed 15 pages, including the authors' biographies.

// ------------------------------ DISCUSSION ------------------------------
= Discussion

To write a good discussion section for an article, present a critical analysis rather than simply repeating the data. Begin by interpreting your findings, relate them to existing theories, compare them with previous research, and explain the practical implications and novelty of your work. This will help you craft a thorough and well-structured discussion.

Present Interpretations, Not Just Data: Explain the meaning behind the data or findings you have obtained. Do not simply list raw numbers or facts in this section. Relate to Theory: Analyze your findings using theoretical frameworks, concepts, or literature relevant to your article’s topic. Compare with Previous Research: Show whether your findings align with, complement, or contradict the results of previous studies. Provide logical arguments explaining why this might be the case. Outline Implications and Contributions: Explain the significance of your findings for the relevant academic field (theoretical implications) or for the general public (practical implications). Acknowledge Limitations (If Necessary): Be objective by acknowledging the weaknesses, biases, or methodological limitations of your research, and then provide recommendations for future research.

// ------------------------------ CONCLUSION ------------------------------
= Conclusion

Restate your research topic. Usually, one sentence is enough to clearly restate the topic, and you will explain why your topic is important. This part of your conclusion should be clear and concise and state only the most important information; do not write it in the form of a numbered list or bullet points—simply present it *_in a complete paragraph_*.

You can summarize the main points of your research. It is helpful to read through your paper and select the most relevant facts and arguments. You do not need to include much information beyond the main arguments or facts you presented in your paper.

After discussing the main points of your argument, you can highlight their significance. For example, after stating the main points you’ve made in your argument, you can discuss how your topic impacts specific outcomes. Similarly, you can present other study results or findings that help emphasize the importance of your information.

You can also provide references @Rikie to strengthen your conclusions. If you wish to offer suggestions, do so by referring to what you believe might be done and is closely related to the research results. Suggestions in an article are recommendations, not requirements@Rikie.

// #appendix  // Opsional jika Anda membutuhkannya
#heading(numbering: none)[Acknowledgments (recommended)\*]
The authors would like to thank ... ... ... *THIS SECTION IS OPTIONAL*

#heading(numbering: none)[Funding sources (recommended)\*]
Please provide the funding sources for the research underlying this article *THIS SECTION IS OPTIONAL*.

#heading(numbering: none)[AI Usage Statement]
In preparing this manuscript, the author used [Name of AI Tool] for the purpose of [e.g., grammar correction and literature summarization]. After using the tool, the author conducted a thorough review and editing of the content and assumes full responsibility for the final published version. *This statement is mandatory*.

#heading(numbering: none)[Credit Authorship Contribution Statment]
Please describe the authors’ contributions (including their initials) and their roles in the research and writing of this article. *This section is mandatory*; the Editor reserves the right to delay the publication of your article if this section is not include

#heading(numbering: none)[Declaration Of Competing Interests]
The authors declare that they have no known competing financial interests or personal relationships that could have appeared to influence the work reported in this paper. *This statement is mandatory*.

#heading(numbering: none)[Data Availability]
*This statement is mandatory*. Add your statement about your data and availability of yor data.

// ------------------------------ REFERENCES ------------------------------
// Gaya IEEE sudah diatur di jiko.typ. Berkas .bib dibaca langsung oleh Typst.
#bibliography("reference.bib", title: [References])
