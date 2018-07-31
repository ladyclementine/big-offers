class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :password, :permission_level       
  enum permission_level: { 'Criar': 0, 'Criar-Editar': 1 , 'Administrador': 2}
  
  def self.has_default?
    Admin.all.each do |admin|
      admin.is_default == true ? true : false
    end
  end   
  def has_permission?
    return self.permission_level == "Criar-Editar" || self.permission_level == "Administrador" ? true : false
  end  
end
