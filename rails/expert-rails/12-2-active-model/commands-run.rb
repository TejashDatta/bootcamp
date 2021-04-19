person = PersonAttributes.new
person.name = 'John'
person.age = 20

person = PersonCallbacks.new
[person.created_at, person.updated_at]
person.save
[person.created_at, person.updated_at]

person = PersonXmlSerialization.new
person.name = 'John'
person.age = 20
puts person.to_xml

person = PersonJsonSerialization.new
person.name = 'John'
person.age = 20
puts person.to_json
puts person.to_json(except: %i[age])

person = PersonValidations.new
person.name = 'John'
person.valid?
person.errors.messages

person.name = 'joHn'
person.valid?
person.name
