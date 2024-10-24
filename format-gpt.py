#!/usr/bin/env python3

import re

import pypandoc
import pyperclip

re_upright_bold = re.compile(r"upright\(bold\(([a-zA-Z]+)\)\)")
re_differential = re.compile(r"([ \$])d ")
re_frac = re.compile(r"frac\(([^()]+), ([^()]+)\)")
re_heading = re.compile(r"\#heading\(level: ([0-9]+), numbering: none\)\[([^\]]+)\]")
re_hyperlink = re.compile(r"^<[^>]+>$", flags=re.M)

latex_input_lines = "".join(pyperclip.paste()).splitlines()
latex_text = ""
for line in latex_input_lines:
    if line.startswith("- "):
        latex_text += "\n"
    latex_text += line + "\n"
    if line.startswith("#"):
        latex_text += "\n"


def heading_clean_function(match: re.Match) -> str:
    num_equals_signs: int = int(match.group(1))
    section_title: str = match.group(2)
    return "=" * num_equals_signs + " " + section_title.replace("\n", " ")


typst_text = pypandoc.convert_text(latex_text, "typst", format="latex")

typst_text = re_upright_bold.sub(r"bf(\1)", typst_text)
typst_text = re_differential.sub(r"\1dif ", typst_text)
typst_text = re_frac.sub(r"(\1) / (\2)", typst_text)
typst_text = re_heading.sub(heading_clean_function, typst_text)
typst_text = re_hyperlink.sub(r"", typst_text)

typst_text = typst_text.replace(r"dot.op", r"dot")
typst_text = typst_text.replace(r"integral_", r"int_")
typst_text = typst_text.replace(r"thin dif", "dif")
typst_text = typst_text.replace(r"quad arrow.r.double quad", "==>")
typst_text = typst_text.replace(r"\-", "-")
typst_text = typst_text.replace("-\n", "- ")
typst_text = typst_text.replace(r"\*", "*")
typst_text = typst_text.replace(r"\#", "=")
typst_text = typst_text.replace(r" gt.eq ", " >= ")
typst_text = typst_text.replace(r" lt.eq ", " <= ")
typst_text = typst_text.replace(r" eq.not ", " != ")
typst_text = typst_text.replace(r" plus.minus ", " pm ")
typst_text = typst_text.replace(r" plus.minus ", " pm ")
# we prefer column vectors
typst_text = typst_text.replace(r"angle.l ", "vec(")
typst_text = typst_text.replace(r" angle.r", ")")
typst_text = typst_text.replace(r"⟨ ", "vec(")
typst_text = typst_text.replace(r"⟨", "vec(")
typst_text = typst_text.replace(r" ⟩", ")")
typst_text = typst_text.replace(r"⟩", ")")
typst_text = typst_text.replace(r" ln (", "r log (")

print(typst_text)
