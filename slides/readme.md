# Slidev IA, chômage et revenu de base

## Prérequis
- Node.js >= 16
- Slidev : `npm i -g slidev`
- `npm init slidev@latest`
- Playwright : `npm i -D playwright-chromium`

## Lancer la présentation


```
cd dir_slides

npm run dev

```

## Exporter en PDF
```

slidev export

```
Le PDF s’appelle slides-export.pdf par défaut.

### Options avancées
- PDF avec étapes/clics : `slidev export --with-clicks`
- Nom personnalisé : `slidev export --output nom.pdf`

## Documentation
- https://sli.dev/guide/
- https://sli.dev/guide/exporting.html