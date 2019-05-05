1.times do
	Survivor.create({
		name: "Rafael",	
      	age: 24,
      	gender: "m",
        latitude: 27.25,
        longitude: 25.75,
#        flag: ['1','2','3']
		flag1: 0,
        flag2: 0,
        flag3: 0
        })

	Survivor.create({
		name: "Joao",	
      	age: "58",
      	gender: "m",
        latitude: 30.00,
        longitude: 80.00,
        flag1: 0,
        flag2: 0,
        flag3: 0
        })

	Survivor.create({
		name: "Maria",	
      	age: 36,
      	gender: "f",
        latitude: 30.25,
        longitude: 79.75,
        flag1: 0,
        flag2: 0,
        flag3: 0
        })

		Survivor.create({
		name: "Ana",	
      	age: 12,
      	gender: "f",
        latitude: 30.25,
        longitude: 0.0,
        flag1: 0,
        flag2: 0,
        flag3: 0
        })

end