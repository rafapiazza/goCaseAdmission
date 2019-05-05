module Api
	class SurvivorsController < ApplicationController
		def index
			survivors = Survivor.order("created_at DESC");
			render json: {status: 'SUCCESS', message:'Loaded survivors', data:survivors},status: :ok
		end

		def show
        survivor = Survivor.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded survivor', data:survivor},status: :ok
      	end

		def create
			survivor = Survivor.new(survivor_params)
#trash code survivor.flag =['0','0','0']
			survivor.flag1 =0;
			survivor.flag2 =0;
			survivor.flag3 =0;

			if(survivor.save)
				render json: {status: 'SUCCESS', message:'Saved survivor', data:survivor},status: :ok
			else
				render json: {status: 'ERROR', message:'Cant save survivor', data:survivor.errors},status: :unprocessable_entity
			end
		end

		def update
#to change location, need params "latitude" and "longitude" inside body
			if(params[:latitude]!=nil&&params[:longitude]!=nil) 
				survivor = Survivor.find(params[:id])
#				survivor2 = Survivor.new(survivor_params)
	
				survivor.latitude = params[:latitude]
				survivor.longitude = params[:longitude]
			
				if(survivor.save)
					render json: {status: 'SUCCESS', message:'Updated location', data:survivor},status: :ok
				else
					render json: {status: 'ERROR', message:'Cant update location', data:survivor.errors},status: :unprocessable_entity
				end
			

#to report a abduction flag, need param "name" inside body
			elsif(params[:name]!=nil)
				survivor = Survivor.find(params[:id])
		        survivor2 = Survivor.find_by(name: params[:name])
#using method "denuncia" inside the model "survivor"
        		if(survivor.denuncia(survivor2.id))
        			render json: {status: 'SUCCESS', message:'Abducted flag reported', by_user:survivor.name},status: :ok
				else
					render json: {status: 'ERROR', message:'Abducted flag cant be reported', by_user:survivor.name},status: :unprocessable_entity
				end
			end
		end

		def destroy
#			survivor = Survivor.find(params[:id])
#			
#			if(survivor.destroy)
#        			render json: {status: 'SUCCESS', message:'deletado',data: survivor},status: :ok
#				else
#					render json: {status: 'ERROR', message:'Nao foi deletado', data: survivor},status: :unprocessable_entity
#				end
     	end

      	private 

		def survivor_params
			params.permit(:name, :age, :gender, :latitude, :longitude)
			
		end
	end
end