class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum permission_level: { 'Criar': 0, 'Criar-Editar': 1 , 'Administrador': 2}
  
  def self.has_default?
    Admin.all.each do |admin|
      admin.is_default == true ? true : false
    end
  end     
end
