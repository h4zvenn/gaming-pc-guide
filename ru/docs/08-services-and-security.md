---
layout: doc
title: "Службы и безопасность"
description: "Проверь сторонние службы, измени только действительно ненужные и сохрани возможность отката."
lang: ru
translation_key: services-and-security
permalink: /ru/docs/08-services-and-security.html
---


> Не отключай службы массово и не используй чужие «оптимизированные» списки.
> Перед изменением службы запиши её изначальный `StartType`. Если что-то перестанет работать, верни настройку обратно.

## Что вы узнаете

- Как найти сторонние службы.
- Какие службы обычно можно перевести в ручной запуск.
- Какие службы нельзя отключать.
- Как вернуть службу в исходное состояние.

## Перед изменениями

Создай точку восстановления Windows.

Для каждой службы, которую собираешься изменить, запиши:

- Имя службы.
- Текущий `StartType`.
- Причину изменения.
- Дату изменения.

Не переводи службу в `Disabled`, если не понимаешь, за что она отвечает. В большинстве случаев достаточно `Manual`.

---

## 1. Посмотреть сторонние службы

Чтобы посмотреть имена, пути и типы запуска служб через меню, используй пункт 3 в [диагностическом руководстве](09-powershell-diagnostics.html). Проверка только показывает сведения и ничего не изменяет. Ручные команды приведены в английской главе диагностики.

### На что смотреть

- `Name` — системное имя службы.
- `DisplayName` — отображаемое имя.
- `State` — запущена ли служба сейчас.
- `StartMode` — тип запуска.
- `PathName` — путь к исполняемому файлу.

Если путь указывает на неизвестную программу, сначала найди информацию о ней. Не отключай службу только потому, что её название незнакомо.

---

## 2. Что можно изменить

| Служба | Рекомендация | Когда менять |
| --- | --- | --- |
| Xbox Service | `Manual` | Не пользуешься Xbox Game Bar |
| LGHUB Updater Service | `Manual` | Не нужен постоянный updater Logitech |
| Discord System Helper | Обычно оставить `Manual` | Не требует изменений |
| NVIDIA FrameView SDK | Обычно оставить `Manual` | Нужна только для FrameView |

### Перевести в ручной запуск

```powershell
Set-Service -Name XboxService -StartupType Manual
Stop-Service -Name XboxService -ErrorAction SilentlyContinue

Set-Service -Name LGHUBUpdaterService -StartupType Manual
Stop-Service -Name LGHUBUpdaterService -ErrorAction SilentlyContinue
```

Эти команды не удаляют программы. Они только меняют способ запуска служб.

---

## 3. Что не отключать

| Служба | Почему |
| --- | --- |
| NVIDIA LocalSystem Container | Нужна для NVIDIA App, драйвера и игровых функций |
| AMD External Events Utility | Может быть нужна для функций AMD Software |
| Steam Client Service | Нужна для нормальной работы Steam |
| Windows Update | Обновления и безопасность |
| Windows Defender | Защита от вирусов |
| AudioSrv | Звук |
| AudioEndpointBuilder | Аудиоустройства |
| Bluetooth Support Service | Bluetooth-наушники, мыши, геймпады |
| WLAN AutoConfig | Wi-Fi |
| DHCP Client | Получение IP-адреса |
| DNS Client | Разрешение доменных имён |
| Plug and Play | Определение устройств |
| Power | Управление питанием |

Не отключай службы безопасности, сети, звука, хранения и обновлений ради FPS.

---

## 4. Вернуть службу

Если программа или функция перестала работать, верни прежний тип запуска.

```powershell
Set-Service -Name 'ИМЯ_СЛУЖБЫ' -StartupType Automatic
Start-Service -Name 'ИМЯ_СЛУЖБЫ'
```

Пример для Xbox:

```powershell
Set-Service -Name XboxService -StartupType Automatic
Start-Service XboxService
```

Пример для Logitech G HUB:

```powershell
Set-Service -Name LGHUBUpdaterService -StartupType Automatic
Start-Service LGHUBUpdaterService
```

---

## Типы запуска

| Тип | Значение |
| --- | --- |
| Automatic | Запускается вместе с Windows |
| Automatic (Delayed Start) | Запускается после загрузки системы |
| Manual | Запускается только когда нужна |
| Disabled | Не запускается; используй только если точно уверен |

Для большинства необязательных сторонних служб достаточно `Manual`.

---

## 5. Проверить изменения

```powershell
Get-Service XboxService, LGHUBUpdaterService -ErrorAction SilentlyContinue |
    Select-Object Name, Status, StartType |
    Format-Table -AutoSize
```

Ожидаемый результат после перевода в `Manual`:

```text
Name                 Status  StartType
----                 ------  ---------
XboxService          Stopped Manual
LGHUBUpdaterService  Stopped Manual
```

---

## Безопасность

Не отключай:

- Защитник Windows.
- Контроль учётных записей.
- Обновления Windows.
- Брандмауэр.
- BitLocker.
- Secure Boot и TPM без понимания последствий.

Оптимизация не должна снижать безопасность системы. Если совет требует отключить защиту, обновления или антивирус — это плохой совет.

---

## Итог

Теперь у тебя меньше необязательных фоновых служб, но важные компоненты Windows остались работоспособными.

Следующий шаг:  
[Диагностика через PowerShell — EN]({{ '/docs/09-powershell-diagnostics.html' | relative_url }}).
