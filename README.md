# Задание
1. Настроить с помощью Terraform кластер баз данных MySQL.

 - Используя настройки VPC из предыдущих домашних заданий, добавить дополнительно подсеть private в разных зонах, чтобы обеспечить отказоустойчивость. 
 - Разместить ноды кластера MySQL в разных подсетях.
 - Необходимо предусмотреть репликацию с произвольным временем технического обслуживания.
 - Использовать окружение Prestable, платформу Intel Broadwell с производительностью 50% CPU и размером диска 20 Гб.
 - Задать время начала резервного копирования — 23:59.
 - Включить защиту кластера от непреднамеренного удаления.
 - Создать БД с именем `netology_db`, логином и паролем.

2. Настроить с помощью Terraform кластер Kubernetes.

 - Используя настройки VPC из предыдущих домашних заданий, добавить дополнительно две подсети public в разных зонах, чтобы обеспечить отказоустойчивость.
 - Создать отдельный сервис-аккаунт с необходимыми правами. 
 - Создать региональный мастер Kubernetes с размещением нод в трёх разных подсетях.
 - Добавить возможность шифрования ключом из KMS, созданным в предыдущем домашнем задании.
 - Создать группу узлов, состояющую из трёх машин с автомасштабированием до шести.
 - Подключиться к кластеру с помощью `kubectl`.
 - *Запустить микросервис phpmyadmin и подключиться к ранее созданной БД.
 - *Создать сервис-типы Load Balancer и подключиться к phpmyadmin. Предоставить скриншот с публичным адресом и подключением к БД.

# Решение
1. 
1.1 ![image](https://github.com/Kul-RB/clopro/assets/53901269/a029ce55-1a0b-4fc9-8edd-bd144b99db67)

![image](https://github.com/Kul-RB/clopro/assets/53901269/47ff8b06-aec9-4ab6-9af0-fc8bf02d9157)

1.2 ![image](https://github.com/Kul-RB/clopro/assets/53901269/1d6dd2eb-69e5-4d7d-9bc0-e5c88672710d)

1.3 ![image](https://github.com/Kul-RB/clopro/assets/53901269/6fc1e20d-d32e-4f66-bbdc-abe39f7f5b1a)

1.4 ![image](https://github.com/Kul-RB/clopro/assets/53901269/870daba4-343b-4052-8a2f-7ac440855bca)

1.5 ![image](https://github.com/Kul-RB/clopro/assets/53901269/c4b634a1-0b2c-45e0-b11c-db833ecf1ebd)

1.6 ![image](https://github.com/Kul-RB/clopro/assets/53901269/9e661cc3-f72f-4e41-8309-4ea85e0b0ad2)

1.7 ![image](https://github.com/Kul-RB/clopro/assets/53901269/7fb678e3-3d62-4d3f-82a0-d56d0cf902e2)

2. 
2.1 ![image](https://github.com/Kul-RB/clopro/assets/53901269/c576503f-f048-42cd-b82e-23d0d19d1b21)

![image](https://github.com/Kul-RB/clopro/assets/53901269/47ff8b06-aec9-4ab6-9af0-fc8bf02d9157)

2.2 ![image](https://github.com/Kul-RB/clopro/assets/53901269/fb51e70d-d250-4971-a415-ff75ab6a1c9d)

2.3 ![image](https://github.com/Kul-RB/clopro/assets/53901269/a7324d5c-10aa-4e09-89df-e424308e787e)

2.4 ![image](https://github.com/Kul-RB/clopro/assets/53901269/dde813c4-3ec0-4e3a-b151-c4acfc97117e)

![image](https://github.com/Kul-RB/clopro/assets/53901269/f34e61af-2c87-433b-bf6e-e512fb0bd893)

2.5 ![image](https://github.com/Kul-RB/clopro/assets/53901269/03bc9b50-ef64-4a67-b069-664a0e3833c9)

![image](https://github.com/Kul-RB/clopro/assets/53901269/46e25997-e48f-4a8b-869e-f370e02ddad4)

2.6 ![image](https://github.com/Kul-RB/clopro/assets/53901269/e5768d8f-5cb7-4670-860f-97a96096c8a6)

![image](https://github.com/Kul-RB/clopro/assets/53901269/a55ceae3-3f00-43f5-8ddd-76c99c3413d1)

2.7 ![image](https://github.com/Kul-RB/clopro/assets/53901269/d783521c-6808-4979-a804-dc03261d1218)

2.8 ![image](https://github.com/Kul-RB/clopro/assets/53901269/014fc1e6-84b3-4fab-b486-abdf75596b06)
