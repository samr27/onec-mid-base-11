	Процедура СА_ДобавитьКонтактВШапкуДокумента(Форма)  Экспорт 
	  
	  Если Форма.ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" ИЛИ
		  Форма.ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" ИЛИ
		  Форма.ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		  
		  НовыйЭлемент = Форма.Элементы.Вставить("Контакт", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
		  НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
		  НовыйЭлемент.ПутьКДанным = "Объект.Контакт";
	  КонецЕсли;
	  
	  Если Форма.ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" ИЛИ 
		  Форма.ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		  
		  НовыйЭлемент = Форма.Элементы.Вставить("Контакт", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
		  НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
		  НовыйЭлемент.ПутьКДанным = "Объект.Контакт";
	  КонецЕсли;
	  
	  Если Форма.ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента"Тогда 
		  Группа = Форма.Элементы.Добавить("Группа", Тип("ГруппаФормы"),Форма.Элементы.ГруппаШапкаЛево);
		  Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
		  Группа.ОтображатьЗаголовок = ЛОЖЬ;
		  Группа.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
		  
		  НовыйЭлемент = Форма.Элементы.Вставить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.Группа);
		  НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
		  НовыйЭлемент.ПутьКДанным = "Объект.СогласованнаяСкидка";
		  НовыйЭлемент.УстановитьДействие("ПриИзменении", "АС_СогласованнаяСкидкаПриИзмененииПосле");
		  
		  НоваяКоманда = Форма.Команды.Добавить("ПересчитатьСкидку");
		  НоваяКоманда.Действие = "АС_ПересчитатьТаблицуПосле";//Имя процедуры
		  НоваяКоманда.Заголовок = "Пересчитать скидку";
		  
		  НовыйЭлемент = Форма.Элементы.Добавить("ЭлементПересчитатьСкидку", Тип("КнопкаФормы"), Форма.Элементы.Группа);
		  НовыйЭлемент.ИмяКоманды = "ПересчитатьСкидку";
		  
		  
	  КонецЕсли;

	  
КонецПроцедуры

Процедура СА_ДобавитьКонтактВСписок(Форма)  Экспорт 
		
	НовыйЭлемент = Форма.Элементы.Вставить("Контакт", Тип("ПолеФормы"), Форма.Элементы.Список, Форма.Элементы.СуммаДокумента);
	НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
	НовыйЭлемент.ПутьКДанным = "Список.Ссылка.Контакт";

КонецПроцедуры
