<details>
<summary>2023年4月17日 - README.mdファイルを使用して静的HTMLサイトを更新する</summary>

静的ウェブサイトを構築する際、HTMLファイルを手動で編集する必要なくコンテンツを更新する方法があると便利です。このためには、marked.jsなどのJavaScriptライブラリを使用してREADME.mdファイルからコンテンツを読み込んで、Webページにレンダリングすることができます。

README.mdファイルを読み込むには、Fetch APIを使用してファイルにリクエストを送信してコンテンツを取得します。次に、marked.jsを使用してMarkdown構文をHTMLに変換し、JavaScriptを使用してWebページに挿入します。

以下は、これを実行するための例です：

```html
<div class="container mx-auto my-10">
  <div id="content"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
  fetch('README.md')
    .then(response => response.text())
    .then(text => {
      const contentElement = document.getElementById('content');
      contentElement.innerHTML = marked(text);
    });
</script>
```

この例では、コンテンツを保持するコンテナdivを作成し、Fetch APIを使用してREADME.mdファイルを取得しています。次に、marked.jsを使用してMarkdown構文をHTMLに変換し、コンテンツdivに挿入しています。

この設定により、README.mdファイルの更新は自動的にWebサイトに反映されるため、静的ウェブサイトのコンテンツを維持および更新するのが簡単になります。
</details>
