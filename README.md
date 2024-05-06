# Задание 1 
1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

# Решение
1. ![image](https://github.com/Kul-RB/clopro/assets/53901269/cc91c266-ef66-4455-82ce-69b0837dd54b)

![image](https://github.com/Kul-RB/clopro/assets/53901269/79bd4c2c-e4cc-4b42-a002-49d18ccde068)

2.
2.1 ![image](https://github.com/Kul-RB/clopro/assets/53901269/28dbb08e-87a7-41c4-aaf0-8cf931fe82fe)

![image](https://github.com/Kul-RB/clopro/assets/53901269/68fc0d58-f53e-438e-ada7-2ccd514ddac2)

2.2 ![image](https://github.com/Kul-RB/clopro/assets/53901269/83845afb-9699-4e36-bb14-a79b482b4ef9)

![image](https://github.com/Kul-RB/clopro/assets/53901269/9b076ca6-97af-4b42-b56e-b0ba06d3134e)

2.3 ![image](https://github.com/Kul-RB/clopro/assets/53901269/f032d6a9-7eac-447a-b77c-1e997858182d)

![image](https://github.com/Kul-RB/clopro/assets/53901269/1ffa7522-b5ad-4f14-8d1e-385122f8b177)

![image](https://github.com/Kul-RB/clopro/assets/53901269/e86a459d-5633-4bd5-a940-f05a514a87d1)

3.
3.1 ![image](https://github.com/Kul-RB/clopro/assets/53901269/e2e8ddc4-c022-4bf3-952b-161a1c3c17a6)

![image](https://github.com/Kul-RB/clopro/assets/53901269/09175e77-bee3-4b46-a818-a040a6d1ddaa)

3.2 ![image](https://github.com/Kul-RB/clopro/assets/53901269/d61bfec2-1e2e-4351-b57f-13674909c148)

![image](https://github.com/Kul-RB/clopro/assets/53901269/612b28e4-dd3c-421c-a2b7-a62af6cb3eb8)

3.3 ![image](https://github.com/Kul-RB/clopro/assets/53901269/ac93586e-8c35-40db-b469-ac65ec112df4)

![image](https://github.com/Kul-RB/clopro/assets/53901269/ca1b6c51-7952-4076-bdf4-dbdf2fc74169)

![image](https://github.com/Kul-RB/clopro/assets/53901269/7f426d5d-cbef-4b04-8355-55f89d80b7a7)

![image](https://github.com/Kul-RB/clopro/assets/53901269/045909c9-a95c-49f4-aa23-73f05a745264)





