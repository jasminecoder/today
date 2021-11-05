module PagesHelper
    def weight_difference(weights, i)
        return 0.0 if i == weights.length - 1
        weights[i].weight - weights[i + 1].weight
    end

    def today_date
        Time.now.strftime("%B %d, %Y")
    end 

    
end
