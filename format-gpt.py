#!/usr/bin/env python3

import re

import pypandoc
import pyperclip

re_upright_bold = re.compile(r"upright\(bold\(([a-zA-Z]+)\)\)")
re_differential = re.compile(r"([ \$])d ")

latex_text = "".join(pyperclip.paste())
typst_text = pypandoc.convert_text(latex_text, "typst", format="latex")
typst_text = re_upright_bold.sub(r"bf(\1)", typst_text)
typst_text = re_differential.sub(r"\1dif ", typst_text)
typst_text = typst_text.replace(r"dot.op", r"dot")
typst_text = typst_text.replace(r"integral_", r"int_")
print(typst_text)
