#!/usr/bin/env python3

import re

import pypandoc
import pyperclip

re_upright_bold = re.compile(r"upright\(bold\(([a-zA-Z]+)\)\)")
re_differential = re.compile(r"([ \$])d ")
re_frac = re.compile(r"frac\(([^()]+), ([^()]+)\)")

latex_input_lines = "".join(pyperclip.paste()).splitlines()
latex_text = ""
for line in latex_input_lines:
    if line.startswith("- "):
        latex_text += "\n"
    latex_text += line + "\n"
    if line.startswith("#"):
        latex_text += "\n"


typst_text = pypandoc.convert_text(latex_text, "typst", format="latex")
typst_text = re_upright_bold.sub(r"bf(\1)", typst_text)
typst_text = re_differential.sub(r"\1dif ", typst_text)
typst_text = re_frac.sub(r"(\1) / (\2)", typst_text)
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
print(typst_text)
