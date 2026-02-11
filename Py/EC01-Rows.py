rows = [1, 3, 5, 7, 3]
max_width = max(rows)

for r in rows:
    print(("*" * r).center(max_width))