---
layout: default
title: "Blog"
---

{% if site.show_excerpts %}
  {% include blog.md %}
{% else %}
  {% include archive.html title="Posts" %}
{% endif %}
