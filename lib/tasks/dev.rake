namespace :dev do

	DEFAULT_PASSWORD = 999999

  desc "Cadastra dados básicos para uso em desenvolvimento"
    task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Migrando DB...") { %x(rails db:migrate) } 
      show_spinner("Cadastrando default USER...") { %x(rails dev:add_default_user) }
			show_spinner("Cadastrando others USERS...") { %x(rails dev:add_others_users) }
			show_spinner("Cadastrando TASKS...") { %x(rails dev:add_tasks) }
    else
      puts "Você não está no ambiente do desenvolvimento!"
    end
	end
	
	desc "Adiciona o usuário padrão"
    task add_default_user: :environment do
      User.create!(
        email: 'user@user.com',
        password: DEFAULT_PASSWORD,
				password_confirmation: DEFAULT_PASSWORD,
				name: 'André Araujo',
				role: 1
				)
	
		end
		
	desc 'Adiciona outros usuários'
		task add_others_users: :environment do
			20.times do |i| 
				User.create!(
					email: Faker::Internet.email,
					password: DEFAULT_PASSWORD,
					password_confirmation: DEFAULT_PASSWORD,
					name: Faker::Name.name,
					role: [0,1].sample
				)
			end
		end
	
	desc 'Adiciona tarefas'
		task add_tasks: :environment do
			User.all.each do |user|
				Random.rand(1..6).times do |t|
					Task.create!(
						name: Faker::Lorem.sentence,
						task_field: Faker::Lorem.paragraphs,
						user: user,
						status: [0,1,2,3,4,5,6].sample
					)
				end
			end
		end

	private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end