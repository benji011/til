---
title: "You can see the entire commit column on GitLab using JS as a bookmark"
date: 2024-11-27T00:00:00Z
tags: [gitlab, javascript, browser]
---

GitLab's CI/CD pipeline view often truncates commit messages in a narrow column. You can create a bookmarklet to expand the column and see full commit text with one click.

**Create a bookmark with this JavaScript:**

```javascript
javascript:(function(){var e=document.querySelectorAll('a.commit-sha.mr-0');for(var t=0;t<e.length;t++){e[t].parentNode.removeChild(e[t]);}var n=document.querySelectorAll('div.container-limited');if(n.length>0){n[0].style.maxWidth='2400px';}var r=document.querySelectorAll('a.ref-name');for(var t=0;t<r.length;t++){r[t].style.overflow='unset';}})();
```

**What it does:**

When you click this bookmark while viewing GitLab's pipelines page, it:

1. **Removes constraining elements** - Deletes elements that limit the commit column width
2. **Expands container width** - Increases the max-width to 2400px (from the default ~1280px)
3. **Reveals hidden text** - Sets overflow to 'unset' on ref-name elements

**How to use it:**

1. Create a new bookmark in your browser
2. Name it "Expand GitLab Commits"
3. Paste the JavaScript code above as the URL
4. Navigate to any GitLab pipeline page
5. Click the bookmark to expand the commit column

This is particularly useful when reviewing pipelines with descriptive commit messages that get truncated in the default narrow layout.

[Original source](https://dev.to/benji011/til-how-to-see-the-entire-commit-column-on-gitlab-using-js-518m)
