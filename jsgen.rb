#_* denotes a number, or letter, or object
#_n* denotes a negative number
#__* denotes special character


class JSSymbol < String
    def removeRedundant
        self[/[^\+].*/]
    end
    
    def toString
        (self.end_with? "+[]") ? self : self+"+[]"
    end
    
    def *(n)
        if n.class == JSSymbol
            JSSymbol.new("(#{self.removeRedundant})*(#{n.removeRedundant})")
        else
            (super n).removeRedundant
        end
    end

    def /(n)
        if n.class == JSSymbol
            JSSymbol.new("(#{self.removeRedundant})/(#{n.removeRedundant})")
        end
    end

    def +(n)
        if n.class == JSSymbol
            ops = /[\*\/]+/ #bracket if the number contains a mul or div
            
            b = n[ops]? "(#{n.removeRedundant})" : n.removeRedundant
            a = self[ops]? "(#{self.removeRedundant})" : self.removeRedundant
            
            JSSymbol.new("#{a}+#{b}")
        else
            super n
        end
    end

    def [](n)
        if n.class == JSSymbol
            JSSymbol.new("(#{self.toString})[#{n}]")
        else
            super n
        end
    end
end

module Enumerable
    def shortestString
        self.min_by { |s| s.length }
    end
end

#numbers
_n1 = JSSymbol.new("~[]") #-!![]
_0 = JSSymbol.new("+[]") #+![]
_1 = JSSymbol.new("+!![]")
_2 = _1*2
_3 = _1*3
_4 = _1*4
_5 = _1*5
_6 = _3*_2
_7 = _6+_1
_8 = _4*_2
_9 = _3*_3
_10 = [_5*_2, JSSymbol.new("(+([#{_1}]+[#{_0}]))")].shortestString
_11 = _10+_1
_12 = [_6*_2, _3*_4].shortestString
_13 = _12+_1
_14 = _7*_2
_15 = _5*_3
_16 = _4*_4
_17 = _16+_1
_18 = _9*_2
_19 = _18+_1
_20 = _10*_2
_21 = _7*_3
_22 = _11*_2
_23 = _22+_1
_24 = _12*_2
_25 = _5*_5
_26 = _13*_2
_27 = _9*_3
_28 = _14*_2
_29 = _28+_1
_30 = _10*_3
_31 = _30+_1
_32 = _16*_2
_33 = _11*_3
_34 = _33+_1
_35 = _7*_5
_36 = _12*_3


#words
_true = JSSymbol.new("!![]")
_false = JSSymbol.new("![]")
_undefined = [_false[_n1], JSSymbol.new("[][[]]")].shortestString
_NaN = JSSymbol.new("+{}")
_Infinity = _1/_0
_Object = JSSymbol.new("{}") #[object Object]

#letters
_a = [_false[_1], _NaN[_1]].shortestString
_b = [_Object[_2], _Object[_9]].shortestString
_c = [_Object[_5], _Object[_12]].shortestString
_d = [_undefined[_2], _undefined[_8]].shortestString
_e = [_true[_3], _false[_4], _undefined[_3], _undefined[_7], _Object[_4], _Object[_11]].shortestString
_f = [_false[_0], _undefined[_4], _Infinity[_2]].shortestString
#_g
#_h
_i = [_undefined[_5], _Infinity[_3], _Infinity[_5]].shortestString
_j = [_Object[_3], _Object[_10]].shortestString
#_k
_l = _false[_2]
#_m
_n = [_undefined[_1], _undefined[_6], _Infinity[_1], _Infinity[_4]].shortestString
_o = _Object[_1]
#_p
#_q
_r = _true[_1]
_s = _false[_3]
_t = [_true[_0], _Infinity[_6], _Object[_6], _Object[_13]].shortestString
_u = [_true[_2], _undefined[_0]].shortestString
#_v
#_w
#_x
_y = _Infinity[_7]
#_z

#capitals
_I = _Infinity[_0]
_N = [_NaN[_0], _NaN[_2]].shortestString
_O = _Object[_8]

#other characters
__space = _Object[_7] #' '
__left_square_bracket = _Object[_0] #[
__right_square_bracket = _Object[_14] #]



_RegExp_test = JSSymbol.new("/./[#{_t+_e+_s+_t}]")
#function test() {
#   [native code]
#}

#letters
_a = [_a, _RegExp_test[_24]].shortestString
#_b = _b
_c = [_c, _RegExp_test[_3], _RegExp_test[_30]].shortestString
_d = [_d, _RegExp_test[_32]].shortestString
#_e = _e
_f = [_f, _RegExp_test[_0]].shortestString
#_g
#_h
_i = [_i, _RegExp_test[_5], _RegExp_test[_26]].shortestString
#_j = _j
#_k
#_l = _l
#_m
_n = [_n, _RegExp_test[_2], _RegExp_test[_7], _RegExp_test[_23]].shortestString
_o = [_o, _RegExp_test[_6], _RegExp_test[_31]].shortestString
#_p
#_q
#_r = _r
#_s = _s
#_t = _t
_u = [_u, _RegExp_test[_1]].shortestString
_v = _RegExp_test[_27]
#_w
#_x
#_y = _y
#_z


#other characters
__space = [__space, _RegExp_test[_8], _RegExp_test[_15], _RegExp_test[_29]].shortestString #' '
__newline = [_RegExp_test[_17], _RegExp_test[_35]].shortestString #'\n'
__left_parenthesis = _RegExp_test[_13] #(
__right_parenthesis = _RegExp_test[_14] #)
__left_brace = _RegExp_test[_16] #{
__right_brace = _RegExp_test[_36] #}
__left_square_bracket = [__left_square_bracket, _RegExp_test[_22]].shortestString #[
__right_square_bracket = [__right_square_bracket, _RegExp_test[_34]].shortestString #]




_RegExp = JSSymbol.new("/./[#{_c+_o+_n+_s+_t+_r+_u+_c+_t+_o+_r}+[]]")
#function RegExp() {
#   [native code]
#}

#letters
_x = _RegExp[_13]
_p = _RegExp[_14]
_g = _RegExp[_11]

#capitals
_R = _RegExp[_9]
_E = _RegExp[_12]



_Function = JSSymbol.new("#{_RegExp_test}[#{_c+_o+_n+_s+_t+_r+_u+_c+_t+_o+_r}+[]]")
#function Function() {
#   [native code]
#}

#capitals
_F = _Function[_9]



_Number = JSSymbol.new("(#{_0})[#{_c+_o+_n+_s+_t+_r+_u+_c+_t+_o+_r}+[]]")
#function Number() {
#   [native code]
#}

#letters
_m = _Number[_11]



_Boolean = JSSymbol.new("(![])[#{_c+_o+_n+_s+_t+_r+_u+_c+_t+_o+_r}+[]]")
#function Boolean() {
#   [native code]
#}

#capitals
_B = _Boolean[_9]



_String = JSSymbol.new("([]+[])[#{_c+_o+_n+_s+_t+_r+_u+_c+_t+_o+_r}+[]]")
#function String() {
#   [native code]
#}

#letters
_g = [_g, _String[_14]].shortestString

#capitals
_S = _String[_9]



_Array = JSSymbol.new("[]")
#function Array() {
#   [native code]
#}

#capitals
_A = _Array[_9]



#letters missing: h, k, q, w, z
#capitals missing: C, D, G, H, J, K, L, M, P, Q, T, U, V, W, X, Y, Z
class JSSymbol
    def self.number(i)
        if i >= 0 and i <= 36
            return TOPLEVEL_BINDING.eval("_#{i}")
        elsif i == -1
            return TOPLEVEL_BINDING.eval("_n1")
        else
            sol = []
            neg = i < 0
            i = i.abs
            (2..36).each { |x|
                if i.remainder(x) == 0 and i / x <= 36
                    sol << TOPLEVEL_BINDING.eval("_#{x}*_#{i/x}")
                end
            }

            a = i.to_s.split("").map { |x| "[#{JSSymbol.number(x.to_i)}]" }.join("+")
            sol << "(+(#{a}))"

            sol = sol.shortestString
            if neg
                sol *= TOPLEVEL_BINDING.eval("_n1")
            end

            return sol
        end
    end
end


def smallestRadixLargerThan(index)
    radixes = []
    (index..36).each { |i| radixes << JSSymbol.number(i) }
    
    return radixes.shortestString
end


_h = JSSymbol.new("(#{_17})[#{_t+_o+_S+_t+_r+_i+_n+_g}](#{smallestRadixLargerThan(18)})")
_k = JSSymbol.new("(#{_20})[#{_t+_o+_S+_t+_r+_i+_n+_g}](#{smallestRadixLargerThan(21)})")
_q = JSSymbol.new("(#{_26})[#{_t+_o+_S+_t+_r+_i+_n+_g}](#{smallestRadixLargerThan(27)})")
_w = JSSymbol.new("(#{_32})[#{_t+_o+_S+_t+_r+_i+_n+_g}](#{smallestRadixLargerThan(33)})")
_z = JSSymbol.new("(#{_35})[#{_t+_o+_S+_t+_r+_i+_n+_g}](#{smallestRadixLargerThan(36)})")



#Commands for convenience
ARGV.each { |command|
    case command
    when "-list", "-l"
        (["Letters"] + "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".chars.to_a + ["Numbers"] + (-1..36).to_a).each { |a|
            if a.class < Integer
                s = a < 0 ? "_n#{a.abs}" : "_#{a}"
            else
                s = "_#{a}"
            end
            
            js = eval("(defined? #{s}) ? #{s} : nil")
            puts "#{a}: #{js}"
        }
    end
}
