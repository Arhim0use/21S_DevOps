# Замечания: 1. (часть 2) выбрать вариацию скриншотов; 2. проверить часть 3 по тетради 3. часть 5 проверить по тетради 4.  часть 7 доделать скрины 
# Операционные системы UNIX/Linux.

Установка и обновления системы Linux. Основы администрирования.

Проект School 21 D01_Linux-1


  1 [Установка ОС](#part-1-установка-ос)  
  2 [Создание пользователя](#part-2-создание-пользователя)  
  3 [Настройка сети ОС](#part-3-настройка-сети-ос)   
  4 [Обновление ОС](#part-4-обновление-ос)  
  5 [Использование команды  sudo](#part-5-использование-команды-sudo)  
  6 [Установка и настройка службы времени](#part-6-установка-и-настройка-службы-времени)  
  7 [Установка и использование текстовых редакторов](#part-7-установка-и-использование-текстовых-редакторов)  
  8 [Установка и базовая настройка сервиса SSHD](#part-8-установка-и-базовая-настройка-сервиса-sshd)   
  9 [Установка и использование утилит top, htop](#part-9-установка-и-использование-утилит-top-htop)   
  10 [Использование утилиты fdisk](#part-10-использование-утилиты-fdisk)   
  11 [Использование утилиты df](#part-11-использование-утилиты-df)    
  12 [Использование утилиты du](#part-12-использование-утилиты-du)    
  13 [Установка и использование утилиты ncdu](#part-13-установка-и-использование-утилиты-ncdu)    
  14 [Работа с системными журналами](#part-14-работа-с-системными-журналами)     
  15 [Использование планировщика заданий CRON](#part-15-использование-планировщика-заданий-cron)    


## Part 1. Установка ОС

> ##### Установить **Ubuntu 20.04 Server LTS** без графического интерфейса. (Используем программу для виртуализации - VirtualBox)

<details>  <summary> 
  Проверяем версию операционной сиситемы.  </summary> 

 ![installed_version](img/001-install_version_1.png) 
 </details>


## Part 2. Создание пользователя

> ##### Создать пользователя, отличного от пользователя, который создавался при установке. Пользователь должен быть добавлен в группу `adm`.

<details>  <summary> 
  Выбрать один из двух вариантов скриншотов.  </summary> 

![new_user_creation](img/003-new_user.png)

![new_user](img/004-new_user.png)
</details>

<details>  <summary> 
  Создаем нового пользователя.  </summary> 

  ![new_user_grep](img/005-new_user_usermod.png)
</details>

## Part 3. Настройка сети ОС
> ##### Задать название машины вида user-1  
> ##### Установить временную зону, соответствующую вашему текущему местоположению.  
> ##### Вывести названия сетевых интерфейсов с помощью консольной команды.
> ##### В отчёте дать объяснение наличию интерфейса lo.  
> ##### Используя консольную команду получить ip адрес устройства, на котором вы работаете, от DHCP сервера. 
> ##### В отчёте дать расшифровку DHCP.  
> ##### Определить и вывести на экран внешний ip-адрес шлюза (ip) и внутренний IP-адрес шлюза, он же ip-адрес по умолчанию (gw). 
> ##### Задать статичные (заданные вручную, а не полученные от DHCP сервера) настройки ip, gw, dns (использовать публичный DNS серверы, например 1.1.1.1 или 8.8.8.8).  
> ##### Перезагрузить виртуальную машину. Убедиться, что статичные сетевые настройки (ip, gw, dns) соответствуют заданным в предыдущем пункте.  

 - Проверяем текущее имя машины, далее "mashine_name", командой `hostnamectl`.
 - Устанавливаем новое mashine_name командой `set-hostname new_mashine_name` где `new_mashine_name` новое имя, которое мы хотим установить.
 - Проверяем что все сработало командой `hostname`.

<details>  <summary> 
  Процесс изменения mashine_name.  </summary>

  ![check_set_mashinename](img/006-check_set_mashinename.png)
</details>

 - Узнать текущее время и часовой пояс можно командой `date`. Последний столбец в строке говорит какой часовой пояс сейчас установлен на нашей машине. Так же можно узнать часовой пояс командой `timedatectl` в строке *Time zone:* будет указан часовой пояс.

<details>  <summary> 
  Узнать текущее время и часовой пояс.  </summary>

  ![check_set_time_zone](img/007-check_time.png)
</details>

 - Чтобы установить часовой пояс воспользуемся командой `sudo timedatectl set-timezone Europe/Moskow`, если нужен часовой пояс отличный от выбранного мной то с помощью команды `timedatectl list-timezones` можно узнать другие возможные часовые пояса.

<details>  <summary> 
  Установить часовой пояс.  </summary>

  ![check_set_time_zone](img/008-set_timezone.png)
 - Проверяем что установка часового пояса произошла успешно командой `date`.
</details>


<details>  <summary> 
  Сетевые интерфейсы.  </summary>

  ![network_interfaces](img/009-check_network_interface.png)
</details>


  Интерфейс **lo** - *(loopback device)* обозначает виртуальный интерфейс для запуска и отладки сетевых программ на локалной машине, он по умолчанию имеет адрес 127.0.0.1. Он может быть использован сетевым клиентским программным обеспечением, чтобы общаться с серверным приложением, расположенным на том же компьютере. Он уже настроен и доступен в Linux по умолчанию, и вам не нужно ничего дополнительно настраивать.

- Чтобы получить IP-адрес устройства, с которым вы работаете, от сервера DHCP. Используйте команду `hostname -I`.

  ![internal_ip_1](img/010-check_dhcp_ip.png)

 - Определить внутренний ip адрес устройства можно командой `ip address show` или устаревшей командой `ifconfig`.

<details>  <summary> 
  Внутренний ip адресс устройства.  </summary>


  ![internal_ip_2](img/009-check_network_interface_and_internal_ip.png)
  ![internal_ip_3](img/011-internal_ip.png)
</details>

 - Что бы определить внешний ip адрес устройства нужно воспользоваться командой `curl ifconfig.me`, где **curl** служебная программа которая позволяет связываться с различными сервисами для получения сетевой информации.

<details>  <summary> 
  Внешний ip адресс устройства.  </summary>

  ![external_ip_1](img/011-external_ip.png)
  ![external_ip_2](img/012-external_more.png)
  - Так же можно воспользоваться командой `wget` и сервисами `eth0.me` или `ident.me` которая создает файл **index.html** при прочтении которого можно узнать внешний ip.
</details>

 DHCP - *(англ. Dynamic Host Configuration Protocol — протокол динамической настройки узла)* это сетевой протокол для автоматизации присвоения IP адреса маршрутизатора, IP адреса DNS сервера, масок, доменного имени устройства и другое. Защищает сеть от дублирования IP адресов. Протокол DHCP используется в большинстве сетей TCP/IP.

> *Сетевой протокол – это набор правил и последовательных действий. Исходя из них, устройства, которые находятся в сети, соединяются и обмениваются данными между собой.*

 - Для того что бы задать статичные IP адреса открываем через текстовый редактор vim, nano или что-либо иное файл  из директории /etc/netplan/.
 
 `sudo vim /etc/netplan/00-installer-config.yaml`

- Выключаем протокол dhcp4.

`dhcp4: false`

- Дописывем строки:

`addresses:`              
`gateway4:`              
`nameservers:`                
`addresses:`

 - Перезагружаем машину командой `reboot` и проверяем что заданные настройки были сохранены  `cat /etc/netplan/00-installer-config.yaml`
  
  ![static_ip_1](img/013-set_static_ip.png)
<details>  <summary> 
  Ping 1.1.1.1  </summary>

  ![ping_1.1.1.1](img/014-ping_1.1.1.1.png)
</details>
<details>  <summary> 
  Ping ya.ru  </summary>

  ![ping_ya.ru](img/015-ping_ya.ru.png)
</details>

## Part 4. Обновление ОС

> ##### Обновить системные пакеты до последней на момент выполнения задания версии.  

 - Обновляем системные пакеты командой `sudo apt-get upgrade`.

  ![update_OS](img/016-update_packeges.png)

## Part 5. Использование команды **sudo**

> ##### Разрешить пользователю, созданному в [Part 2](#part-2-создание-пользователя), выполнять команду sudo.

- В отчёте объяснить *истинное* назначение команды sudo (про то, что это слово - "волшебное", писать не стоит).  

 - Заходим в учетную запись пользователя которого мы создали на [шаге 2].

  ![go_to_feleciag_2](img/017-go_to_another_user.png)
 - Проверяем текущее имя пользователя.

  ![check_hostname](img/018-check_hostname.png)
 - Изменяем имя машины из под второго пользователя и проверяем что измения сохранились.

  ![set_new_hostname](img/019-set_new_hostname.png)


## Part 6. Установка и настройка службы времени

> ##### Настроить службу автоматической синхронизации времени.  
  ![go_to_feleciag_2](img/020-check_time_sinchron.png)

## Part 7. Установка и использование текстовых редакторов 

> ##### Установить текстовые редакторы **VIM** (+ любые два по желанию **NANO**, **MCEDIT**, **JOE** и т.д.)  
> ##### Используя каждый из трех выбранных редакторов, создайте файл *test_X.txt*, где X -- название редактора, в котором создан файл. Напишите в нём свой никнейм, закройте файл с сохранением изменений. 
> ##### Используя каждый из трех выбранных редакторов, откройте файл на редактирование, отредактируйте файл, заменив никнейм на строку "21 School 21", закройте файл без сохранения изменений.
> ##### Используя каждый из трех выбранных редакторов, отредактируйте файл ещё раз (по аналогии с предыдущим пунктом), а затем освойте функции поиска по содержимому файла (слово) и замены слова на любое другое.

- Что бы начать работать с текстовым файлом не обязательно предварительно его создавать, комады текстовых редакторов могут создать и сразу войти в файл для редактирования. Например вводим команду `vim test_vim_2.txt`, и сразу оказываемся в окне рдактирвания. Для начала редактирвания файла через **vim** нажмите клавишу `I`, что бы выйти из режима редактирования, и в последствии выйти из файла, нажмите `esc`. 
<details>  <summary> 
  Текстовый редактор Vim  </summary>

  ![text_editors_vim_1](img/021-text_editors_vim_1.png)
  ![text_editors_vim_2](img/021-text_editors_vim_2.png)
  ![text_editors_vim_3](img/021-text_editors_vim_3.png)
</details>

 - Что бы сохранить изменения и выйти есть несколько способов, например:
   1) Способ - комбинация клавиш `Shift + Z + Z`, которая сохранит файл и вернет нас в рабочую зону терминала. 
   2) Способ - вводим `:wq`, где после `:` спецсимвол после которого могут идти различные команды, `w` - сохранить изменения, `q` - выйти из файла.
<details>  <summary> 
  Способ №2  </summary>

  ![text_editors_vim_4](img/021-text_editors_vim_4.png)
  ![text_editors_vim_5](img/021-text_editors_vim_5.png)
</details>
  
 - Повторим наши операции в редакторе  **nano**. В отличии от **vim**, здесь можно сразу начать редактирование файла сразу после входа. Сохранить изменения в файле можно комбинацией `^O` или при выходе из файла.
<details>  <summary> 
  Текстовый редактор Nano  </summary>

   ![text_editors_nano_1](img/021-text_editors_nano_1.png)
   ![text_editors_nano_2](img/021-text_editors_nano_2.png)
</details>

 - Для выхода испозьзуем комбинацию `^X`, после чего редактор спросит нужно ли сохранть изменения. Нажимаем `Y` - подтвердить. После чего будет предложена возможность поменять имя файла в который мы сохраняем изменения.

  ![text_editors_nano_3](img/021-text_editors_nano_3.png)
  ![text_editors_nano_4](img/021-text_editors_nano_4.png)

 - Теперь проделам те же операции в текстовом редакторе **joe**. Здесь, как и в **nano**, печатать можно сразу при в ходе в редактор. Для сохранения файла используем комбинацию `^K - D` и `^K - X` для выхода. При выходе будет предложено изменить имя файла, просто нажимаем `Enter` если нас все устраивает.
<details>  <summary> 
  Текстовый редактор Joe  </summary>

  ![text_editors_joe_1](img/021-text_editors_joe_1.png)
  ![text_editors_joe_2](img/021-text_editors_joe_2.png)
  ![text_editors_joe_3](img/021-text_editors_joe_3.png)
</details>

 Что делать если не хочется сохранять изменения.

  ![text_editors](img/021-text_editors.png)
  - **В текстовом редактроре *vim* достаточно при выходе написать `:q!`**

<details>  <summary> 
  Vim выход без сохранения  </summary>

  ![vim_21school21](img/022-vim_21school21.png)
  ![vim_21school21_exit](img/022-vim_21school21_exit.png)
  ![vim_nosave_file](img/023-vim_nosave_file.png)
</details>

  - **В текстовом редакторе *nano* выходим сочетанием `^X` и `N` что бы не сохранять изменения**

<details>  <summary> 
  Nano выход без сохранения  </summary>

  ![nano_21school21](img/024-nano_21school21.png)
  ![nano_nosave_file](img/025-nano_nosave_file.png)
</details>

  - **В текстовом редакторе *joe* выходим сочетание `^C` и `Y` что бы не сохранять изменения**
<details>  <summary> 
  Joe выход без сохранения  </summary>

  ![joe_21school21](img/026-joe_21school21.png)
  ![joe_nosave_file](img/027-joe_nosave_file.png)
</details>

 Для поиска текста в файле.

  - **В текстовом редактроре *vim* пишем команду `:s/desired/replacement` где *desired* -  искомое *replacement* - то на что мы хотим заменить. Для замены всех совпадений в строке `:s/desired/replacement/g` дописываем `g`. Для замены всех совпадений `:%s/desired/replacement/g` дописываем `%` в начале строки.**

<details>  <summary> 
  Vim поиск и замена  </summary>

  ![vim_find_and_replase_1](img/035-vim_find_and_replase_1.png)
  ![vim_find_and_replase_2](img/036-vim_find_and_replase_2.png)
  ![vim_find_and_replase_3](img/037-vim_find_and_replase_3.png)
  ![vim_find_and_replase_4](img/038-vim_find_and_replase_4.png)
</details>

  - **В текстовом редакторе *nano* для поиска используем сочетанием `^\` и вводим искомое и на что заменить после чего подтверждаем операцию**

<details>  <summary> 
  Nano поиск и замена  </summary>

  ![nano_find_and_replase_1](img/039-nano_find_and_replase_1.png)
  ![nano_find_and_replase_2](img/040-nano_find_and_replase_2.png)
  ![nano_find_and_replase_3](img/041-nano_find_and_replase_3.png)
  ![nano_find_and_replase_4](img/042-nano_find_and_replase_4.png)
  ![nano_find_and_replase_5](img/043-nano_find_and_replase_5.png)
  ![nano_find_and_replase_6](img/044-nano_find_and_replase_6.png)
  ![nano_find_and_replase_7](img/046-nano_find_and_replase_7.png)
  ![nano_find_and_replase_8](img/046-nano_find_and_replase_8.png)
</details>

  - **В текстовом редакторе *joe*  для поиска используем сочетание `^K - F` вводим искомое, через клавишу `b` устанавливаеи курсор на том что хотим заменить `r` что бы ввести на что хотим заменить и `y`/`n` для подтверждения/отмены изменения**

<details>  <summary> 
  Joe поиск и замена  </summary>

  ![joe_find_and_replase_1](img/028-joe_find_and_replase_1.png)
  ![joe_find_and_replase_2](img/029-joe_find_and_replase_2.png)
  ![joe_find_and_replase_3](img/030-joe_find_and_replase_3.png)
  ![joe_find_and_replase_4](img/031-joe_find_and_replase_4.png)
  ![joe_find_and_replase_5](img/032-joe_find_and_replase_5.png)
  ![joe_find_and_replase_6](img/033-joe_find_and_replase_6.png)
  ![joe_find_and_replase_7](img/034-joe_find_and_replase_7.png)
</details>


## Part 8. Установка и базовая настройка сервиса **SSHD**

> ##### Установить службу SSHd.  
> ##### Добавить автостарт службы при загрузке системы.  
> ##### Перенастроить службу SSHd на порт 2022.  
> ##### Используя команду ps, показать наличие процесса sshd. > Для этого к команде нужно подобрать ключи.

 - Устанавливаем службу "" командой `sudo apt-get install ssh`.
 - Изменяем порт работы SSH службы на 2022
<details>  <summary> 
  Файл конфигурации SSH службы </summary>

 ![sshd_config](img/049-sshd_config.png)
</details>

 - перезапускаем ssh службу что бы измененмя вступили в силу
 ![ssh_restart](img/047-ssh_restart.png)
 - Запускаем команду `ps -Af | grep ssh` для поиска процесса `ssh` испольщуем команду.
 В команде `ps -Af | grep ssh` флаг:
   - `A` - показывает все процессы
   - `f` - показывает всю информацию по процессу
   - командой  `|grep ssh` выделяем нужное
![ps_keys](img/048-ps_keys.png)

 - Запускаем команду `netstat -tan`.
 В команде `netstat -tan` флаг:
   - `a` - Отображение всех подключений и ожидающих портов.
   - `t` - Выделят все ТСР соединения.
   - `n` - Отображение адресов и номеров портов в числовом формате. 
![netstat_-tan](img/050-netstat_-tan.png)
   - `Proto`: имя протокола (протокол TCP или протокол UDP);
   - `recv-Q`: очередь на получение сети;
   - `end-Q`: очередь на отправку сети; 
   - `Local Address`: адрес локального компьютера и номер используемого порта;
   - `Foreign` Address: адрес и номер удаленного компьютера, к которому подключен сокет;
   - `State`: состояние сокета;
   - `0.0.0.0` - означает IP-адрес локального компьютера.

## Part 9. Установка и использование утилит **top**, **htop**


> ##### Установить и запустить утилиты top и htop.  


 - uptime: 20min
 - количество авторизованных пользователей: 1
 - общая загрузку системы: 0.00, 0.00, 0.00

![top_uptime_users_system_load](img/052-top_uptime_users_system_load.png)
 - общее количество процессов: 91

![proccess](img/053-proccess.png)
 - загрузкa cpu: 0.0 us, 0.0 sy, 0.0 ni
 - загрузкa памяти: 5827.0 total

![CPU_MEM_load](img/054-CPU_MEM_load.png)
 - pid процесса занимающего больше всего памяти: 661
<details>  <summary> 
  Вывод команды top </summary>

![PID_MEM_PID_CPU](img/055-PID_MEM_PID_CPU.png)
</details>

 - pid процесса, занимающего больше всего процессорного времени: 0.3
![top_all](img/056-top_all.png)

- В отчёт вставить скрин с выводом команды htop:

<details>  <summary> 
  Вывод команды htop отсортированная по PID, PERCENT_CPU, PERCENT_MEM, TIME</summary>
    
    -сортировка по PID 

![htop_sort_by_PID](img/057-htop_sort_by_PID.png)
    -сортировка по PERCENT_CPU

![htop_sort_by_PER_CPU](img/058-htop_sort_by_PER_CPU.png)
    -сортировка по PERCENT_MEM

![htop_sort_by_PER_MEM](img/059-htop_sort_by_PER_MEM.png)
    -сортировка по TIME

![htop_sort_by_TIME](img/060-htop_sort_by_TIME.png)
</details>

<details>  <summary> 
  Вывод команды htop отфильтрованный для процесса sshd</summary>

![filter_sshd](img/061-filter_sshd.png)
</details>

<details>  <summary> 
  Вывод команды htop с процессом syslog</summary>

![search_syslog](img/062-search_syslog.png)
</details>

<details>  <summary> 
  Вывод команды htop с добавленным выводом hostname, clock и uptime</summary>

![htop_clock_uptime_hostname](img/063-htop_clock_uptime_hostname.png)
</details>

## Part 10. Использование утилиты **fdisk**

> ##### Запустить команду fdisk -l.
- В отчёте написать название жесткого диска, его размер и количество секторов, а также размер swap.
<details>  <summary> 
  Вывод команды fdisk_-l</summary>

![fdisk_-l](img/064-fdisk_-l.png)
</details>

  - Наименование жесткого диска /dev/sba
  - Размер жесткого диска:
    - В Gb 8
    - В bytes 8589934592
  - Количество секторов 16777216
  - Swap

![swap](img/065-swap.png)

## Part 11. Использование утилиты **df** 

> ##### Запустить команду df. 
> ##### Запустить команду df -Th.

<details>  <summary> 
  Вывод команды df </summary>

![df](img/066-df.png)
</details>

 - Размер корнегого раздела: 6352332 Kbytes
 - Размер занятого пространства: 2745500 Kbytes
 - Размер свободного пространства: 3262976 Kbytes
 - Процент использования: 46%

<details>  <summary> 
  Вывод команды df -Th</summary>

![df](img/067-df_-Th.png)
</details>

 - размер раздела: 6.1 Gbytes
 - размер занятого пространства: 2.7 Gbytes
 - размер свободного пространства: 3.2 Gbytes
 - процент использования: 46%

## Part 12. Использование утилиты **du**

> ##### Запустить команду du.
> ##### Вывести размер папок /home, /var, /var/log (в байтах, в человекочитаемом виде)
> ##### Вывести размер всего содержимого в /var/log (не общее, а каждого вложенного элемента, используя *)
 - Для печати в человекочитаемом виде используем флаг `-h`.
<details>  <summary> 
  Вывод команды du и du -h</summary>

![du_home](img/070-du_home.png)
![du_var](img/071-du_var.png)
![du_var_-h](img/072-du_var_-h.png)
![du_var_log](img/073-du_var_log.png)
![du_var_log_star](img/073-du_var_log_star.png)
</details>

## Part 13. Установка и использование утилиты **ncdu**

> ##### Установить утилиту ncdu.
> ##### Вывести размер папок /home, /var, /var/log.

<details>  <summary> 
  Вывод команды ncdu </summary>

![ncdu_command](img/075-ncdu_command.png)
![ncdu_home](img/074-ncdu_home.png)
</details>
<details>  <summary> 
  Вывод команды ncdu /var/</summary>

![ncdu_var_command](img/076-ncdu_var_command.png)
![ncdu_var](img/077-ncdu_var.png)
</details>
<details>  <summary> 
  Вывод команды ncdu /log/</summary>

![ncdu_vat_log_command](img/078-ncdu_vat_log_command.png)
![ncdu_var_log](img/079-ncdu_var_log.png)
</details>
## Part 14. Работа с системными журналами

> ##### Открыть для просмотра:
> ##### 1. /var/log/dmesg
> ##### 2. /var/log/syslog
> ##### 3. /var/log/auth.log  

- Время последней успешной авторизации: Jul 24 20:51:53
- Имя пользователя: user_feleciag
- Метод входа в систему: pam_unix

![last_succes_login_time](img/080-last_succes_login_time.png)
![last_sudo_auth](img/081-last_sudo_auth.png)
- Перезапустить службу SSHd.

![resrtart_sshd](img/082-resrtart_sshd.png)
- Вставить в отчёт скрин с сообщением о рестарте службы (искать в логах).

![ssh_logs](img/083-ssh_logs.png)

## Part 15. Использование планировщика заданий **CRON**

> ##### Используя планировщик заданий, запустите команду uptime через каждые 2 минуты.
> ##### Удалите все задания из планировщика заданий.

![df](img/085-cron.png)
![df](img/086-crone_uptime.png)
![df](img/087-del_crone.png)


``