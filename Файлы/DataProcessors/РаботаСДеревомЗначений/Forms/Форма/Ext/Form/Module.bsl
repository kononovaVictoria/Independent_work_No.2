﻿
&НаКлиенте
Процедура ДобавитьДеревоЗначений(Команда)
	ДобавитьДеревоЗначенийНаСервере();
КонецПроцедуры


&НаСервере
Процедура ДобавитьДеревоЗначенийНаСервере()
	
	ТипСтрока = Новый ОписаниеТипов("Строка");
	ТипЧисло  = Новый ОписаниеТипов("Число");
	
	ДеревоВремени = Новый ДеревоЗначений;
	ДеревоВремени.Колонки.Добавить("ВременнойПериод",ТипСтрока,"ВременнойПериод");
	ДеревоВремени.Колонки.Добавить("Номер",ТипЧисло,"Номер");
	ДеревоВремени.Колонки.Добавить("Бюджет",ТипЧисло,"Бюджет");
	
	
	ВерхняяСтрока = ДеревоВремени.Строки.Добавить();
	ВерхняяСтрока.ВременнойПериод = "Год"; 
	ВерхняяСтрока.Номер           = 1;
	ВерхняяСтрока.Бюджет          = 30000*12;
	
	СтрокаВторогоУровня1 = ВерхняяСтрока.Строки.Добавить();
	СтрокаВторогоУровня1.ВременнойПериод = "Первый квартал"; 
	СтрокаВторогоУровня1.Номер           = 1;
	СтрокаВторогоУровня1.Бюджет          = 30000*3; 
	
	СтрокаВторогоУровня2 = ВерхняяСтрока.Строки.Добавить();
	СтрокаВторогоУровня2.ВременнойПериод = "Второй квартал"; 
	СтрокаВторогоУровня2.Номер           = 2;
	СтрокаВторогоУровня2.Бюджет          = 30000*3;

	СтрокаТретьегоУровня1 = СтрокаВторогоУровня1.Строки.Добавить();
	СтрокаТретьегоУровня1.ВременнойПериод = "Январь"; 
	СтрокаТретьегоУровня1.Номер           = 1;
	СтрокаТретьегоУровня1.Бюджет          = 30000;
	
	СтрокаТретьегоУровня2 = СтрокаВторогоУровня1.Строки.Добавить();
	СтрокаТретьегоУровня2.ВременнойПериод = "Февраль"; 
	СтрокаТретьегоУровня2.Номер           = 2;
	СтрокаТретьегоУровня2.Бюджет          = 30000;
	
	СтрокаТретьегоУровня3 = СтрокаВторогоУровня1.Строки.Добавить();
	СтрокаТретьегоУровня3.ВременнойПериод = "Март"; 
	СтрокаТретьегоУровня3.Номер           = 3;
	СтрокаТретьегоУровня3.Бюджет          = 30000;  
	
	
	СтрокаТретьегоУровня4 = СтрокаВторогоУровня2.Строки.Добавить();
	СтрокаТретьегоУровня4.ВременнойПериод = "Апрель"; 
	СтрокаТретьегоУровня4.Номер           = 4;
	СтрокаТретьегоУровня4.Бюджет          = 30000;
	
	СтрокаТретьегоУровня5 = СтрокаВторогоУровня2.Строки.Добавить();
	СтрокаТретьегоУровня5.ВременнойПериод = "Май"; 
	СтрокаТретьегоУровня5.Номер           = 5;
	СтрокаТретьегоУровня5.Бюджет          = 30000;
	
	СтрокаТретьегоУровня6 = СтрокаВторогоУровня2.Строки.Добавить();
	СтрокаТретьегоУровня6.ВременнойПериод = "Июнь"; 
	СтрокаТретьегоУровня6.Номер           = 6;
	СтрокаТретьегоУровня6.Бюджет          = 30000;
	
	ВывестиИнформациюОВременныхПериодах(ДеревоВремени.Строки);	
	
    ЗначениеВРеквизитФормы(ДеревоВремени,"ДеревоНаФорме"); 
	
	
КонецПроцедуры


&НаСервере
Процедура ВывестиИнформациюОВременныхПериодах(СтрокиДерева)
	
	Для каждого стрДерева Из СтрокиДерева Цикл
		СтрокаТире = ДобавитьТире(стрДерева.Уровень());
		Сообщить(СтрокаТире + 
		         стрДерева.ВременнойПериод + " / " + 
		         стрДерева.Номер + " / "+ 
				 стрДерева.Бюджет );
		Если стрДерева.Строки.Количество()>0 Тогда
			ВывестиИнформациюОВременныхПериодах(стрДерева.Строки)
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ДобавитьТире(Уровень)
	
	СтрокаТире = "";
	Если Уровень > 0  Тогда
		
		Для Индекс = 0 По Уровень Цикл
			СтрокаТире = СтрокаТире + " - ";
		КонецЦикла; 
	  
	КонецЕсли;
	Возврат СтрокаТире;
	
КонецФункции

&НаКлиенте
Процедура ЗагрузитьДанныеИзСправочника(Команда)
	ЗагрузитьДанныеИзСправочникаНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьДанныеИзСправочникаНаСервере()
	МойЗапрос = Новый  Запрос;
	МойЗапрос.Текст ="ВЫБРАТЬ
	                 |	ВременныеПериоды.НаименованиеПериода КАК ВременнойПериод,
	                 |	ВременныеПериоды.Номер КАК Номер
	                 |ИЗ
	                 |	Справочник.ВременныеПериоды КАК ВременныеПериоды
	                 |
	                 |УПОРЯДОЧИТЬ ПО
	                 |	ВременныеПериоды.Ссылка ИЕРАРХИЯ";
					 
	//ОписаниеРегиона = Новый ОписаниеТипов("СправочникСсылка.Регионы");
	//ОписаниеВидаРегиона = Новый ОписаниеТипов("ПеречислениеСсылка.ВидРегиона");
	ТипСтрока = Новый ОписаниеТипов("Строка");
	ТипЧисло  = Новый ОписаниеТипов("Число");
	
	//Дерево = Новый ДеревоЗначений;
	//Дерево.Колонки.Добавить("Регион",ОписаниеРегиона);
	//Дерево.Колонки.Добавить("ВидРегиона",ОписаниеВидаРегиона);
	
	ДеревоВремениИзСПР = Новый ДеревоЗначений;
	ДеревоВремениИзСПР.Колонки.Добавить("ВременнойПериод",ТипСтрока);
	ДеревоВремениИзСПР.Колонки.Добавить("Номер",ТипЧисло);
    ДеревоВремениИзСПР.Колонки.Добавить("Бюджет",ТипЧисло);

	
	
	Выборка = МойЗапрос.Выполнить().Выбрать(ОбходРезультатаЗапроса.ПоГруппировкамСИерархией);
	
	ЗаполнитьДерево(ДеревоВремениИзСПР.Строки, Выборка);
	
	ЗначениеВРеквизитФормы(ДеревоВремениИзСПР,"ДеревоНаФорме");
	
	
КонецПроцедуры 


&НаСервере
Процедура ЗаполнитьДерево(СтрокиДерева, Выборка)
	
	Пока Выборка.Следующий() Цикл 
		НовСтрока = СтрокиДерева.Добавить();
		НовСтрока.ВременнойПериод = Выборка.ВременнойПериод;
		НовСтрока.Номер = Выборка.Номер; 
		НовСтрока.Бюджет = 0;
		
		ВыборкаПодчиненная = Выборка.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкамСИерархией);
		
		Если ВыборкаПодчиненная.Количество() <> 0 Тогда 
		
			ЗаполнитьДерево(НовСтрока.Строки,ВыборкаПодчиненная);
		
		КонецЕсли;
		
	КонецЦикла;	
	
КонецПроцедуры	


	