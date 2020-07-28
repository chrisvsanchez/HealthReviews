module API
   module V1
  class HospitalsController < ApplicationController

       def index
        @hospitals = Hospital.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded hospitals', data:hospitals},status: :ok
     end

      def show
        @hospital = Hospital.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded hospitals', data:hospital},status: :ok
      end
    end
  end
end