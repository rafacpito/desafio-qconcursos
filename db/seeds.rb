require 'json'
file_questions = File.read('questions.json')
questions = JSON.parse(file_questions)

questions.each do |question|
  #cria as questões
  Question.find_or_create_by!(id: question["id"], statement: question["statement"], text: question["text"], answer: question["answer"], discipline: question["discipline"], 
    daily_access: question["daily_access"], created_at: question["created_at"])
end

p "Questões criadas"

file_question_access = File.read('question_access.json')
question_accesses = JSON.parse(file_question_access)

question_accesses.each do |question_access|
  QuestionAccess.find_or_create_by(question_id: question_access["question_id"], date: question_access["date"], times_accessed: question_access["times_accessed"])
end

p "Acessos criados"
