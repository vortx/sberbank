require "sberbank/version"
require 'json'
require 'rest-client'
module Sberbank

      #регистрируем заказ в системе
      def self.reg_order(username, password, returnurl, order_num, price)
         JSON.parse( RestClient.get 'https://3dsec.sberbank.ru/payment/rest/register.do',
            {params: { userName: username ,
                       password: password ,
                       orderNumber: order_num,
                       amount: price.round * 100,
                       returnUrl: returnurl.to_s
                     }
             })      
       end

      #получаем сатус заказа
       def self.stat_order(username, password, orderid)
         JSON.parse( RestClient.get 'https://3dsec.sberbank.ru/payment/rest/getOrderStatus.do',
       	     {params: { userName: username,
       	                password: password,
	                orderId: orderid
	             }
	     })
       end

end


