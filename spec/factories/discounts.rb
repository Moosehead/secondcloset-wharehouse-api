FactoryBot.define do
    factory :discount do
        active {true}

        trait :lim do
        customer_id {'1'}
        value {0.10}
        no_limit {false}
        quantity{100}
        end

        trait :nolim do
        customer_id {'1'}
        value {0.10}
        no_limit {true}
        quantity{-1}
        end

        trait :lim1_multi do
        customer_id {'4'}
        value {0.05}
        no_limit {false}
        quantity{1}
        end

        trait :lim2_multi do
        customer_id {'4'}
        value {0.10}
        no_limit {false}
        quantity{1}
        end
    

    end
end