class InquiriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_inquiry, only: [:destroy]
  
  def index
    @user = current_user
    @inquiries = @user.admin? ? Inquiry.all : @user.inquiries
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @user = current_user
    @inquiry = @user.inquiries.build(inquiry_params)
    if @inquiry.save
        redirect_back fallback_location: root_path, notice: "Your Inquiry was submit successfully"
    else
      redirect_back fallback_location: root_path, alert: @inquiry.errors.full_messages.to_sentence
        # render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @inquiry.destroy
      redirect_to inquiries_path, notice: "Inquiry removed successfully"
    else
      redirect_to inquiries_path, alert: @inquiry.errors.full_messages.to_sentence
    end
  end

  def find_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :email, :phone, :words)
  end
end