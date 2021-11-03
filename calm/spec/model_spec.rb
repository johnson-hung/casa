require 'rails_helper'
require 'support/factory_bot'

describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryBot.create(:movie, title: 'Why is hw4 so difficult', rating: 'R') }
    let!(:movie2) { FactoryBot.create(:movie, title: 'In the middle', rating: 'G') }
    let!(:movie3) { FactoryBot.create(:movie, title: 'I am almost done', rating: 'R', director: 'Peter Wu') }
    let!(:movie4) { FactoryBot.create(:movie, title: 'Seven', director: 'David Fincher') }
    let!(:movie4_5) { FactoryBot.create(:movie, title: "David Fincher's another movie", director: 'David Fincher') }
    let!(:movie5) { FactoryBot.create(:movie, title: "Peter's List", director: 'Peter Wu') }
    let!(:movie6) { FactoryBot.create(:movie, title: "Stop") }
    
    context 'rating exists' do
      it 'finds similar movies correctly' do
        expect(Movie.find_rating(movie1.title)).to eql('R')
        expect(Movie.find_rating(movie2.title)).to eql('G')
      end
    end 
    
    
    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(movie3.title)).to eql(['I am almost done', "Peter's List"])
        expect(Movie.similar_movies(movie5.title)).to_not include(['Seven'])
        expect(Movie.similar_movies(movie4_5.title)).to eql(['Seven',"David Fincher's another movie"])
        expect(Movie.similar_movies(movie3.title)).to eql(['I am almost done', "Peter's List"])
      end
    end
    
    
    context 'no director' do
      it 'tackle with a sad path' do
        expect(Movie.similar_movies(movie1.title)).to eql(nil)
      end
    end
    
  end
  
  
  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
  
end