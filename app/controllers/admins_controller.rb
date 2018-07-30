class AdminsController <  ApplicationController
    before_action :require_default_admin
    before_action :authenticate_admin!
    before_action :get_admin, only: [:destroy, :edit, :update]
    before_action

    layout 'dashboard'

    def index
        @admins = Admin.all
    end

    def new
        @admins = Admin.new
      end
    
    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            redirect_to admins_path, notice: "Admin criado com sucesso."
        else
            redirect_to new_admin_path, alert: "Falha ao cadastrar novo admin."
        end
    end

    def update
        if @admin.update(admin_params)
          redirect_to  admins_path, notice: 'Atualizado com sucesso'
        else
          redirect_to  admins_path, notice: 'Erro'
        end
    end
    
    def destroy
        name = @admin.name
        @admin.destroy
        if @admin.destroy
            redirect_to admins_path, notice: "O administrador #{name} foi excluído."
        else
            redirect_to admins_path, notice: "Não foi possível excluir o administrador #{name}."
        end
    end

    private

    def admin_params
        params.require(:admin).permit(:name, :email, :password, :is_default, :permission_level, :avatar)
    end

    def get_admin
        @admin = Admin.find(params[:id])
    end

    def require_default_admin
       unless current_admin.is_default == true
         redirect_to admins_path, notice: 'Erro'
       end
     end
end