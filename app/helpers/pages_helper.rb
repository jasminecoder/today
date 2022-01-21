module PagesHelper
    def number_sign(number)
        number.to_f > 0.0 ? '+' : ''
    end

    def disabled_dates(weights)
        weights.all.map { |w| w.weighed_on.strftime('%m/%d/%Y') }
    end

    def default_date(weights)
        if current_user.weighed_today?
           ''
        else
            Date.today.strftime('%m/%d/%Y')
        end
    end

    def weight_value(i)
        weight_value = current_user.weight_value(i)
        if weight_value
            "#{weight_value} lb"
        else
            '-'
        end 
    end
    
    def weight_change(i)
        change = current_user.weight_change(i)
        if change
            "#{number_sign(change)}#{change} lb"
        else
            '-'
        end 
    end

    def today_date
        Time.now.strftime("%B %d, %Y")
    end 

   
end
