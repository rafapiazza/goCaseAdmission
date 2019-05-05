class Survivor < ApplicationRecord
	validates :name, presence: true
	validates :age, presence: true
	validates :gender, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
#this could be a hash/array type if needed, tracking position and value of flags
	def denuncia (identificador)
		saida = false
		survivorAbduzido = Survivor.find(identificador)
		if survivorAbduzido.flag1 == 0
			survivorAbduzido.flag1 = self.id
			survivorAbduzido.save
			saida=true

		
		elsif survivorAbduzido.flag2 == 0&&self.id != survivorAbduzido.flag1
			survivorAbduzido.flag2 = self.id
			survivorAbduzido.save
			saida=true


		elsif survivorAbduzido.flag3 == 0&&self.id != survivorAbduzido.flag1&&self.id != survivorAbduzido.flag2
			survivorAbduzido.flag3 = self.id
			survivorAbduzido.save
			saida=true

			
		end
		saida
	end


end