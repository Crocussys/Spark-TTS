<div align="center">
    <h1>
    Spark-TTS
    </h1>
    <p>
    <img src="src/logo/SparkTTS.jpg" alt="Spark-TTS Logo" style="width: 200px; height: 200px;">
    </p>
        <p>
        <img src="src/logo/HKUST.jpg" alt="Institution 1" style="width: 200px; height: 60px;">
        <img src="src/logo/mobvoi.jpg" alt="Institution 2" style="width: 200px; height: 60px;">
        <img src="src/logo/SJU.jpg" alt="Institution 3" style="width: 200px; height: 60px;">
    </p>
    <p>
        <img src="src/logo/NTU.jpg" alt="Institution 4" style="width: 200px; height: 60px;">
        <img src="src/logo/NPU.jpg" alt="Institution 5" style="width: 200px; height: 60px;">
        <img src="src/logo/SparkAudio2.jpg" alt="Institution 6" style="width: 200px; height: 60px;">
    </p>
    <p>
    </p>
    <a href="https://arxiv.org/pdf/2503.01710"><img src="https://img.shields.io/badge/Paper-ArXiv-red" alt="paper"></a>
    <a href="https://sparkaudio.github.io/spark-tts/"><img src="https://img.shields.io/badge/Demo-Page-lightgrey" alt="version"></a>
    <a href="https://huggingface.co/SparkAudio/Spark-TTS-0.5B"><img src="https://img.shields.io/badge/Hugging%20Face-Model%20Page-yellow" alt="Hugging Face"></a>
    <a href="https://github.com/SparkAudio/Spark-TTS"><img src="https://img.shields.io/badge/Platform-linux-lightgrey" alt="version"></a>
    <a href="https://github.com/SparkAudio/Spark-TTS"><img src="https://img.shields.io/badge/Python-3.12+-orange" alt="version"></a>
    <a href="https://github.com/SparkAudio/Spark-TTS"><img src="https://img.shields.io/badge/PyTorch-2.5+-brightgreen" alt="python"></a>
    <a href="https://github.com/SparkAudio/Spark-TTS"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="mit"></a>
</div>


## Spark-TTS 🔥

### Описание

Spark-TTS - это передовая система преобразования текста в речь, которая использует возможности больших языковых моделей (LLM) для высокоточного и естественного синтеза голоса. Она разработана как эффективная, гибкая и мощная система для использования как в научных исследованиях, так и в производстве.

### Основные преимущества

- **Простота и эффективность**: Построенный полностью на Qwen2.5, Spark-TTS устраняет необходимость в дополнительных моделях генерации, таких как согласование потоков. Вместо того чтобы полагаться на отдельные модели для генерации акустических характеристик, он напрямую восстанавливает звук из кода, предсказанного LLM. Такой подход упрощает процесс, повышая эффективность и снижая сложность.
- **Высококачественное клонирование голоса**: Поддерживает клонирование голоса с нулевым результатом, что означает, что он может воспроизвести голос диктора даже без специальных обучающих данных для этого голоса. Это идеально подходит для сценариев межъязыкового общения и переключения кодов, позволяя плавно переходить от одного языка к другому, не требуя отдельного обучения для каждого из них.
- **Поддержка на двух языках**: Поддерживает китайский и английский языки и способен клонировать голос с нулевого выстрела для межъязыковых сценариев и сценариев с переключением кодов, что позволяет модели синтезировать речь на нескольких языках с высокой естественностью и точностью.
- **Управляемая генерация речи**: Поддерживает создание виртуальных дикторов, настраивая такие параметры, как пол, высота тона и темп речи.

## Системные требования
|                       | Рекомендуемые | Минимальные |
|-----------------------|---------------|-------------|
| RAM                   | 8GB           | 2GB         |
| VRAM                  | 6GB           | 5GB         |
| CUDA                  | 12            | 11          |
| Free Hard Drive Space | 45GB          | 30GB        |
| OS                    | Docker        | Docker      |

## Установка
**Клонирование репозитория**

  Здесь приведены инструкции по установке с помощью [Docker](https://www.docker.com/). Другие варианты установки вы можете найти в [оффициальном репозитории](https://github.com/SparkAudio/Spark-TTS)


- Склонируйте репозиторий
``` sh
git clone https://github.com/Crocussys/Spark-TTS.git
cd Spark-TTS
```

**Скачивание модели**

```sh
mkdir -p pretrained_models

# Убедитесь, что у вас установлен git-lfs (https://git-lfs.com)
git lfs install

git clone https://huggingface.co/SparkAudio/Spark-TTS-0.5B pretrained_models/Spark-TTS-0.5B
```

**Используйте Docker**

- Выполните сборку образа

``` sh
docker build -t spark-tts --build-arg cuda_version=<CUDA_VERSION> .
```

Замените <CUDA_VERSION> на 118 (Если хотите использовать CUDA версии 11.8), 121 (Для CUDA 12.1) или 124 (Для CUDA 12.4)

## Запуск

**Запуск с вашими аргументами**

- Запустите контейнер с необходимыми параметрами

``` sh
docker run --rm --name spark-tts --gpus device=0 -v <YOUR_PATH>:/usr/src/app/shared --env-file args.list spark-tts
```

Замените <YOUR_PATH> на полный путь до общей деректории, куда можно монтировать промты и куда будет сохранён результат. Лучше всего создать новую директрорию:

```sh
mkdir -p shared
```

Вы также можете изменить аргументы запуска с помощью файла args.list

Или можете указывать аргументы напрямую из командной строки, например:
``` sh
--env text="This text was generated with spark tts!"
```

Таким образом ваша команда запуска может выглядить следующем образом

``` sh
docker run --rm --name spark-tts --gpus device=0 -v С:\\path\\to\\work\\dir\\shared:/usr/src/app/shared --env text="This text was generated with spark tts!" --env-file args.list spark-tts
```

Обратите внимание, что используется cuda device 0. Если вы хотите использовать иные или дополнительные устройства, измените аргумент --gpus и аргумент device в файле docker_run.sh

**Запуск теста**

- Запустите контейнер с аргументом test

``` sh
docker run --rm --name spark-tts --gpus device=0 -v <WORK_DIR>\\tests\\test1:/usr/src/app/tests/test1 --env test=true spark-tts
```

Замените <WORK_DIR> на полный путь до деректории с проектом

## Выполнение

**Nvidia Triton**

Теперь мы приводим пример развертывания Spark-TTS с Nvidia Triton и TensorRT-LLM. В таблице ниже представлены результаты бенчмарка на одном графическом процессоре L20 с использованием 26 различных пар prompt_audio/target_text (в общей сложности 169 секунд аудио):

| Модель | Заметки   | Количество потоков | Среднее время исполнения     | Коэффициент реального времени | 
|-------|-----------|-----------------------|---------|--|
| Spark-TTS-0.5B | [Code Commit](https://github.com/SparkAudio/Spark-TTS/tree/4d769ff782a868524f29e0be851ca64f8b22ebf1/runtime/triton_trtllm) | 1                   | 876.24 ms | 0.1362|
| Spark-TTS-0.5B | [Code Commit](https://github.com/SparkAudio/Spark-TTS/tree/4d769ff782a868524f29e0be851ca64f8b22ebf1/runtime/triton_trtllm) | 2                   | 920.97 ms | 0.0737|
| Spark-TTS-0.5B | [Code Commit](https://github.com/SparkAudio/Spark-TTS/tree/4d769ff782a868524f29e0be851ca64f8b22ebf1/runtime/triton_trtllm) | 4                   | 1611.51 ms | 0.0704|


Пожалуйста, ознакомьтесь с подробными инструкциями в [runtime/triton_trtllm/README.md](runtime/triton_trtllm/README.md ) для получения дополнительной информации.


## **Примеры**

Вот несколько демонстрационных роликов, созданных Spark-TTS с помощью клонирования голоса с нулевого снимка. Для получения большего количества демонстраций посетите наш [сайт](https://sparkaudio.github.io/spark-tts/).

---

<table>
<tr>
<td align="center">
    
**Donald Trump**
</td>
<td align="center">
    
**Zhongli (Genshin Impact)**
</td>
</tr>

<tr>
<td align="center">

[Donald Trump](https://github.com/user-attachments/assets/fb225780-d9fe-44b2-9b2e-54390cb3d8fd)

</td>
<td align="center">
    
[Zhongli](https://github.com/user-attachments/assets/80eeb9c7-0443-4758-a1ce-55ac59e64bd6)

</td>
</tr>
</table>

---

<table>

<tr>
<td align="center">
    
**陈鲁豫 Chen Luyu**
</td>
<td align="center">
    
**杨澜 Yang Lan**
</td>
</tr>

<tr>
<td align="center">
    
[陈鲁豫Chen_Luyu.webm](https://github.com/user-attachments/assets/5c6585ae-830d-47b1-992d-ee3691f48cf4)
</td>
<td align="center">
    
[Yang_Lan.webm](https://github.com/user-attachments/assets/2fb3d00c-abc3-410e-932f-46ba204fb1d7)
</td>
</tr>
</table>

---


<table>
<tr>
<td align="center">
    
**余承东 Richard Yu**
</td>
<td align="center">
    
**马云 Jack Ma**
</td>
</tr>

<tr>
<td align="center">

[Yu_Chengdong.webm](https://github.com/user-attachments/assets/78feca02-84bb-4d3a-a770-0cfd02f1a8da)

</td>
<td align="center">
    
[Ma_Yun.webm](https://github.com/user-attachments/assets/2d54e2eb-cec4-4c2f-8c84-8fe587da321b)

</td>
</tr>
</table>

---


<table>
<tr>
<td align="center">
    
**刘德华 Andy Lau**
</td>
<td align="center">

**徐志胜 Xu Zhisheng**
</td>
</tr>

<tr>
<td align="center">

[Liu_Dehua.webm](https://github.com/user-attachments/assets/195b5e97-1fee-4955-b954-6d10fa04f1d7)

</td>
<td align="center">
    
[Xu_Zhisheng.webm](https://github.com/user-attachments/assets/dd812af9-76bd-4e26-9988-9cdb9ccbb87b)

</td>
</tr>
</table>


---

<table>
<tr>
<td align="center">
    
**哪吒 Nezha**
</td>
<td align="center">
    
**李靖 Li Jing**
</td>
</tr>

<tr>
<td align="center">

[Ne_Zha.webm](https://github.com/user-attachments/assets/8c608037-a17a-46d4-8588-4db34b49ed1d)
</td>
<td align="center">

[Li_Jing.webm](https://github.com/user-attachments/assets/aa8ba091-097c-4156-b4e3-6445da5ea101)

</td>
</tr>
</table>


## ⚠️ Отказ от ответственности

Этот проект предоставляет модель TTS для клонирования голоса, предназначенную для академических исследований, образовательных целей и законных приложений, таких как персонализированный синтез речи, вспомогательные технологии и лингвистические исследования.

Обратите внимание:

- Не используйте эту модель для несанкционированного клонирования голоса, выдачи себя за другого человека, мошенничества, аферы, подделок или любой незаконной деятельности.

- Обеспечьте соблюдение местных законов и правил при использовании этой модели и придерживайтесь этических стандартов.

- Разработчики не несут никакой ответственности за любое неправильное использование этой модели.

Мы выступаем за ответственное развитие и использование ИИ и призываем сообщество придерживаться принципов безопасности и этики при проведении исследований и применении ИИ. Если у вас есть какие-либо опасения по поводу этики или неправильного использования, пожалуйста, свяжитесь с нами.
