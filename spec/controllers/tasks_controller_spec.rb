require "rails_helper"

RSpec.describe TasksController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index

      # response
      expect(response).to have_http_status(:success)
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    login_user
    let(:task) { create(:task) }
    it "returns http success" do
      get :show, params: { id: task.id }

      # response
      expect(response).to have_http_status(:success)
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    describe "with login" do
      login_user
      let(:task) { create(:task) }
      it "returns http success" do
        get :edit, params: { id: task.id }

        # response
        expect(response).to have_http_status(:success)
        expect(response).to render_template :edit

        # assings
        expect(assigns(:task)).to eq task
      end
    end

    describe "without login" do
      let(:task) { create(:task) }
      it "is redirected to ilogin" do
        get :edit, params: { id: task.id }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_user_session_path) # redirect_to login
      end
    end
  end

  describe "POST #create" do
    let(:new_task_attributes) { attributes_for(:task) }

    describe "with login" do
      login_user
      it "returns http success" do
        before_count = Task.all.count
        post :create, params: { task: new_task_attributes }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(tasks_path) # redirect_to index

        # count
        expect(Task.all.count).to eq before_count + 1
      end

      it "has been redirected to new in case of errors" do
        allow_any_instance_of(Task).to receive(:save).and_return(false)
        before_count = Task.all.count
        post :create, params: { task: new_task_attributes }

        # response
        expect(response).to have_http_status(:success)
        expect(response).to render_template :new

        # count
        expect(Task.all.count).to eq before_count
      end
    end

    describe "without login" do
      it "is redirected to login" do
        before_count = Task.all.count
        get :create, params: { task: new_task_attributes }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_user_session_path) # redirect_to login

        # count
        expect(Task.all.count).to eq before_count
      end
    end
  end

  describe "PATCH #update" do
    let(:task) { create(:task) }
    describe "with login" do
      login_user
      it "returns http success" do
        patch :update, params: {
          id: task.id, task: { title: "edited_title", content: "edited_content" }
        }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(tasks_path) # redirect_to index
      end

      it "has been redirected to new in case of errors" do
        allow_any_instance_of(Task).to receive(:update_attributes).and_return(false)
        patch :update, params: {
          id: task.id, task: { title: "edited_title", content: "edited_content" }
        }

        # response
        expect(response).to have_http_status(:success)
        expect(response).to render_template :edit
      end
    end

    describe "without login" do
      it "is redirected to login" do
        patch :update, params: {
          id: task.id, task: { title: "edited_title", content: "edited_content" }
        }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_user_session_path) # redirect_to login
      end
    end
  end

  describe "delete #destroy" do
    let(:task) { create(:task) }
    describe "with login" do
      login_user
      it "returns http success" do
        delete :destroy, params: { id: task.id }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(tasks_path) # redirect_to index
      end
    end

    describe "without login" do
      it "is redirected to login" do
        delete :destroy, params: { id: task.id }

        # response
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_user_session_path) # redirect_to login
      end
    end
  end
end
