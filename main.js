import { marked } from 'marked';

async function fetchReadme() {
  const response = await fetch('https://raw.githubusercontent.com/benji011/TIL_notes/main/README.md');
  const markdown = await response.text();
  const html = marked(markdown).replace(/<a /g, '<a target="_blank" ');
  document.getElementById('readme').innerHTML = html
}

fetchReadme();
