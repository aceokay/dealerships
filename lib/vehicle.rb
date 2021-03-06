class Vehicle
  @@vehicles = []
  define_method(:initialize) do |make, model, year|
    @v_make = make
    @v_model = model
    @v_year = year
    @v_id = @@vehicles.length().+(1)
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_method(:v_make) do
    @v_make
  end

  define_method(:v_model) do
    @v_model
  end

  define_method(:v_year) do
    @v_year
  end

  define_method(:id) do
    @v_id
  end

  define_singleton_method(:find_id) do |id_number|
    id_search_result = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(id_number.to_i())
        id_search_result = vehicle
      end
    end
    id_search_result
  end

  define_method(:age) do
    present_year = Time.new().year()
    present_year.-(@v_year)
  end

  define_method(:worth_buying?) do
    good_cars = ["Hyundai", "Toyota", "Nissan", "Kia", "Mazda"]
    good_cars.include?(@v_make).&(self.age().<=(15))
  end
end
