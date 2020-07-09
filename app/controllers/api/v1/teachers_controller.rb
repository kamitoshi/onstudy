class Api::V1::TeachersController < ApiController
  before_action :set_teacher, only:[:show, :edit, :update, :destroy]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end
  
  def index
    teachers = Teacher.all
    render json: teachers
  end

  def show
    render json: @teacher
  end

  def edit
  end
  
  def update
    @teacher.update(teacher_params)
  end

  def destroy

  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :grade, :point)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end