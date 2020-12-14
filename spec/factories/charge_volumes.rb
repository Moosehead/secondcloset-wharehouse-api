FactoryBot.define do
    factory :charge_volume do
        value { 2}

        trait :c1 do
        customer_id {'1'}
        end

        trait :c2 do
        customer_id {'2'}
        end
    end
end