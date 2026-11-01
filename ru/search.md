---
layout: default
title: "Поиск"
description: "Поиск по руководствам по ключевому слову."
lang: ru
translation_key: search
permalink: /ru/search/
search_exclude: true
---

<h1>Поиск по руководствам</h1>

<form class="search-form" role="search" onsubmit="return false">
  <label for="search-input">Ключевое слово</label>
  <input id="search-input" type="search" autocomplete="off" placeholder="фризы, пинг, XMP, CS2…" disabled>
</form>

<p id="search-status" class="search-status" aria-live="polite">Загрузка индекса…</p>
<ul id="search-results" class="search-results"></ul>
<noscript><p>Для поиска нужен JavaScript. Открой <a href="{{ '/ru/docs/' | relative_url }}">список руководств</a>.</p></noscript>

<script>
  window.searchConfig = {
    lang: 'ru',
    index: '{{ "/search.json" | relative_url }}',
    ready: 'Введи не менее 2 символов.',
    none: 'Ничего не найдено.',
    count: ' результатов.',
    failed: 'Не удалось загрузить индекс поиска.'
  };
</script>
<script src="{{ '/assets/js/search.js' | relative_url }}" defer></script>
