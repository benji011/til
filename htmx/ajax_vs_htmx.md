e.g. In my Django template I might have:

```html
{% load ajax %}

<button id="my-button">Click me</button>

<script>
$(document).on("click", "#my-button", function() {
  $.ajax({
    url: "/my-view",
    type: "GET",
    success: function(data) {
      // Do stuff
    }
  });
});
</script>
```

but with HTMX you can just do this:

```html
<button id="my-button" hx-post="/my-view"></button>

```
