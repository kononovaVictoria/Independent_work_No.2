﻿//Соответствие в 1С 8.3 - это коллекция пар Ключ (любой тип данных) + Значение (любой тип данных).

&НаКлиенте
Процедура ЗаполнитьСоответсвиеДаннымиПоУмолчанию(Команда)
	
	СоответсвиеМесяцы = Новый Соответствие;
	ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы);
	СообщитьДанныеВСоответвии(СоответсвиеМесяцы);
	
КонецПроцедуры

&НаКлиенте
Процедура ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы)
	
	СоответсвиеМесяцы.Вставить(1, "Январь");
	СоответсвиеМесяцы.Вставить("Февраль", 2);
	СоответсвиеМесяцы.Вставить("Март",    3);
	СоответсвиеМесяцы.Вставить("Апрель",  4);
	СоответсвиеМесяцы.Вставить("Май",     5);
	СоответсвиеМесяцы.Вставить("Июнь",    6);
	СоответсвиеМесяцы.Вставить("Июль",    7);
	СоответсвиеМесяцы.Вставить("Август",  8);
	СоответсвиеМесяцы.Вставить("Сентябрь",9);
	СоответсвиеМесяцы.Вставить("Октябрь", 10);
	СоответсвиеМесяцы.Вставить("Ноябрь",  11);
	СоответсвиеМесяцы.Вставить("Декабрь", 12);
	СоответсвиеМесяцы.Вставить("2", Неопределено);

	
КонецПроцедуры


&НаКлиенте
Процедура СообщитьДанныеВСоответвии(СоответсвиеМесяцы)
	
	Сообщить("==== Соответствие ====");
	Для Каждого Элемент Из СоответсвиеМесяцы Цикл
        Сообщить(Строка(Элемент.Ключ) + " / " + Строка(Элемент.Значение));// Ключ / Значение
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучаетКоличествоЭлементовCоответствия(Команда)
	
	СоответсвиеМесяцы = Новый Соответствие;
	ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы);
	
	Сообщить("Количество элементов соответствия: " + СоответсвиеМесяцы.Количество());
	
КонецПроцедуры

&НаКлиенте
Процедура ОчиститьСоответствие(Команда)
	
	СоответсвиеМесяцы = Новый Соответствие;
	ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы);
	
	Сообщить("Количество элементов соответствия до очистки: " + СоответсвиеМесяцы.Количество());
	
	СоответсвиеМесяцы.Очистить();
	
	Сообщить("Соответствие очищено!");
    СообщитьДанныеВСоответвии(СоответсвиеМесяцы);	
	Сообщить("Количество элементов соответствия: " + СоответсвиеМесяцы.Количество());

	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьКоличествоЭлементовСоответствия(Команда)
	
	СоответсвиеМесяцы = Новый Соответствие;
	ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы);
	
	Сообщить("Количество элементов соответствия: " + СоответсвиеМесяцы.Количество());

КонецПроцедуры

&НаКлиенте
Процедура ПолучитьЗначения(Команда)
	СоответсвиеМесяцы = Новый Соответствие;
	ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы);
	
	Сообщить("СоответсвиеМесяцы.Получить(1): " + СоответсвиеМесяцы.Получить(1));  
	Сообщить("СоответсвиеМесяцы.Получить(""Февраль""): " + СоответсвиеМесяцы.Получить("Февраль"));
	Сообщить("СоответсвиеМесяцы[1]: " + СоответсвиеМесяцы[1]); 
	Сообщить("СоответсвиеМесяцы[""Февраль""]): " + СоответсвиеМесяцы["Февраль"]);

	//Используем метод Получить
    ЭлСоотвествия1 = СоответсвиеМесяцы.Получить(1);
    ЭлСоотвествия2 = СоответсвиеМесяцы.Получить(2);
    //выведем в сообщения полученные значения
    Сообщить(?(ЗначениеЗаполнено(ЭлСоотвествия1),ЭлСоотвествия1,"Неопределено"));
    Сообщить(?(ЗначениеЗаполнено(ЭлСоотвествия2),ЭлСоотвествия2,"Неопределено"));
	
КонецПроцедуры

&НаКлиенте
Процедура УдалитьПоКлючу(Команда)
	СоответсвиеМесяцы = Новый Соответствие;
	ВставитьВСоответсвиеДанныеПоУмолчанию(СоответсвиеМесяцы);
	
	//СоответсвиеМесяцы.Удалить(Ключ);
	//СообщитьДанныеВСоответвии(СоответсвиеМесяцы);	
	//Сообщить("Количество элементов соответствия: " + СоответсвиеМесяцы.Количество());

	   
	//Используем метод Получить
    ЭлСоотвествия1 = СоответсвиеМесяцы.Получить(Ключ);
	Если ЗначениеЗаполнено(ЭлСоотвествия1) Тогда
		
	   СоответсвиеМесяцы.Удалить(Ключ);
	   Сообщить("Элемент Ключ:" + Ключ + ", Значение:" + ЭлСоотвествия1 + " УДАЛЕН");
	   СообщитьДанныеВСоответвии(СоответсвиеМесяцы);	
	   Сообщить("Количество элементов соответствия: " + СоответсвиеМесяцы.Количество());
		
	Иначе
		
	   Сообщить("Элемент с Ключом: " + Ключ + " не определен. Удалить не возможно.");
		
	КонецЕсли;
	
КонецПроцедуры
