---
layout: default
title: "Search"
description: "Search the guides by keyword."
lang: en
translation_key: search
permalink: /search/
search_exclude: true
---

<h1>Search the guides</h1>

<form class="search-form" role="search" onsubmit="return false">
  <label for="search-input">Keyword</label>
  <input id="search-input" type="search" autocomplete="off" placeholder="stutter, ping, XMP, CS2…" disabled>
</form>

<p id="search-status" class="search-status" aria-live="polite">Loading index…</p>
<ul id="search-results" class="search-results"></ul>
<noscript><p>Search needs JavaScript. Browse the <a href="{{ '/docs/' | relative_url }}">guide index</a> instead.</p></noscript>

<script>
  window.searchConfig = {
    lang: 'en',
    index: '{{ "/search.json" | relative_url }}',
    ready: 'Type at least 2 characters.',
    none: 'No results.',
    count: ' result(s).',
    failed: 'The search index could not be loaded.'
  };
</script>
<script src="{{ '/assets/js/search.js' | relative_url }}" defer></script>
