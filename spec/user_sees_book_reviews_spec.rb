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


  describe "user visits book show and sees average of reviews"  do
    context "visit [book_path]"  do
      it "they see book average review"  do
        book = Book.create(id: 1, title: "moby dick")
        user1 = User.create(name:"kyle")
        user2 = User.create(name:"bob")
        review = book.reviews.create(body: "hello", rating: 1, user_id: user1.id)
        review = book.reviews.create(body: "hello", rating: 3, user_id: user2.id)

        visit "books/1"

        expect(page).to have_content(book.title)
        expect(page).to have_content("hello")
        expect(page).to have_content("2")
        expect(page).to have_content(user1.name)
        expect(page).to have_content(user2.name)
      end
    end
  end


    describe "user visits book show and sees lowest of reviews"  do
      context "visit [book_path]"  do
        it "they see book lowest review"  do
          book = Book.create(id: 1, title: "moby dick")
          user1 = User.create(name:"kyle")
          user2 = User.create(name:"bob")
          review = book.reviews.create(body: "hello", rating: 1, user_id: user1.id)
          review = book.reviews.create(body: "hello", rating: 3, user_id: user2.id)

          visit "books/1"

          expect(page).to have_content(book.title)
          expect(page).to have_content("hello")
          expect(page).to have_content("1")
          expect(page).to have_content(user1.name)
          expect(page).to have_content(user2.name)
        end
      end
    end

    describe "user visits book show and sees highest of reviews"  do
      context "visit [book_path]"  do
        it "they see book highest review"  do
          book = Book.create(id: 1, title: "moby dick")
          user1 = User.create(name:"kyle")
          user2 = User.create(name:"bob")
          review = book.reviews.create(body: "hello", rating: 1, user_id: user1.id)
          review = book.reviews.create(body: "hello", rating: 3, user_id: user2.id)
          review = book.reviews.create(body: "hello", rating: 8, user_id: user2.id)

          visit "books/1"

          expect(page).to have_content(book.title)
          expect(page).to have_content("hello")
          expect(page).to have_content(8)
          expect(page).to have_content(user1.name)
          expect(page).to have_content(user2.name)
        end
      end
    end
