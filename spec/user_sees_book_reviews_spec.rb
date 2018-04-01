require 'rails_helper'

  describe "user visits book show and sees title"  do
    context "visit [book_path]"  do
      it "they see book title and reviews"  do
        book = Book.create(id: 1, title: "moby dick")
        user = User.create(name:"kyle")
        review = book.reviews.create(body: "hello", rating: 1, user_id: user.id)

        visit "books/1"

        expect(page).to have_content(book.title)
      end
    end
  end

  describe "user visits book show and sees reviews"  do
    context "visit [book_path]"  do
      it "they see book title and reviews"  do
        book = Book.create(id: 1, title: "moby dick")
        user = User.create(name:"kyle")
        review = book.reviews.create(body: "hello", rating: 1, user_id: user.id)

        visit "books/1"

        expect(page).to have_content(book.title)
        expect(page).to have_content("hello")
        expect(page).to have_content("1")
        expect(page).to have_content(user.name)
      end
    end
  end
