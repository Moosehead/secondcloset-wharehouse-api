FactoryBot.define do
    factory :discount do
        customer_id {'1'}
        value {0.10}
        active {true}

        trait :lim do
        no_limit {false}
        quantity{100}
        end

        trait :nolim do
        no_limit {true}
        quantity{-1}
        end

    end
end