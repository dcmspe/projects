class User < ActiveRecord::Base
	validates :email, email_format:{ messagem: "The email is not valid."}
	validates :password, length:{ minimum:8, maximum:16 }
	validates :name, presence:true, length:{maximum:20}
end
