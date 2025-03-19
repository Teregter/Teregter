#include <stdio.h>
#include <ctype.h>
#include <string.h>

// Функция для подсчета слов в строке
int countWords(char *str)
{
    int count = 0;
    int inWord = 0; // Флаг, указывающий, находимся ли мы внутри слова
    // Проходим по каждому символу строки
    while (*str)
    {
        // Если текущий символ - буква или цифра, и мы не в слове, увеличиваем счетчик слов
        if (isalnum(*str) && !inWord)
        {
            inWord = 1; // Мы внутри слова
            count++;
        }
        // Если текущий символ не буква или цифра, то сбрасываем флаг в слове
        else if (!isalnum(*str))
        {
            inWord = 0;
        }
        str++; // Переходим к следующему символу
    }
    return count;
}
int main()
{
    char str[100];
    printf("Введите строку: ");
    fgets(str, sizeof(str), stdin);
    // Удаляем символ новой строки, который добавляется функцией fgets
    if (str[strlen(str) - 1] == '\n')
    {
        str[strlen(str) - 1] = '\0';
    }
    int wordsCount = countWords(str);
    printf("Количество слов в строке: %d\n", wordsCount);
    return 0;
}
