(() => {
  const cfg = window.searchConfig;
  const input = document.getElementById('search-input');
  const status = document.getElementById('search-status');
  const list = document.getElementById('search-results');
  if (!cfg || !input) return;

  let pages = [];

  const render = () => {
    const words = input.value.toLowerCase().split(/\s+/).filter(Boolean);
    list.textContent = '';
    if (input.value.trim().length < 2) {
      status.textContent = cfg.ready;
      return;
    }
    const scored = pages
      .map((page) => {
        const title = page.title.toLowerCase();
        const body = `${page.description} ${page.text}`.toLowerCase();
        let score = 0;
        for (const word of words) {
          if (title.includes(word)) score += 10;
          else if (body.includes(word)) score += 1;
          else return null;
        }
        return { page, score };
      })
      .filter(Boolean)
      .sort((a, b) => b.score - a.score)
      .slice(0, 20);

    status.textContent = scored.length ? `${scored.length}${cfg.count}` : cfg.none;
    for (const { page } of scored) {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = page.url;
      link.textContent = page.title;
      const note = document.createElement('p');
      note.textContent = page.description;
      item.append(link, note);
      list.appendChild(item);
    }
  };

  fetch(cfg.index)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json();
    })
    .then((data) => {
      pages = data.filter((page) => page.lang === cfg.lang);
      input.disabled = false;
      status.textContent = cfg.ready;
      const query = new URLSearchParams(location.search).get('q');
      if (query) input.value = query;
      render();
      input.addEventListener('input', render);
    })
    .catch(() => {
      status.textContent = cfg.failed;
    });
  
  // Theme toggle functionality
  const themeToggle = document.getElementById('themeToggle');
  const htmlElement = document.documentElement;

  // Check saved theme in localStorage or system preferences
  const savedTheme = localStorage.getItem('theme') || 
                     (window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark');

  htmlElement.setAttribute('data-theme', savedTheme);
  themeToggle.textContent = savedTheme === 'light' ? '☀️' : '🌙';

  themeToggle.addEventListener('click', () => {
    const currentTheme = htmlElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'light' ? 'dark' : 'light';

    htmlElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
    themeToggle.textContent = newTheme === 'light' ? '☀️' : '🌙';
  });
})();
