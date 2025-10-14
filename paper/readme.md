# README — Compilation AsciiDoc vers LaTeX et PDF

## Prérequis
- Installer Asciidoctor : https://asciidoctor.org/
- Installer asciidoctor-latex (via `gem install asciidoctor-latex --pre`)
- Installer une distribution LaTeX complète (TeX Live, MikTeX, etc.)
- Installer `latexmk` pour compilation automatique recommandée

## Étapes de compilation

1. Convertir le fichier `.adoc` en `.tex` :
```
asciidoctor-latex your_article.adoc
```

Cela produit `your_article.tex`.

2. Compiler le fichier LaTeX en PDF :
```
latexmk -pdf your_article.tex
```
ou, si `latexmk` non disponible :
```
pdflatex your_article.tex
bibtex your_article          # si citations BibTeX
pdflatex your_article.tex
pdflatex your_article.tex
```

3. Ouvrir le PDF généré dans votre visionneuse favorite.

## Conseils
- Placez vos figures (images PNG, JPG) dans le même dossier ou modifiez les chemins dans le `.adoc`.
- Utilisez `asciidoctor-pdf` si vous souhaitez un PDF plus simple directement sans LaTeX (mais moins flexible).
- Pour gérer les références BibTeX correctement, compilez avec `bibtex` ou `biber` selon votre backend LaTeX.

## Ressources utiles
- https://asciidoctor.org/docs/asciidoctor-latex/
- https://tex.stackexchange.com/
