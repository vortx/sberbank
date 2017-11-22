# Sberbank
----------------------------------------------------
Гем для работы с платёжной системо Сбербанка

In your Gemfile, for the last officially released gem:

```ruby
gem 'sberbank'
```
## Usage

Вносим все переменные для запроса , в указанном порядке
To begin with, we are adding data: `username`, `password`, `returnurl`, `order_num`, `price`


`returnurl :  "https://yoursite.com/payment"`
- this is the full path to the page where the bank will return the status of your payment - for further processing by you.
это полный путь к странице , в которую банк вернет статус вашего платежа - для последующей обработки вами.

`order_num :`
- unique payment number. Carefully, if your payment was declined or canceled by timeout for some reason - this number should be changed for retry.
уникальный номер платежа. Внимательно , если ваш платеж был отклонен или отменен по таймауту по какойто причине - этот номер должен быть изменен для повторной попытки.

`price :`
- must be separated by a comma or be an integer
цена - должна быть разделенна запятой или быть целым числом

```ruby
def index
@payment =  Sberbank.reg_order( username, password, returnurl, order_num, price)
end
```
#### answer if an error occurs (ответ если произходит ошибка):

{"errorCode"=>"5", "errorMessage"=>"Доступ запрещён"}

Information on errors and statuses you can read in the documentation from Sberbank (
информацию по ошибкам и статусам вы можете прочитать в документации от Сбербанка)

