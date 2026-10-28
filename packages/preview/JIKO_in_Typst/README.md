# JIKO (Jurnal Informatika dan Komputer) Manuscript Guidelines (Typst Edition)

This document summarizes the formatting requirements and manuscript structure based on the official **JIKO Author Guidelines** and the official **Typst Template** provided by the journal. Use this guide to prepare your manuscript in Typst before submission.

> **Note:** JIKO does **not** provide an official Typst template. The journal officially accepts manuscripts in **DOCX** or **LaTeX** formats. If you submit a Typst-generated PDF, ensure the final layout closely matches the official template to avoid desk rejection.

## 1. General Formatting Requirements

- **Paper Size:** A4 (Quarto).

- **Layout:** 1 column, justified text.

- **Spacing:** Single spacing (1.0) in the template, though the submission guideline mentions 1.5 spacing. **Follow the template** (single spacing, 11 pt).

- **Font Size:** 11 pt.

- **Page Limit:** Maximum of **16 pages** (excluding Author Bibliography), though the template suggests no more than 12 pages for the main text.

- **Word Count:** 5,000 – 8,500 words (including references, figures, and tables).

- **Language:** Manuscripts must be written in **English** (starting Volume 11, Issue 1). Terms in other languages must be italicized.

- **File Format:** The final submission must be in DOCX or LaTeX. Typst users should export to PDF and ensure it visually conforms to the JIKO `.cls` template.

## 2. Manuscript Structure (Mandatory Sections)

1. **Title:** Maximum **12 words**, Title Case. Avoid abbreviations and formulas.

2. **Authors & Affiliations:**

   - Full names **without academic degrees**.

   - Include Department, Faculty, University, City, Country, and email address.

   - Mark the **Corresponding Author** with an asterisk (\*).

3. **Abstract:** One paragraph, **150–250 words**. Must include:

   - Research objective and problem.

   - Basic design/approach.

   - Main findings.

   - Brief summary of interpretations and conclusions.

4. **Keywords:** Maximum **5 words**, separated by semicolons (`;`).

5. **Introduction (without subsections):** 2–3 pages. Includes background, objectives, methods, and literature review. Ends with an emphasis on the items to be discussed.

6. **Methods:** Research steps, logical sequence, and system description. Figures and tables must be numbered sequentially.

7. **Results:** Present factual findings objectively without interpretation. Include a narrative summary supported by tables/figures. Report statistical tests, values, degrees of freedom, and exact *p*-values. Do **not** discuss or compare with previous studies here.

8. **Discussion:** Critical analysis. Interpret findings, relate to existing theories, compare with previous research, and explain practical implications and novelty. Acknowledge limitations.

9. **Conclusion:** Restate the topic, summarize main points, and highlight significance. Write in **complete paragraphs** (no numbered lists or bullet points).

10. **Acknowledgments (Optional).**

11. **AI Usage Statement (Mandatory):** State the AI tool used and its purpose. Generative AI content must not exceed **20%** (Turnitin check required as a supplementary file).

12. **Author Contributions (Mandatory):** Describe each author's contribution using initials.

13. **Declaration of Competing Interests (Mandatory).**

14. **Data Availability (Mandatory).**

15. **References (Mandatory):** See Section 4 below.

16. **Author Bibliographies:** Include a photo and short biography for each author at the end of the manuscript.

## 3. Visual Elements Guidelines

- **Figures:** High-quality images. Captions in English with sequential numbers (e.g., Figure 1). Subfigures are allowed; explain each subfigure. Refer to figures in the text.

- **Tables:** Numbered sequentially (e.g., Table 1). Add horizontal lines only when necessary. Table notes go below the table. Longtables are allowed but must not exceed 2 pages.

- **Equations:** Numbered sequentially in parentheses, right-aligned (e.g., `(1)`). Explain all notations immediately below the equation.

- **Code:** Monospace format, no need to italicize. Use a numbered code block (e.g., Code 1).

- **Algorithms:** Numbered lines (e.g., Algorithm 1).

## 4. Citations & References (IEEE Style)

- **In-text Citations:** Use square brackets: `\[1\]`, `\[2\]`, `\[3, 4\]`, or `\[1, 4, 14\]`.

- **Reference Style:** **IEEE**.

- **Quantity:** At least **15** relevant references from reputable journals.

- **Requirement:** Must include **DOI** for each reference. All references must be cited in the text.

- **Tool:** Use reference managers (Mendeley, Zotero, EndNote, JabRef, or Typst's BibTeX). Include at least **2 articles from JIKO** that are relevant to your paper.

- **Format:** If using LaTeX, use a `.bib` file (preferred) rather than `\\bibitem`.

## 5. Typst Workflow Tips

- **Layout:** Set `\#set page(paper: "a4", margin: ...)`. Use `\#set par(justify: true)`.

- **Font:** Use a standard serif font (e.g., `"New Computer Modern"` or `"Times New Roman"`) to approximate the LaTeX template.

- **Headings:** Use `= Introduction`, `== Methods`, etc. Ensure the numbering matches the journal style.

- **Figures/Tables:** Use `\#figure()` with `caption` and `kind` to generate numbered captions and cross-references (`@fig:label`, `@tbl:label`).

- **Bibliography:** Use `\#bibliography("references.bib", style: "ieee")`.

- **CRediT:** Typst does not have a built-in CRediT taxonomy, so write the author contributions section manually as a paragraph.


*Disclaimer: This README is a guide, not the official template. Always cross-check with the latest JIKO Author Guidelines at [https://ejournal.utdi.ac.id/index.php/jiko/about/submissions](https://ejournal.utdi.ac.id/index.php/jiko/about/submissions) before final submission.*

