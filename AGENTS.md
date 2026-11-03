# AGENTS.md

This file provides essential context for agents working in this repository to avoid mistakes and ramp up quickly.

## Project Overview

This is a Jekyll-based static site generator for the "Ultimate PC Gaming Optimization Guide 2026". It contains documentation and guides for optimizing gaming PCs with evidence-based recommendations.

## Key Commands & Workflows

### Build the Site

```bash
bundle exec jekyll build
```

### Run Local Development Server

```bash
bundle exec jekyll serve
```

### Lint Markdown Files

```bash
npx markdownlint-cli2 "docs/**/*.md"
```

### Check Links

```bash
powershell -ExecutionPolicy Bypass -File .\check-links.ps1
```

## Repository Structure

- `docs/` - English guides (Jekyll pages)
- `ru/` - Russian translation
- `tools/` - Read-only diagnostics scripts 
- `search/` - Site search page
- `assets/` - Site assets
- `downloads/` - Downloadable files

## Diagnostics Tool

The repository includes a read-only PowerShell diagnostics tool in the `tools/` directory:
- `GamingPCGuide-Diagnostics.ps1` - Main PowerShell script
- `GamingPCGuide-Diagnostics.bat` - Batch wrapper for the PowerShell script

The diagnostics tool is designed to be safe and never changes system settings. It collects information about hardware, processes, services, network, security, and system events.

## Special Considerations

### Development Environment
- Uses Ruby with Jekyll (version ~4.3)
- Requires `bundle install` to install dependencies
- Uses npm for markdown linting

### Contributing Guidelines
- All content must be in English
- Changes should be measurable, safe, and reversible
- Must include rollback steps for risky changes
- Follows specific documentation style with clear headings and code blocks
- Includes evidence (benchmarks, sources, screenshots) for claims

### Release Process
- Releases are published automatically when a valid version tag is pushed
- The release workflow validates the version-tag format and requires matching changelog notes
- Release attaches only contents of `tools/` folder as `GamingPCGuide-Diagnostics-<tag>.zip` with SHA-256 checksum

## Testing

When working with documentation or code:
1. Always build the site locally to verify changes render correctly
2. Run markdown linting before committing
3. Test diagnostics scripts in a non-production environment

## Markdown validation

После изменения Markdown-файлов или конфигурации markdownlint:

1. Найди фактически используемую команду проверки в workflow,
   package.json или документации проекта.
2. Используй существующую конфигурацию и установленный инструмент.
   Не устанавливай пакеты и не скачивай новые версии без разрешения.
3. Запусти проверку изменённых Markdown-файлов, если инструмент
   и конфигурация допускают такую проверку.
4. Исправь найденные нарушения и повтори проверку.
5. Перед завершением задачи по возможности запусти полную
   Markdown-проверку, используемую в CI.

Правила исправления:
- Сохраняй смысл текста, ссылки и оформление сайта.
- Не отключай линтер, отдельные правила или проверку файлов
  только ради успешного результата.
- Если HTML нужен для интерфейса или раскрывающихся блоков,
  используй минимальный разрешающий список MD033.allowed_elements
  в существующей конфигурации.
- Сохраняй все ранее разрешённые HTML-теги.
- Не создавай конфликтующие конфигурации.
- Не исправляй посторонние файлы и зависимости без необходимости.
- Не запускай бесконечный цикл исправлений: после трёх неудачных
  попыток остановись и объясни оставшуюся проблему.
- В отчёте указывай выполненную команду, результат и оставшиеся ошибки.
- Если проверку выполнить нельзя, прямо сообщай об этом.