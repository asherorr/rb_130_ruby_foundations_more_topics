require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    shifted_item = @list.shift
    assert_equal(@todo1, shifted_item)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    popped_item = @list.pop
    assert_equal(@todo3, popped_item)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add("string object") }
    assert_raises(TypeError) { @list.add('hi"') }
  end

  def test_shovel
    new_todo = Todo.new("Practice Yoga")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new("Practice Yoga")
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    invalid_idx = @list.size + 1
    assert_raises(IndexError) { @list.item_at(invalid_idx) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    invalid_idx = @list.size + 1
    assert_raises(IndexError) { @list.mark_done_at(invalid_idx) }

    @list.mark_done_at(0)
    assert(@list.first.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    invalid_idx = @list.size + 1
    assert_raises(IndexError) { @list.mark_undone_at(invalid_idx) }

    @list.first.done!
    @list.mark_undone_at(0)
    assert(@list.first.done? == false)
  end

  def test_all_done
    @list.done!
    @list.each do |item|
      assert(item.done?)
    end
  end

  def test_remove_at
    invalid_idx = @list.size + 1
    assert_raises(IndexError) { @list.remove_at(invalid_idx) }

    @list.remove_at(0)
    assert(@list.size == 2)
  end


end