import sys

doc_started = False
content = ""
for line in sys.stdin:
    if line.strip() == r"\maketitle":
        continue
    elif line.startswith(r"\begin{document}"):
        doc_started = True
        continue
    elif not doc_started:
        continue
    if line.startswith(r"\end{document}"):
        continue
    if line.startswith(r"\s") and r"section*{" in line and r"subsubsection" not in line:
        line = line.replace("section*", "section")
        if r"\subsection{Part 1" not in line:
            content += r"\newpage" + "\n" * 2
    content += line
if not content:
    print("Nothing to add")
    sys.exit(1)

if len(sys.argv) <= 1:
    print(content)
    sys.exit(32)

with open(sys.argv[1]) as f:
    old = "".join(f.readlines()).strip()
    old = old.replace(r"\end{document}", "")
with open(sys.argv[1], "w") as f:
    print(old, file=f)
    print(content, file=f)
    print(r"\end{document}", file=f)
