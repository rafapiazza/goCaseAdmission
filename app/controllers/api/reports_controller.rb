module Api
	class ReportsController < ApplicationController
#		def abducted

#			survivors = Survivor.order("name ASC");
#			total = survivors.length
#			porcent = 0.0;


#			survivors.each do |survivor|
#				if survivor.flag3 !=0 
#					porcent += 1
#				end
#			end

#			porcent = 100*porcent/total
#
#			render json: {status: 'SUCCESS', message:'Percentage of abductees survivors',data: porcent},status: :ok
#
#		end
#		def nonabducted
#			survivors = Survivor.order("name ASC");
#			total = survivors.length
#			porcent = 0.0;
#			survivors.each do |survivor|
#				if survivor.flag3==0 
#					porcent += 1
#				end
#			end
#			porcent *= 100.0/total
#
#			render json: {status: 'SUCCESS', message:'Percentage of non abductees survivors',data: porcent},status: :ok
#		end

		def all
#knowing who the survivors are and how many
			survivors = Survivor.order("name ASC");
			total = survivors.length
			porcent = 0.0;

			abduzidos = Hash.new
#using an empty hash to add a pair of survivors information (name,status)  and count how many abducted
			survivors.each do |survivor|
				if survivor.flag3==0 
					abduzidos[survivor.name] = "Not Abducted"
				else
					abduzidos[survivor.name] = "Abducted"
					porcent += 1
				end
			end
#calculate percentage
			porcent *= 100.0/total

			abduzidos["Percentage of survivors abductees"] = porcent
			abduzidos["Percentage of survivors non abductees"] = 100.0-porcent
#and call the hash
			render json: {status: 'SUCCESS', message:'Report of survivors', data:abduzidos},status: :ok

		end
	end
end