describe "State pages" do

  subject { page }
  
  describe "index" do
    let(:state) { FactoryGirl.create(:state) }
    let(:city) { FactoryGirl.create(:city) }
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit states
    end

    it { should have_selector('title', text: 'All states') }

    describe "pagination" do
      before(:all) { 40.times { FactoryGirl.create(:state) } }
      after(:all)  { State.delete_all }
      
      let(:first_page)  { State.paginate(page: 1) }
      let(:second_page) { State.paginate(page: 2) }

      it { should have_link('Next') }
      its(:html) { should match('>2</a>') }

      it "should list each state" do
        State.all[0..2].each do |state|
          page.should have_selector('li', text: state.name)
        end
      end
      
      it "should list the first page of states" do
        first_page.each do |state|
          page.should have_selector('li', text: state.name)
        end
      end

      it "should not list the second page of states" do
        second_page.each do |state|
          page.should_not have_selector('li', text: state.name)
        end
      end

      describe "showing the second page" do
        before { visit state(page: 2) }

        it "should list the second page of states" do
          second_page.each do |state|
            page.should have_selector('li', text: state.name)
          end
        end
      end
      
      describe "showing the delete links" do
        it { should have_link('delete', href: state_path(State.first)) }
        it "should be able to delete any state" do
            expect { click_link('Delete') }.to change(State, :count).by(-1)
        end
      end
      describe "showing the show links" do
        it { should have_link('Show', href: state_path(State.first)) }
        it "should render state page" do
            before { click_button 'Show' }

            it { should have_selector('title', text: state_path) }
            it { should have_selector('h1',    text: state.name) }
        end
      end
      
      describe "showing the add link" do
        it { should have_link('+ Add', href: 'state/new') }
        it "should be able to add a new state" do
            before { click_button '+ Add' }
        end
      end
    end
  end
end