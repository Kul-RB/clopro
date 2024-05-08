# Задание
1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.
4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

# Решение
## Создать бакет Object Storage и разместить в нём файл с картинкой
![image](https://github.com/Kul-RB/clopro/assets/53901269/673e5188-5dec-43d5-b310-733e4ed3ab72)

![image](https://github.com/Kul-RB/clopro/assets/53901269/68d0598e-3724-4597-b376-971818e0d619)

![image](https://github.com/Kul-RB/clopro/assets/53901269/67234258-6083-4517-bb7b-860efe6c76a6)

![image](https://github.com/Kul-RB/clopro/assets/53901269/ce90ae19-352d-49f1-91d7-bc70d0234987)

## Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета

![image](https://github.com/Kul-RB/clopro/assets/53901269/11a2ec1d-cc50-4a34-9788-d9fd3e052fc1)

![image](https://github.com/Kul-RB/clopro/assets/53901269/cdcf6eda-0c89-4ccb-af68-102600326aca)

![image](https://github.com/Kul-RB/clopro/assets/53901269/d8118912-152e-47d5-a092-b97bce8d0f10)

![image](https://github.com/Kul-RB/clopro/assets/53901269/be306ce0-7101-4a2e-8541-0ba4ad509420)

![image](https://github.com/Kul-RB/clopro/assets/53901269/b43d93ed-1fa7-41eb-959f-f35cb1b3d008)

## Подключить группу к сетевому балансировщику

![image](https://github.com/Kul-RB/clopro/assets/53901269/5a091f89-64a2-47e9-b088-22578b68078c)

![image](https://github.com/Kul-RB/clopro/assets/53901269/84610f8c-f317-4ef5-ae03-9a80eaf93981)

![image](https://github.com/Kul-RB/clopro/assets/53901269/6c5306dd-d796-45e0-9d62-4e7ce91ae30d)

![image](https://github.com/Kul-RB/clopro/assets/53901269/7da50035-0bd9-4b0f-81ac-46bf7b9440d7)

## Создать Application Load Balancer с использованием Instance group и проверкой состояния
![image](https://github.com/Kul-RB/clopro/assets/53901269/58b26897-51ca-4c4e-a88e-c3128b5d54a2)

![image](https://github.com/Kul-RB/clopro/assets/53901269/9de25129-f317-4f5c-82e3-d4232013d0eb)

![image](https://github.com/Kul-RB/clopro/assets/53901269/c8463748-26cc-4184-b553-ececf501c9df)

![image](https://github.com/Kul-RB/clopro/assets/53901269/6b595ad1-9bb6-4d48-afd9-588de0740b65)

![image](https://github.com/Kul-RB/clopro/assets/53901269/a9cf82bd-c5e0-44e5-b82a-946e484e3ac8)

![image](https://github.com/Kul-RB/clopro/assets/53901269/6352aba5-1609-4b78-bbad-5de59138107f)

![image](https://github.com/Kul-RB/clopro/assets/53901269/faaf3405-ad8c-40b4-8b20-d978dcf41b82)

![image](https://github.com/Kul-RB/clopro/assets/53901269/88caf1ef-ee02-4d4c-adb3-d0a0a007d809)

![image](https://github.com/Kul-RB/clopro/assets/53901269/345bac55-0b24-4541-aced-eb94c5f96c3d)

![image](https://github.com/Kul-RB/clopro/assets/53901269/378f51c5-4f23-4dfe-af95-fead0a1d72a1)




