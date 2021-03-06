abstract class Expr
  module Visitor
    abstract def visit_assign_expr(expr : Assign)
    abstract def visit_binary_expr(expr : Binary)
    abstract def visit_call_expr(expr : Call)
    abstract def visit_get_expr(expr : Get)
    abstract def visit_literal_expr(expr : Literal)
    abstract def visit_logical_expr(expr : Logical)
    abstract def visit_grouping_expr(expr : Grouping)
    abstract def visit_set_expr(expr : Set)
    abstract def visit_super_expr(expr : Super)
    abstract def visit_this_expr(expr : This)
    abstract def visit_unary_expr(expr : Unary)
    abstract def visit_variable_expr(expr : Variable)
  end

  abstract def accept(visitor : Visitor)

  class Assign < Expr
    getter name
    getter value

    def initialize(@name : Token, @value : Expr)
    end

    def accept(visitor : Visitor)
      visitor.visit_assign_expr(self)
    end
  end

  class Binary < Expr
    getter left
    getter operator
    getter right

    def initialize(@left : Expr, @operator : Token, @right : Expr)
    end

    def accept(visitor : Visitor)
      visitor.visit_binary_expr(self)
    end
  end

  class Call < Expr
    getter callee
    getter paren
    getter arguments

    def initialize(@callee : Expr, @paren : Token, @arguments : Array(Expr))
    end

    def accept(visitor : Visitor)
      visitor.visit_call_expr(self)
    end
  end

  class Get < Expr
    getter object
    getter name

    def initialize(@object : Expr, @name : Token)
    end

    def accept(visitor : Visitor)
      visitor.visit_get_expr(self)
    end
  end

  class Grouping < Expr
    getter expr

    def initialize(@expr : Expr)
    end

    def accept(visitor : Visitor)
      visitor.visit_grouping_expr(self)
    end
  end

  class Literal < Expr
    getter value

    def initialize(@value : String | Nil | Bool | Float64)
    end

    def accept(visitor : Visitor)
      visitor.visit_literal_expr(self)
    end
  end

  class Logical < Expr
    getter left
    getter operator
    getter right

    def initialize(@left : Expr, @operator : Token, @right : Expr)
    end

    def accept(visitor : Visitor)
      visitor.visit_logical_expr(self)
    end
  end

  class Set < Expr
    getter object
    getter name
    getter value

    def initialize(@object : Expr, @name : Token, @value : Expr)
    end

    def accept(visitor : Visitor)
      visitor.visit_set_expr(self)
    end
  end

  class Super < Expr
    getter keyword
    getter method

    def initialize(@keyword : Token, @method : Token)
    end

    def accept(visitor : Visitor)
      visitor.visit_super_expr(self)
    end
  end

  class This < Expr
    getter keyword

    def initialize(@keyword : Token)
    end

    def accept(visitor : Visitor)
      visitor.visit_this_expr(self)
    end
  end

  class Unary < Expr
    getter operator
    getter right

    def initialize(@operator : Token, @right : Expr)
    end

    def accept(visitor : Visitor)
      visitor.visit_unary_expr(self)
    end
  end

  class Variable < Expr
    getter name

    def initialize(@name : Token)
    end

    def accept(visitor : Visitor)
      visitor.visit_variable_expr(self)
    end
  end
end
