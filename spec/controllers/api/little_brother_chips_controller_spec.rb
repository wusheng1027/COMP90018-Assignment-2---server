require 'rails_helper'
require 'support/resource_controller'

RSpec.describe Api::LittleBrotherChipsController, type: :controller do
    let!(:model) { create(:little_brother_chip) do |lbc|
        create(:location, little_brother_chip: lbc)
        end }
    let(:show_attr) { %w(id user_id) }
    let(:invalid_model_attributes) { {user_id: nil} }
    let(:successful_create_params) {{
        little_brother_chip: {
            user_id: (create :user).id            
        }
    }}

    it_behaves_like 'a resource controller'
end
