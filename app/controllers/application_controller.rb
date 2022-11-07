class ApplicationController < Sinatra::Base

    set :default_content_type, "application/json"
    # before do
    #     response.headers['Access-Control-Allow-Origin'] = "*"
    #     options "*" do
    #         response.methods['Access-Control-Allow-Methods'] = "GET, POST, PATCH, DELETE"
    #     end
    # end

    get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
        {hello: "Just a starting code 😃"}.to_json
    end

    get "/categories" do
        Category.all.to_json
    end
    get '/category/:id' do
        Category.find(params[:id]).to_json
    end

    get './todo_lists' do
        TodoList.all.to_json
    end

    get './todo_list/id'do
    TodoList.find(params[:id]).to_json
    end

    get 'todo_list/:title' do
        TodoList.find_by(title: params[:title]).to_json
    end

    post'/todo_list' do
        todo =TodoList.create(
            title: params[:title],
            description: params[:description],
            category_id: params[:category_id],
            status: false
        )
        todo.to_json
    end
    patch "/todo_list/:id" do 
        todo = TodoList.find(params[:id])
        todo.update(
            title: params[:title],
            description: params[:description],
            category_id: params[:category_id],
            status: params[:status]
        )
        {message:"your todo_list was updated"}.to_json

    end

    delete 'todo_list/:id' do
        todo_list= TodoList.find(params[:id])
        todo_list.destroy
        {message:"your todo_list deleted"}.to_json
    end
end

