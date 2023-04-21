import { marked } from 'marked';

async function fetchReadme() {
  const response = await fetch('https://gist.githubusercontent.com/benji011/1e6950e8af13893b9fcf03f0d74e9b31/raw/c0546e196aa97676f119fc16abe3344fd53c4bb3/test.md');
  const markdown = await response.text();
  const html = marked(markdown).replace(/<a /g, '<a target="_blank" ');
  document.getElementById('readme').innerHTML = html
}

fetchReadme();
