require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:person) { create(:person) }

  describe 'GET index' do

    context "when valid" do    
      before { get :index }
      it { expect(:people).not_to be_empty }
      it { expect(response).to render_template(:index) }
    end

    context "when valid" do
      before { xhr :get, :index }
      it { expect(:people).not_to be_empty }
      it { expect(response).to render_template(:index) }
    end
    
  end

  describe "GET show" do
    before { get :show, id: person }
    it { expect(response).to render_template(:show) }
  end
 
  describe "GET new" do
    before { get :new }
    it { expect(assigns(:person)).to be_a_new(Person) }
    it { expect(response).to render_template(:new) }
  end

  describe "POST create" do

    context "when valid" do
      before { post :create, person: attributes_for(:person) }
      it { expect(assigns(:person)).to be_valid }
      it { expect(response).to redirect_to(person_path(assigns(:person))) }
    end
 
    context "when invalid" do
      before { post :create, person: attributes_for(:person, :invalid) }
      it { expect(assigns(:person)).not_to be_valid }
      it { expect(response).to render_template(:new) }
    end

  end

  describe "GET edit" do
    before { get :edit, id: person.id }
    it { expect(response).to render_template(:edit) }
  end

  describe 'PUT update' do

    context 'when valid' do
      before { put :update, id: person, person: attributes_for(:person) }
      it { expect(assigns(:person)).to be_valid }
      it { expect(response).to redirect_to(person_path(assigns(:person))) }
    end

    context 'when invalid' do
      before { put :update, id: person, person: attributes_for(:person, :invalid) }
      it { expect(assigns(:person)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end

  end

end
