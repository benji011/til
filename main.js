import { marked } from 'marked';

async function fetchReadme() {
  const response = await fetch(
    'https://api.github.com/repos/benji011/TIL/contents/README.md');
  const data = await response.json();
  const markdown = atob(data.content);
  const html = marked(markdown);
  document.getElementById('readme').innerHTML = html;
}

fetchReadme();
