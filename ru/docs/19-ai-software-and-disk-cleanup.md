---
layout: doc
title: "Очистка диска и удаление ПО"
description: "Как удалить неиспользуемые ИИ-инструменты и освободить место на диске, не повредив нужные приложения."
lang: ru
translation_key: ai-software-and-disk-cleanup
permalink: /ru/docs/19-ai-software-and-disk-cleanup.html
---

Используй эту страницу, чтобы найти неиспользуемые ИИ-инструменты, проверить крупные папки и очистить только безопасные кэши. Не удаляй папки приложений автоматически.

> **Важно:** сначала создай точку восстановления. Не удаляй инструменты разработчика, такие как Node.js, Python, Git, Visual Studio, и папки проектов.

## Быстрый старт

1. Создай точку восстановления.
2. Запусти аудит ИИ-программ.
3. Определи инструменты, которыми ты не пользуешься.
4. Удали их штатным деинсталлятором или через параметры Windows.
5. Очисти только безопасные кэши.
6. Проверь свободное место и работу нужных приложений.

---

## Аудит ИИ-программ

Эта команда только показывает установленные приложения, CLI-инструменты и типичные папки данных. Она ничего не удаляет.

```powershell
Write-Host "`n===== AI SOFTWARE AUDIT ====="

Get-ItemProperty `
  HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, `
  HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, `
  HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* `
  -ErrorAction SilentlyContinue |
Where-Object {
  $_.DisplayName -match 'Claude|Anthropic|ChatGPT|OpenAI|Codex|Copilot|Cursor|Windsurf|Ollama|LM Studio|Jan|AnythingLLM|Continue|Perplexity|Gemini|Aider'
} |
Select-Object DisplayName, DisplayVersion, InstallLocation, UninstallString |
Format-List

foreach ($command in 'claude', 'claude-unlimited', 'cu', 'codex', 'copilot', 'cursor', 'ollama', 'lms', 'gemini', 'aider', 'openai') {
    $found = Get-Command $command -ErrorAction SilentlyContinue
    if ($found) {
        Write-Host "Found: $command -> $($found.Source)"
    }
}

$paths = @(
    "$env:USERPROFILE\.claude",
    "$env:USERPROFILE\.codex",
    "$env:USERPROFILE\.ollama",
    "$env:USERPROFILE\.lmstudio",
    "$env:USERPROFILE\.continue",
    "$env:USERPROFILE\.aider",
    "$env:LOCALAPPDATA\Ollama",
    "$env:LOCALAPPDATA\Programs\Ollama",
    "$env:LOCALAPPDATA\Programs\LM Studio"
)

foreach ($path in $paths) {
    if (Test-Path -LiteralPath $path) {
        Write-Host "Found: $path"
    }
}
```

---

## Удаление неиспользуемых ИИ-инструментов

Удаляй только те инструменты, которые ты определил и которыми больше не пользуешься.

Предпочтительный порядок:

1. Закрой приложение обычным способом.
2. Удали его через `Параметры → Приложения → Установленные приложения`.
3. Если Windows его не показывает, используй официальный деинсталлятор приложения.
4. Удаляй оставшуюся папку данных только убедившись, что тебе не нужны её настройки, модели и локальные данные.

Пример для Ollama, только если ты им больше не пользуешься:

```powershell
$uninstaller = "$env:LOCALAPPDATA\Programs\Ollama\unins000.exe"

if (Test-Path -LiteralPath $uninstaller) {
    Start-Process -FilePath $uninstaller -Wait
}
```

После удаления проверь, осталась ли папка данных:

```powershell
Test-Path "$env:USERPROFILE\.ollama"
```

Удаляй её вручную, только если уверен, что её модели и настройки больше не нужны.

> **Предупреждение:** не запускай скрипт, который принудительно завершает процессы и рекурсивно удаляет несколько пользовательских папок. Один неверный путь может уничтожить конфигурации, локальные модели, данные проектов или инструменты разработки.

---

## Анализ использования диска

Используй [меню диагностики только для чтения](09-powershell-diagnostics.html), чтобы посмотреть ёмкость и свободное место дисков. Сканирование крупных папок ниже выполняется отдельно: оно может занять несколько минут и обходит файлы в твоём профиле пользователя.

Найди самые большие папки в профиле пользователя:

```powershell
Get-ChildItem $env:USERPROFILE -Directory -Force -ErrorAction SilentlyContinue |
ForEach-Object {
    $size = (
        Get-ChildItem $_.FullName -Recurse -Force -ErrorAction SilentlyContinue |
        Where-Object { -not $_.PSIsContainer } |
        Measure-Object -Property Length -Sum
    ).Sum

    [PSCustomObject]@{
        SizeGB = [math]::Round($size / 1GB, 2)
        Folder = $_.FullName
    }
} |
Sort-Object SizeGB -Descending |
Select-Object -First 20 |
Format-Table -AutoSize
```

Это сканирование может занять несколько минут на больших профилях.

---

## Очистка безопасных кэшей

Закрой связанное приложение перед очисткой его кэша.

```powershell
Remove-Item "$env:LOCALAPPDATA\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:WINDIR\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Кэши шейдеров графики можно очистить, если игры создают их заново:

```powershell
Remove-Item "$env:LOCALAPPDATA\NVIDIA\DXCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\NVIDIA\GLCache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Кэши браузера можно очистить, но браузер должен быть закрыт:

```powershell
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Очищай корзину только после проверки её содержимого:

```powershell
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
```

> **Примечание:** после очистки кэшей шейдеров следующий запуск игры может дольше загружаться или компилировать шейдеры.

---

## Кэши игровых лаунчеров

Закрой Discord или Roblox перед очисткой их кэшей.

```powershell
Remove-Item "$env:LOCALAPPDATA\Roblox\*" -Recurse -Force -ErrorAction SilentlyContinue
```

```powershell
Remove-Item "$env:LOCALAPPDATA\Discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Discord\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\discord\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\discord\Code Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
```

Очищай кэш npm, только если ты используешь Node.js и понимаешь последствия:

```powershell
if (Get-Command npm -ErrorAction SilentlyContinue) {
    npm cache clean --force
}
```

---

## Что нельзя удалять

| Путь | Причина |
| --- | --- |
| `C:\Windows\Installer` | Нужен для восстановления и удаления программ |
| `C:\ProgramData\Package Cache` | Нужен многим установщикам |
| `C:\pagefile.sys` | Нужен для стабильности системы |
| `C:\Program Files (x86)\Steam\steamapps\common` | Содержит установленные игры Steam |
| `.rustup` и `.cargo` | Набор инструментов Rust и кэш сборки |
| `node_modules` в активных проектах | Нужны для запуска проекта |
| Папки проектов | Могут содержать исходный код, локальные настройки и несохранённую работу |

---

## Чек-лист

- [ ] Точка восстановления создана.
- [ ] Аудит ИИ-программ выполнен.
- [ ] Удалены только неиспользуемые инструменты.
- [ ] Очищены только безопасные кэши.
- [ ] Свободное место проверено.
- [ ] Нужные приложения продолжают работать.

---

## Главная

[Главная]({{ '/ru/' | relative_url }})
